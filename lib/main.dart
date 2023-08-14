import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:julishap_civil/config/routes.dart';
import 'package:julishap_civil/config/theming.dart';
import 'package:julishap_civil/presentation/screens/home_screen/home_screen.dart';
import 'config/map_config.dart';
import 'data/models/map_marker_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Julishap',
      theme: AppThemeData.lightTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}



// Stack(
// children: [
// FlutterMap(
// options: MapOptions(
// minZoom: 5,
// maxZoom: 18,
// zoom: 13,
// center: MapConfig.myLocation,
// ),
// children: [
// TileLayer(
// urlTemplate:
// MapConfig.mapUrl,
// additionalOptions: const {
// 'mapStyleId': MapConfig.mapBoxStyleId,
// 'accessToken': MapConfig.mapBoxAccessToken,
// },
// ),
// MarkerLayer(
// markers: [
// for (int i = 0; i < mapMarkers.length; i++)
// Marker(
// height: 40,
// width: 40,
// point: mapMarkers[i].location ?? MapConfig.myLocation,
// builder: (_) {
// return GestureDetector(
// onTap: () {},
// child: Image.asset(
// 'assets/images/marker icon.png',
// ),
// );
// },
// ),
// ],
// ),
//
// ],
// ),
// ],
// )

