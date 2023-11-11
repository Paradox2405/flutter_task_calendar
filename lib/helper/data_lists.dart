import 'package:booking_calendar/widgets/task_container.dart';
import 'package:flutter/material.dart';

List<String> days = [
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat'
];
List<String> dates = [
  '5',
  '6',
  '7',
  '8',
  '9',
  '10',
  '11',
  '12',
  '13',
  '14',
  '15',
  '16',
  '17',
  '18'
];

List<int> time = [
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  00
];

List<Widget> tasksList = [
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),  SizedBox.shrink(),  SizedBox.shrink(),  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  TaskContainer(
    title: "Mental health checking",
    mainColor: Color.fromRGBO(44, 90, 65, 1),
    bgColor: Color.fromRGBO(143, 220, 178, 1),
  ),
  SizedBox.shrink(),
  TaskContainer(
    title: "Mental health checking",
    mainColor: Color.fromRGBO(249, 83, 83, 1),
    bgColor: Color.fromRGBO(255, 238, 238, 1),
  ),
  SizedBox.shrink(),
  SizedBox.shrink(),
  SizedBox.shrink(),
  TaskContainer(
    title: "Appointment with endocrinologist",
    mainColor: Color.fromRGBO(47, 144, 176, 1),
    bgColor: Color.fromRGBO(213, 233, 239, 1),heightAdj: true,
  ),
];

String getMonthName(int month) {
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return months[(month - 1) % 12];
}
