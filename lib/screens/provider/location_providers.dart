import 'package:flutter/cupertino.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationProvider with ChangeNotifier {
  late double latitude;
  late double longitude;
  bool isPermissionAllowed = false;
  bool loading = false;
  var selectedAddress;

//Get Current Position
  Future<void> getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (position != null) {
      // ignore: unnecessary_this
      this.latitude = position.latitude;
      this.longitude = position.longitude;

      final coordinates = Coordinates(this.latitude, this.longitude);
      final addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      this.selectedAddress = addresses.first;

      // ignore: unnecessary_this
      this.isPermissionAllowed = true;
      notifyListeners();
    } else {
      print('Permissions NOt');
    }
  }

  // Camera Movement
  void onCameraMove(CameraPosition cameraPosition) async {
    this.latitude = cameraPosition.target.latitude;
    this.longitude = cameraPosition.target.longitude;
    notifyListeners();
  }

  //Get MOve Camera Loca
  Future<void> getmoveCamera() async {
    final coordinates = Coordinates(this.latitude, this.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    this.selectedAddress = addresses.first;
    print("${selectedAddress.featureName} : ${selectedAddress.addressLine}");
  }
}
