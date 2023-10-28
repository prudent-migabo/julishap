import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/business_logic/cubits/alerts_cubit/alerts_cubit.dart';
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/presentation/presentation.dart';
import 'package:badges/badges.dart' as badges;

import '../../../main.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName= '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> pages=[
    const DashBoardScreen(),
    const NotificationScreen(),
    const HistoryScreen()
  ];

  int _currentIndex=0;
  void onChangeIndex(int index){
    setState(() {
      _currentIndex=index;
    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ACCEUIL'),
        actions: [
          IconButton(
              onPressed: (){
                context.read<AuthRepository>().logout();
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MyApp()), (route) => false);
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      drawer: const DrawerWidget(),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onChangeIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Acceuil'),
          BottomNavigationBarItem(icon: BlocBuilder<AlertsCubit, AlertsState>(
               builder: (context, state) {
                  List<AlertModel> alerts= state.notificationAlerts.where((e) =>e.status=='pending').toList();
                    return badges.Badge(
                      badgeContent: Text(alerts.length.toString(),style: TextStyle(color: Colors.white,fontSize: 9),),
                      child: Icon(Icons.notifications_none),
                    );
              },
           ),label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historique'),
        ],
      ),
    );
  }
}
