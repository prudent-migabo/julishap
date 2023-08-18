
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/presentation/presentation.dart';
import 'package:julishap_police/presentation/screens/home_screen/home_screen.dart';
import 'package:latlong2/latlong.dart';

import '../wrapper.dart';

class AppRouter{

  static Route onGenerateRoute (RouteSettings settings){
     final data= settings.arguments==null?{}:settings.arguments;
    switch (settings.name){
      case Wrapper.routeName:
        return MaterialPageRoute(builder: (context)=>Wrapper());
      // case CreateAlerteScreen.routeName:
      //   return MaterialPageRoute(builder: (context)=>CreateAlerteScreen());
      case HistoryScreen.routeName:
        return MaterialPageRoute(builder: (context)=>HistoryScreen());
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context)=>HomeScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context)=>LoginScreen());
      case MapScreen.routeName:
        return MaterialPageRoute(builder: (context)=>MapScreen(alert: settings.arguments as AlertModel));
      case NotificationScreen.routeName:
        return MaterialPageRoute(builder: (context)=>NotificationScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (context)=>RegisterScreen());
      case DashBoardScreen.routeName:
        return MaterialPageRoute(builder: (context)=>DashBoardScreen());
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
        builder: (context)=>Scaffold(body: Center(child: Text('Cette Route N\'existe pas'),),));
  }
}