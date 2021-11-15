import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/screens/provider/location_providers.dart';

class MapScreen extends StatefulWidget {
  static const String id = 'map-screen';
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LatLng currentLocation;
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    setState(() {
      currentLocation = LatLng(locationData.latitude, locationData.longitude);
    });

    void onCreated(GoogleMapController controller) {
      setState(() {
        googleMapController = controller;
      });
    }

    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: currentLocation,
              zoom: 14.4746,
            ),
            zoomControlsEnabled: false,
            minMaxZoomPreference: MinMaxZoomPreference(1.5, 20.5),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            mapType: MapType.normal,
            mapToolbarEnabled: true,
            onCameraMove: (CameraPosition po) {
              locationData.onCameraMove(po);
            },
            onMapCreated: onCreated,
            onCameraIdle: () {
              locationData.getmoveCamera();
            },
          ),
          Center(
            child: Container(
              height: 40,
              margin: EdgeInsets.only(bottom: 50),
              child: Image.asset(
                'assets/marker.png',
                height: 40,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                children: [
                  Text(locationData.selectedAddress.featureName),
                  Text(locationData.selectedAddress.addressLine)
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
