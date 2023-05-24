import 'package:flutter/material.dart';
import 'package:proyect_c1/services/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:convert';

class createUser extends StatefulWidget {
  const createUser({super.key});

  @override
  State<createUser> createState() => _createUserState();
}

class _createUserState extends State<createUser> {
  TextEditingController name = TextEditingController(text: "");
  TextEditingController descripcion = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(hintText: 'Ingrese el nombre: '),
            ),
            TextField(
              controller: descripcion,
              decoration: const InputDecoration(hintText: 'Ingrese la descripcion: '),
            ),
            ElevatedButton(
              onPressed: () async {
                var connectivityResult = await (Connectivity().checkConnectivity());

                if (connectivityResult == ConnectivityResult.none) {
                  // No hay conexión a Internet, guardar los datos en SharedPreferences
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String pendingDataJson = prefs.getString('pendingData') ?? '[]';
                  List<Map<String, dynamic>> pendingData = List<Map<String, dynamic>>.from(
                    jsonDecode(pendingDataJson).map((item) => Map<String, dynamic>.from(item)),
                  );

                  pendingData.add({
                    'name': name.text,
                    'descripcion': descripcion.text,
                  });

                  await prefs.setString('pendingData', jsonEncode(pendingData));

                  // Limpiar los campos de texto
                  name.text = '';
                  descripcion.text = '';

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Datos guardados localmente. Se sincronizarán con Firestore cuando se recupere la conexión a Internet.'),
                    ),
                  );
                } else {
                  // Hay conexión a Internet, guardar los datos directamente en Firestore
                  await crear(name.text, descripcion.text).then((_) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Datos guardados en Firestore.'),
                      ),
                    );
                  });
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
