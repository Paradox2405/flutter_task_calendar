import 'package:booking_calendar/helper/font_styles.dart';
import 'package:flutter/material.dart';


class TaskContainer extends StatelessWidget {
  final String title;
  final Color mainColor;
  final Color bgColor;
  final bool? heightAdj;
  
  TaskContainer({
    required this.title, required this.mainColor,required this.bgColor, this.heightAdj=false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: heightAdj!=false?EdgeInsets.only(
          top: 8.0,bottom: 12, left: 4):EdgeInsets.symmetric(
          vertical: 1.0, horizontal: 4),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: mainColor,width: 1.0),
          borderRadius: BorderRadius.circular(3.0)
        ),
        child: Container(
          padding: EdgeInsets.only(left: 12.0),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: taskHeader.copyWith(color: mainColor),
          ),
        ),
      ),
    );
  }
}