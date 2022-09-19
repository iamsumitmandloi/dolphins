import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc/home_bloc.dart';
import 'package:new_app/data/ticker.dart';
import 'package:new_app/observer.dart';
import 'package:new_app/ui/home_view.dart';
import 'package:bloc/bloc.dart';

void main() {
  //used bloc observer for observe every state change
  Bloc.observer = AppObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(ticker: const Ticker()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Interview Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const HomePage(),
      ),
    );
  }
}

