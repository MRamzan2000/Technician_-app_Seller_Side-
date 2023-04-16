import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as loc;

import '../Type of work/Type_of_work.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final places = GoogleMapsPlaces(apiKey: 'AIzaSyBvNhzLGOSUILk4xtwuGpMBtct3L4790-I');
  final TextEditingController _searchController = TextEditingController();
  List<Prediction> _suggestions = [];
  Completer<GoogleMapController> _controllerCompleter = Completer();
  double latitude = 0.0;
  double longitude = 0.0;
  final loc.Location location = loc.Location();
  late bool _serviceEnabled;
  late loc.PermissionStatus _permissionGranted;
  late loc.LocationData _locationData;

  @override
  void initState() {
    super.initState();
    print(places);
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == loc.PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != loc.PermissionStatus.granted) {
        _locationData = await location.getLocation();
        setState(() {
          longitude = _locationData.longitude!;
          latitude = _locationData.latitude!;
          print("Longitude: $longitude");
          print("Latitude: $latitude");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: latitude==0.0&&longitude==0.0?LatLng(31.453246, 74.293170):LatLng(latitude, longitude),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controllerCompleter.complete(controller);
              },
              markers: LatLng(31.453246, 74.293170) != null
                  ? Set<Marker>.of([
                Marker(
                  markerId: MarkerId("current_location"),
                  position: LatLng(31.453246, 74.293170),
                  infoWindow: InfoWindow(
                    title: "Current Location",
                    snippet: "This is your current location.",
                  ),
                ),
              ])
                  : null,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Type_of_work();
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(32),
                          bottomRight: Radius.circular(32))),
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3.2,
                  child: Center(
                      child: Text(
                    "Service App",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  )),
                ),
              ),
            ),
            // Center(child: Image.asset("assets/Group 11971.png")),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(50)),
                  height: 180,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Select Your Location",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      SizedBox(height: 10),
                      Stack(
                        children: [
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            bottom: 40, // Set the bottom value to the height of the text field container
                            child: ListView.builder(
                              itemCount: _suggestions.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(_suggestions[index].description),
                                  onTap: () {
                                    _onSuggestionSelected(_suggestions[index]);
                                  },
                                );
                              },
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(32),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 3,
                                    offset: Offset(1.0, 2.0),
                                  )
                                ],
                              ),
                              height: 40, // Updated the height to 40 for a better visual appearance
                              width: MediaQuery.of(context).size.width / 1.2,
                              child: TextFormField(
                                controller: _searchController,
                                onChanged: (value) {
                                  _onSearchChanged(value);
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(bottom: 20),
                                  prefixIcon: SvgPicture.asset(
                                    "assets/Service Search.svg",
                                    fit: BoxFit.scaleDown,
                                  ),
                                  hintText: "Type your address here",
                                  hintStyle:
                                  TextStyle(fontSize: 9, color: Color(0xffACACAC)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(32),
                      //       boxShadow: [
                      //         BoxShadow(
                      //             color: Colors.grey,
                      //             blurRadius: 3,
                      //             offset: Offset(1.0, 2.0))
                      //       ]),
                      //   height: 30,
                      //   width: MediaQuery.of(context).size.width / 1.2,
                      //   child: TextFormField(
                      //     controller: _searchController,
                      //     onChanged: (value) {
                      //       _onSearchChanged(value);
                      //     },
                      //     decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         contentPadding: EdgeInsets.only(bottom: 20),
                      //         prefixIcon: SvgPicture.asset(
                      //           "assets/Service Search.svg",
                      //           fit: BoxFit.scaleDown,
                      //         ),
                      //         hintText: "Type your address here",
                      //         hintStyle: TextStyle(
                      //             fontSize: 9, color: Color(0xffACACAC))),
                      //   ),
                      // ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/serviceLocation.svg"),
                            SizedBox(width: 5),
                            Text(
                              "21, Alex Davidson Avenue, Opposite Omegatron, Vicent",
                              style: TextStyle(fontSize: 10, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: 170,
                        height: 33,
                        child: ElevatedButton(
                            onPressed: ()async{
                              print(places.apiKey);
                              print(places.httpClient);
                              await places.autocomplete("Lahore", types: ['(cities)']).then((value) => {
                                print(value.predictions),
                                print(value.status),
                                print(value.errorMessage)
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Color(0xff9C3587),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32))),
                            child: Text(
                              "Select current address",
                              style: TextStyle(fontSize: 11, color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
    );
  }

  void _onSearchChanged(String query) async {
    if (query.isNotEmpty) {
      PlacesAutocompleteResponse response = await places.autocomplete(query, types: ['(cities)']);
      print(query);
      print(response.predictions);
      setState(() {
        _suggestions = response.predictions;
      });
    } else {
      setState(() {
        _suggestions.clear();
      });
    }
  }

  void _onSuggestionSelected(Prediction suggestion) async {
    print(suggestion);
    PlacesDetailsResponse response = await places.getDetailsByPlaceId(suggestion.placeId);
    double latitude = response.result.geometry.location.lat;
    double longitude = response.result.geometry.location.lng;
    print(longitude);
    print(latitude);
    print(response);
    // Use latitude and longitude to display the location on a map
  }
}
