import 'package:booking_calendar/helper/font_styles.dart';
import 'package:booking_calendar/theme/colors/app_colors.dart';
import 'package:flutter/material.dart';


class CalendarDates extends StatelessWidget {
  final String day;
  final String date;

  final bool isSelected;

  CalendarDates({required this.day, required this.date, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Column(
        children: <Widget>[
          Text(
            day,
            style: calendarDayStyle,
          ),
          SizedBox(height: 9.0),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:  isSelected?AppColors.globalBlue:null,
            ),
            child: Center(
              child: Text(
                date,
                style: calendarDateStyle.copyWith(color:isSelected?Color.fromRGBO(255, 255, 255, 1):AppColors.dateNotSelected,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}