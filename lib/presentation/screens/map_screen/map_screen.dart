import 'package:flutter/material.dart';
import 'package:julishap_civil/presentation/screens/create_alert_screen/create_alert_screen.dart';

class MapScreen extends StatefulWidget {
  static const String routeName= '/map';

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15,bottom: 15),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, CreateAlerteScreen.routeName);
                  },
                  child: Text('Creer L\'alerte'),
                ),
              ))

        ],
      ),
    );
  }
}
