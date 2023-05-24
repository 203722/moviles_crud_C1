import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyect_c1/data/data_sync.dart';
import 'firebase_options.dart';
import 'package:proyect_c1/pages/home_page.dart';
import 'package:proyect_c1/pages/create_page.dart';
import 'package:proyect_c1/pages/update_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Sincronizar los datos pendientes con Firestore al iniciar la aplicación
  await syncDataWithFirestore();

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/create': (context) => const createUser(),
        '/update': (context) => const updateUser(),
      },
    );
  }
}
