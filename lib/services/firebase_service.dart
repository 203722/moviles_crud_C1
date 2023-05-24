import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List usuarios = [];
  CollectionReference collectionReferenceUsuario = db.collection('usuarios');

  QuerySnapshot queryUsuario = await collectionReferenceUsuario.get();

  for (var doc in queryUsuario.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "name": data['name'],
      "descripcion": data['descripcion'],
      "uid": doc.id,
    };
    usuarios.add(person);
  }
  return usuarios;
}

Future<void> crear(String name, descripcion) async {
  await db.collection('usuarios').add({'name': name, 'descripcion': descripcion});
}

Future<void> update(String uid, String newName, newDescripcion) async {
  await db.collection('usuarios').doc(uid).set({"name": newName, "descripcion": newDescripcion});
}

Future<void> delete(String uid) async {
  await db.collection('usuarios').doc(uid).delete();
}

Future<void> syncDataWithFirestore() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? pendingDataJson = prefs.getString('pendingData');

  if (pendingDataJson != null) {
    List<Map<String, dynamic>> pendingData = List<Map<String, dynamic>>.from(
      jsonDecode(pendingDataJson).map((item) => Map<String, dynamic>.from(item)),
    );

    for (var data in pendingData) {
      await crear(data['name'], data['descripcion']);
    }

    // Borrar los datos pendientes en SharedPreferences después de sincronizarlos con Firestore
    prefs.remove('pendingData');
  }
}
