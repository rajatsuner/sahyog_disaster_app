import 'dart:async';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CivilMapView extends StatefulWidget {
  CivilMapView({Key? key}) : super(key: key);

  @override
  State<CivilMapView> createState() => _CivilMapViewState();
}

class _CivilMapViewState extends State<CivilMapView> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition currentPositionCamera = CameraPosition(
    target: LatLng(19.8477472, 75.3295456),
    zoom: 17,
  );

  late LocationPermission permission;

  late bool serviceEnabled;

  @override
  void initState() {
    super.initState();
    askForPermission();
  }

  askForPermission() async {
    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Future.error('Location services are disabled.');
    } else {
      print("permisison enabled");
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Future.error('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: currentPositionCamera,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }
}
