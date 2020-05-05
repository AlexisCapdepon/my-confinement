import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myconfinement/core/api_service.dart';
import 'package:myconfinement/core/model/VelovStation.dart';

class GoogleMapView extends StatefulWidget {
  @override
  _GoogleViewState createState() => _GoogleViewState();
}

class _GoogleViewState extends State<GoogleMapView> {
  ApiService service = ApiService.getInstance();
  Set<Marker> allMarkers = {};
  var currentLocation;
  bool mapToggle = false;
  GoogleMapController mapController;

@override
  void initState() {
    super.initState();
    Geolocator().getCurrentPosition().then((currLoc) {
      setState(() {
       allMarkers.add(Marker(
        markerId: MarkerId("c'est moi"),
        position: LatLng(currLoc.latitude, currLoc.longitude),
        ));
        currentLocation = currLoc;
        mapToggle = true;
      });
    });
  }

addStationInMarker() async {
  VelovStation stations = await service.getVelovStation();

  for (var resultStation in stations.records) {
    setState(() {
      allMarkers.add(
        Marker(
           markerId: MarkerId(resultStation.recordid),
            position: LatLng(resultStation.fields.geoPoint2D.first,resultStation.fields.geoPoint2D.last),
            infoWindow: InfoWindow(
              title: resultStation.fields.name,
              snippet: resultStation.fields.bikeStand),

        ));
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("googleMap"),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: mapToggle ? 
          GoogleMap(
            onMapCreated: onMapCreated, 
            initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation.latitude, currentLocation.longitude),
              zoom: 18,
            ),
            markers: allMarkers, 
          ):
          Center(
            child: 
            Text("Loading please wait..",
            style: TextStyle(fontSize: 20.0),
            ),
          )
        ),
        ),
    );
  } 
  void onMapCreated (controller) {
    setState(() {
      mapController = controller;
      addStationInMarker();
    });
  }

}