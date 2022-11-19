import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CivilMapController extends GetxController {
  var markersSet = {}.obs;
  var hospitalMarkersSet = {}.obs;
  var rescueMemberMarkersSet = {}.obs;

  var hospitalMarker = Marker(
      markerId: MarkerId("markerid1"),
      infoWindow: InfoWindow(
          title: "Hospital 1", snippet: "Call:1234567890\nBeds Available: 28"));

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
