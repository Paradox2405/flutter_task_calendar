import 'package:booking_calendar/views/charts_screen.dart';
import 'package:booking_calendar/views/todo_calendar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calendar',
      home:  LineChartSample8(),
    );
  }
}

