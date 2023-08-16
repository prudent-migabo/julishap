// import 'package:latlong2/latlong.dart';

import 'package:latlong2/latlong.dart';

class MapConfig {
  static const String mapBoxAccessToken = 'pk.eyJ1IjoiaWJyaWQiLCJhIjoiY2xsZGYxZHkxMGI2djNjbHdjNnRrbTFpdSJ9.GZI1QMMiK_oo0vMHEIsgsA';

  static const String mapBoxStyleId = 'clkrgd6nf00ox01pb9we5f804';

  static const String mapUrl = "https://api.mapbox.com/styles/v1/ibrid/clldked4800yo01ph74l8em6j/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaWJyaWQiLCJhIjoiY2xsZGYxZHkxMGI2djNjbHdjNnRrbTFpdSJ9.GZI1QMMiK_oo0vMHEIsgsA";

  static LatLng myLocation = LatLng(51.5090214, -0.1982948);
}
