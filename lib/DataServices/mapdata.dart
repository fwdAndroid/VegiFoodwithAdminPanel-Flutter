import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_geocoder/geocoder.dart' as geoCo;

String finalAddress = 'Searching Areas';

class GenerateMap extends ChangeNotifier {
  Position? position;
  LocationPermission? permission;

  Future getCurrentUserLocation() async {
    permission = await Geolocator.requestPermission();
    var positionData = await GeolocatorPlatform.instance.getCurrentPosition();
    final coords =
        geoCo.Coordinates(positionData.latitude, positionData.longitude);
    var address =
        await geoCo.Geocoder.local.findAddressesFromCoordinates(coords);
    String? mainAddress = address.first.addressLine;
    print(mainAddress);
    finalAddress = mainAddress!;
    notifyListeners();
  }
}
