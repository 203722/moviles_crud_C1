import 'package:flutter/material.dart';
import 'package:proyect_c1/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('material app bar'),
        ),
        body: FutureBuilder(
            future: getPeople(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index){
                    return Dismissible(
                      onDismissed: (direction) async {await delete(snapshot.data?[index]['uid']);snapshot.data?.removeAt(index);},
                      confirmDismiss: (direction) async {
                        bool result =false;
                        result=await showDialog(context: context, builder: (context){
                          return AlertDialog(
                            title: Text("¿Está seguro de eliminar a ${snapshot.data?[index]['name']}?"),
                            actions: [
                              TextButton(onPressed: (){return Navigator.pop(context,false);}, child: const Text("cancelar", style: TextStyle(color: Colors.red),)),
                              TextButton(onPressed: (){return Navigator.pop(context,true);}, child: const Text("Si, Estoy seguro")),
                            ],
                          );
                        });
                        return result;
                      },
                      background: Container(
                        color: Colors.red,
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.startToEnd,
                      key: Key(snapshot.data?[index]['uid']),
                      child: ListTile(
                        title: Text(snapshot.data?[index]['name']+" "+snapshot.data?[index]['descripcion']),
                      onTap: () async {
                        await Navigator.pushNamed(context, '/update', arguments: {'name': snapshot.data?[index]['name'],'descripcion': snapshot.data?[index]['descripcion'],"uid":snapshot.data?[index]['uid'],}); 
                        setState(() {});
                      },
                    )
                    );
                  },
                );
              } else {
                return const Center(
                  child:  CircularProgressIndicator(),
                );
              }
            }),
            floatingActionButton: FloatingActionButton(
              onPressed: () async{
                await Navigator.pushNamed(context, '/create');
                setState(() {});
              },
              child: const Icon(Icons.add),
            ),
            );
  }
}
