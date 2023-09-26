import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_intern_assignment/routes/routes.dart';
import 'package:mobile_intern_assignment/screen/home/home_screen.dart';

import 'bloc/home/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: route,
      theme: ThemeData(
      ),
      home: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
    child: HomeScreen(),
    ),
    );
  }
}

