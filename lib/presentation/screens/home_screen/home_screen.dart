import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_civil/business_logic/cubits/cubits.dart';
import 'package:julishap_civil/main.dart';
import 'package:julishap_civil/presentation/presentation.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName= '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> pages=[
    const MapScreen(),
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
        leading: Builder(
          builder: (context) {
            return InkWell(
              onTap: (){
                Scaffold.of(context).openDrawer();
              },
                child: const Icon(Icons.menu, color: Colors.white,));
          }
        ),
        actions: [
          IconButton(
              onPressed: (){
            context.read<AuthCubit>().signOut();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MyApp()), (route) => false);
          }, icon: const Icon(Icons.logout, color: Colors.white,))
        ],
        title: const Text('ACCEUIL', style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      drawer: const DrawerWidget(),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onChangeIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black45,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Historique'),
        ],
      ),
    );
  }
}
