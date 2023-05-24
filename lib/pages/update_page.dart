import 'package:flutter/material.dart';
import 'package:proyect_c1/services/firebase_service.dart';

class updateUser extends StatefulWidget{
  const updateUser({super.key});

  @override
  State<updateUser> createState() => _updateUserState();
}

class _updateUserState extends State<updateUser> {
  TextEditingController name = TextEditingController(text: "");
  TextEditingController descripcion = TextEditingController(text: "");


  @override
  Widget build(BuildContext context){

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    name.text = arguments['name'];
    descripcion.text = arguments['descripcion'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
          TextField(
            controller: name,
            decoration: const InputDecoration(
              hintText: 'Ingrese el nombre: '
            ),
          ),
          TextField(
            controller: descripcion,
            decoration: const InputDecoration(
              hintText: 'Ingrese la descripcion: '
            ),
          ),
          ElevatedButton(onPressed: () async {
            await update(arguments['uid'], name.text, descripcion.text).then((_) => {Navigator.pop(context)});
          }, 
          child: const Text('Actualizar'))
        ],
      ),
      ),
    );
  }
}