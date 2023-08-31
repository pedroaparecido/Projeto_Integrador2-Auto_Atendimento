// import 'package:location/location.dart';
// import 'package:flutter/material.dart';

// class LocationWidget extends StatelessWidget {
//   const LocationWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
        // children: const <Widget>[
        //   SizedBox(height: 16),
        //   PermissionStatusWidget(),
        //   Divider(height: 32),
        //   ServiceEnabledWidget(),
        //   Divider(height: 32),
        //   GetLocationWidget(),
        //   Divider(height: 32),
        //   ListenLocationWidget(),
        //   Divider(height: 32),
        //   ChangeSettings(),
        //   Divider(height: 32),
        //   ChangeNotificationWidget()
        // ],
        // );

//     final Location location = Location();

//     Location location = new Location();

// bool _serviceEnabled;
// PermissionStatus _permissionGranted;
// LocationData _locationData;

// _serviceEnabled = await location.serviceEnabled();
// if (!_serviceEnabled) {
//   _serviceEnabled = await location.requestService();
//   if (!_serviceEnabled) {
//     return;
//   }
// }

// _permissionGranted = await location.hasPermission();
// if (_permissionGranted == PermissionStatus.denied) {
//   _permissionGranted = await location.requestPermission();
//   if (_permissionGranted != PermissionStatus.granted) {
//     return;
//   }
// }

// _locationData = await location.getLocation();
//   }
// }
