import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/screens/authentications/loginscreen.dart';
import 'package:vegifood/screens/mainappscreens/homescreen.dart';
import 'package:vegifood/screens/provider/auth_providers.dart';
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
  bool loadingData = false;
  bool isLoggedIn = false;
  User? user;

  @override
  void initState() {
    // CHecked User is login or not
    getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final locationData = Provider.of<LocationProvider>(context);
    final authData = Provider.of<AuthProvider>(context);

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
              setState(() {
                loadingData = true;
              });
              locationData.onCameraMove(po);
            },
            onMapCreated: onCreated,
            onCameraIdle: () {
              setState(() {
                loadingData = false;
              });
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
          Center(
            child: SpinKitPulse(
              color: Colors.black,
              size: 50.0,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loadingData
                      ? LinearProgressIndicator(
                          backgroundColor: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        )
                      : Container(),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.location_searching),
                          label: Text(
                            loadingData
                                ? 'locating'
                                : locationData.selectedAddress.featureName,
                          ))),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(locationData.selectedAddress.addressLine),
                  ),
                  AbsorbPointer(
                    absorbing: loadingData ? true : false,
                    child: TextButton(
                      onPressed: () {
                        if (isLoggedIn == false) {
                          Navigator.pushNamed(context, LoginScreen.id);
                        } else {
                          authData.updateUsers(
                              id: user!.uid,
                              phonenumber: user!.phoneNumber.toString(),
                              latitude: locationData.latitude,
                              longitude: locationData.longitude,
                              address:
                                  locationData.selectedAddress.addressLine);
                          Navigator.pushNamed(context, HomeScreen.id);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width - 40,
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'CONFRIM LOCATION',
                          style: TextStyle(
                            color: loadingData ? Colors.green : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  getCurrentUser() {
    user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        isLoggedIn = true;
      });
    }
  }
}
