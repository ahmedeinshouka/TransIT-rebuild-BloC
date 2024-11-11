import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:untitled5/Ui/Screens/BusTimeTable/BusTimetable.dart';
import 'package:untitled5/Ui/Screens/HomePage/HomePage.dart';
import 'package:untitled5/Ui/Screens/Splash/Splash.dart';
import 'package:untitled5/Ui/Screens/Intro/Intro.dart';
import 'package:untitled5/Ui/Screens/ShowMap/ShowMap.dart';
import 'ReusedWidets/BusScheduleWidget/cubit/bus_schedule_widget_cubit.dart'; // Import your cubit

import 'Ui/Screens/ShowMap/cubit/map_cubit_cubit.dart';
import 'SharedData/UsedData/BusLineInfo.dart'; // Import the BusCubit

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BusScheduleCubit>(
          create: (context) => BusScheduleCubit(),
        ),
        BlocProvider<BusCubit>(
          create: (context) => BusCubit(buses), // Pass the initial bus data if needed
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/Intro': (context) => Intro(),
          '/Home': (context) => Home(),
          '/BusTimetable': (context) => BusTimetable(),
          '/showmap': (context) => ShowMap(),
        },
      ),
    );
  }
}
