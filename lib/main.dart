import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_civil/config/routes.dart';
import 'package:julishap_civil/config/theming.dart';
import 'package:julishap_civil/data/data.dart';
import 'package:julishap_civil/wrapper.dart';

import 'business_logic/cubits/cubits.dart';
import 'firebase_options.dart';



Future<void> main() async {
 await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context)=>AuthRepository(auth: FirebaseAuth.instance)),
        RepositoryProvider(create: (context)=>AlertsRepository()),
        BlocProvider(create: (context)=>AuthCubit(authRepository: context.read<AuthRepository>())),
        BlocProvider<AuthStreamCubit>(create: (context)=>AuthStreamCubit(authRepository: context.read<AuthRepository>())),
        BlocProvider<AuthSwitchCubit>(create: (context)=>AuthSwitchCubit()),
        BlocProvider(create: (context)=>AlertsCubit(alertsRepository: context.read<AlertsRepository>(),
            uid: context.read<AuthStreamCubit>().state.uid, authRepository: context.read<AuthRepository>()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Julishap',
        theme: AppThemeData.lightTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: Wrapper.routeName,
      ),
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

