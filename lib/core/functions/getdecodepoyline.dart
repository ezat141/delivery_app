import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Set<Polyline>> getPolyLine(lat, long, destlat, destlong) async {
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineSet = {};

  String url =
      'https://maps.googleapis.com/maps/api/directions/json?origin=$lat,$long&destination=$destlat,$destlong&key=AIzaSyB9D7nPuNJJHNFB-IgIPYZfXMri_OHBPNs';
  try {
    Dio dio = Dio();
    var response = await dio.post(url);
    var responsebody = response.data;
    var point = responsebody['routees'][0]['overview_polyline']['points'];
    List<PointLatLng> result = polylinePoints.decodePolyline(point);
    print(result);

    if (result.isNotEmpty) {
      result.forEach(((PointLatLng point) {
        polylineco.add(LatLng(point.latitude, point.longitude));
        print(polylineco);
      }));
    }

    Polyline polyline = Polyline(
      polylineId: const PolylineId('poly'),
      color: Colors.blue,
      points: polylineco,
      width: 5,
    );
    polylineSet.add(polyline);
  } catch (e) {
    print('Error: $e');
  }
  return polylineSet;
}
