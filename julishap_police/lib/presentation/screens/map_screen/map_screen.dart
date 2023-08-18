import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/presentation/presentation.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../../config/map_config.dart';

class MapScreen extends StatefulWidget {
  static const String routeName= '/map';
  AlertModel alert;
  MapScreen({Key? key, required this.alert}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapController mapController=MapController();

  late LocationData _locationData;
  List<Marker> markers=[];


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getPermissionLocation();

    });
    super.initState();

  }


  // floatingActionButton: FloatingActionButton(
  // onPressed: () {
  // controller.animateCamera(
  // CameraUpdate.newCameraPosition(_initialCameraPosition));
  // },
  // child: const Icon(Icons.my_location),
  // ),

  void getPermissionLocation()async{

    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
   dynamic data= await MapRepository().getDirection(LatLng(_locationData.latitude!, _locationData.longitude!),
       LatLng(widget.alert.location.latitude, widget.alert.location.longitude));
   print('uuuuuuuuuuuu${data}');
    mapController.move(LatLng(_locationData.latitude!,_locationData.longitude!), 20);


    setState(() {
       markers.add(
           Marker(point: LatLng(_locationData.latitude!,_locationData.longitude!),
           builder: (context){
             return Icon(Icons.location_on, color: Colors.red,);
           }));
    });

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color:Colors.red,
            width: double.infinity,
            height: double.infinity,
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                minZoom: 5,
                maxZoom: 18,
                zoom: 13,
                center: MapConfig.myLocation,
              ),
              children: [
                TileLayer(
                  urlTemplate: MapConfig.mapUrl,
                  additionalOptions: {
                    'mapStyleId': MapConfig.mapBoxStyleId,
                    'accessToken': MapConfig.mapBoxAccessToken,
                  },
                ),
                MarkerLayer(markers: markers,),
              ],
            )
          ),

          Positioned(
            top: 15,
              right: 15,
              child:
              GestureDetector(
                onTap: (){
                  mapController.move(LatLng(_locationData.latitude!,_locationData.longitude!), 20);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child:
                  Icon(Icons.my_location_outlined,color: Colors.white,),
                ),
              )
          ),


          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15,bottom: 20),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: (){},
                        child: Text('Accepter')),
                    SizedBox(width: 10,),
                    OutlinedButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text('decliner')),
                  ],
                )
              ))

        ],
      ),
    );
  }
}
