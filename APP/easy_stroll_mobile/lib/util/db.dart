import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class DB {

//  Future<bool> bindWalker(String uid, String wid);

//  Future<double> getWalkerLastUpdated(String uid);

//  Future<List<Map<double, LatLng>>> getWalkerLoc(String uid);

//  Future<LatLng> getPos(String uid);

}

class EasyStrollDB implements DB {
  final databaseReference = FirebaseDatabase.instance.reference();
//  final databaseReference = FirebaseDatabase.instance.reference().child('client');

  Future<String> getAll() async {
    DataSnapshot data = await databaseReference.once();
    return 'Data: ${data.value}';
  }

  @override
  Future<LatLng> getPos(String ccid) async {
    DataSnapshot data = await databaseReference.once();
    double lat = data.value['walker'][ccid]['lat'];
    double lon = data.value['walker'][ccid]['lon'];
    return LatLng(lat, lon);
  }


}