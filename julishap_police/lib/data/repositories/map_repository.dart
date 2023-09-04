

import 'package:julishap_police/config/map_config.dart';
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/data/services/services.dart';
import 'package:latlong2/latlong.dart';

class MapRepository{

  Future getDirection(LatLng origin, LatLng destination)async{

    try{

      dynamic data= await Services.get('https://api.mapbox.com/directions/v5/mapbox/driving/${origin.longitude}%2C${origin.latitude}%3B${destination.longitude}%2C${destination.latitude}?annotations=distance%2Cduration&overview=full&geometries=geojson&access_token=${MapConfig.mapBoxAccessToken}');
       print('vvvvvvv${data}');
       return await DirectionModel.fromMap(data);
    }on CustomError{
       rethrow;
    }

  }
}