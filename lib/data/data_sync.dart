import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:proyect_c1/services/firebase_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> syncDataWithFirestore() async {
  // Verificar la conexión a Internet
  var connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult != ConnectivityResult.none) {
    // Obtener los datos pendientes de SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? pendingDataJson = prefs.getString('pendingData');

    if (pendingDataJson != null) {
      List<Map<String, dynamic>> pendingData = List<Map<String, dynamic>>.from(
        jsonDecode(pendingDataJson).map((item) => Map<String, dynamic>.from(item)),
      );

      // Sincronizar los datos pendientes con Firestore
      for (var data in pendingData) {
        await crear(data['name'], data['descripcion']);
      }

      // Borrar los datos pendientes de SharedPreferences
      prefs.remove('pendingData');
    }
  }
}
