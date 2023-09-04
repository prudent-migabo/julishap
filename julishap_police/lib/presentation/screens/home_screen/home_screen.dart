import 'package:flutter/material.dart';
import 'package:julishap_police/presentation/presentation.dart';

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
        title: const Text('HOME'),
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none),label: "Notification"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
      ),
    );
  }
}
