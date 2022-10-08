import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String? getImageURL(List<String>? imgLiat) {
  // Add your function code here!
  return imgLiat![0].toString();
}

String? geoDistance(
  LatLng? geo1,
  LatLng? geo2,
) {
  // distance between two geo points
  double distance = 0.0;
  final p1Lat = geo1!.latitude;
  final p1Lon = geo1.longitude;
  final p2Lat = geo2!.latitude;
  final p2Lon = geo2.longitude;
  final R = 6378.137; // Radius of earth in KM
  final dLat = ((p2Lat - p1Lat)) / 2;

  final dLon = ((p2Lon - p1Lon)) / 2;
  final a = math.sin(dLat) * math.sin(dLat) +
      math.cos(p1Lat) * math.cos(p2Lat) * math.sin(dLon) * math.sin(dLon);
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  distance = (R * c);

  return distance.toStringAsFixed(0);
}

String? openMap(LatLng? coordinents) {
  final alatitude = coordinents!.latitude;
  final blatitude = coordinents.longitude;
  // Add your function code here!
  return 'https://www.google.com/maps/search/?api=1&query=$alatitude,$blatitude';
}

bool? isPhotoUploaded(String? uploadedFileUrl) {
  // Add your function code here!
  if (uploadedFileUrl!.isEmpty) {
    return false;
  } else {
    return true;
  }
}

String readDoc(DocumentReference? docRef) {
  String? name = '';
  if (docRef != null) {
    docRef.get().then(
          (snapshot) => {
            if (snapshot.exists)
              {name = snapshot.get('cityname')}
            else
              name = '...'
          },
        );
  }
  return name!;
}

String imagePathToString(String? imgPath) {
  // Add your function code here!
  return imgPath.toString();
}
