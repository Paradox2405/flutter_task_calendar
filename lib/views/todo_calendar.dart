import 'package:booking_calendar/helper/data_lists.dart';
import 'package:booking_calendar/helper/font_styles.dart';
import 'package:booking_calendar/theme/colors/app_colors.dart';
import 'package:booking_calendar/widgets/calendar_dates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';

class ToDoCalendar extends StatefulWidget {
  const ToDoCalendar({super.key});

  @override
  State<ToDoCalendar> createState() => _ToDoCalendarState();
}

class _ToDoCalendarState extends State<ToDoCalendar> {
  double draggableLinePosition = 700.0;double draggableContainerPosition = 0.0;
  String selectedMonth = "December";
  int selectedIndex = 0;
  final kToday = DateTime.now();
  final kFirstDay = DateTime(
      DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(
      DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  bool isExpanded = false;
  double initialPosition = 0.0;
  double dragDistanceThreshold = 50.0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: AppColors.headerBackground),
      child: Scaffold(
        backgroundColor: AppColors.mainBackground,
        appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            backgroundColor: AppColors.headerBackground),
        body: SafeArea(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  color: AppColors.headerBackground,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _topBar(),
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        'Appointments',
                        style: headingStyle,
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Keep track of scheduled healthcare visits',
                            style: subtitleStyle,
                          ),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              _showMonthPicker(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "$selectedMonth",
                                  style: monthSelectorStyle,
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: Color.fromRGBO(30, 31, 32, 1),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print('Button Pressed');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "List view",
                                  style: menuName,
                                ),
                                SizedBox(
                                  width: 4.0,
                                ),
                                Icon(
                                  Icons.list_sharp,
                                  color: AppColors.globalBlue,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 14.0,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onVerticalDragUpdate: (details) {
                    if (details.primaryDelta! > 0) {
                      setState(() {
                        draggableContainerPosition += details.primaryDelta!;
                      });
                    } else {
                      if (draggableContainerPosition > 0) {
                        setState(() {
                          draggableContainerPosition += details.primaryDelta!;
                        });
                      }
                    }
                  },
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      if (draggableContainerPosition > dragDistanceThreshold) {
                        setState(() {
                          isExpanded = true;
                        });
                      }
                    } else {
                      if (draggableContainerPosition < dragDistanceThreshold) {
                        setState(() {
                          isExpanded = false;
                        });
                      }
                    }
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: isExpanded ? 300.0 : 108.0,
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 245, 245, 1),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25.0),
                        bottomRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        Expanded(child: _calendarTable()),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(176, 176, 176, 1),
                              borderRadius: BorderRadius.circular(4)),
                          width: 30.0,
                          height: 4.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.0, right: 20.0),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          ListView.builder(
                            itemCount: time.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              Widget taskWidget;
                              if (index < tasksList.length) {
                                taskWidget = tasksList[index];
                              } else {
                                taskWidget = SizedBox.shrink();
                              }
                              return Row(
                                children: [
                                  SizedBox(
                                    width: 40.0,
                                    height: 46.33,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 3.5),
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: Text(
                                          '${time[index] < 10 ? '0' : ''}${time[index]}:00',
                                          style: timeStyle,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 314.0,
                                    height: 46.33,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            width: 1.0,
                                            color: AppColors.calendarBorders),
                                        left: BorderSide(
                                            width: 1.0,
                                            color: AppColors.calendarBorders),
                                      ),
                                    ),
                                    child: taskWidget,
                                  ),
                                ],
                              );
                            },
                          ),
                          Positioned(
                            top: draggableLinePosition,
                            left: 4,
                            right: 0,
                            child: GestureDetector(
                              onVerticalDragUpdate: (details) {
                                setState(() {
                                  draggableLinePosition +=
                                      details.primaryDelta!;
                                });
                              },
                              child: Row(
                                children: [
                                  Text("16:40 ",
                                      style: dragLineTextStyle.copyWith(
                                          color: AppColors.globalBlue)),
                                  Container(
                                    width: 10.0,
                                    height: 10.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.globalBlue,
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        height: 2.0,
                                        color: AppColors.globalBlue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Button pressed");
          },
          backgroundColor: AppColors.globalBlue,
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        Image.asset(
          "assets/dp.png",
          height: 46,
          width: 53,
        ),
        Spacer(),
        Container(
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 55,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Image.asset(
            "assets/qr.png",
            height: 40,
            width: 40,
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Container(
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 55,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Image.asset(
            "assets/mail.png",
            height: 40,
            width: 40,
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Container(
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 55,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Image.asset(
            "assets/notifications.png",
            height: 40,
            width: 40,
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Container(
          width: 40,
          height: 40,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            shadows: [
              BoxShadow(
                color: Color(0x0C000000),
                blurRadius: 55,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Image.asset(
            "assets/more.png",
            height: 40,
            width: 40,
          ),
        ),
      ],
    );
  }

  Widget _calendarTable() {
    return TableCalendar(
      shouldFillViewport: true,
      rowHeight: 44,
      headerVisible: false,
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      calendarFormat: isExpanded ? CalendarFormat.month : CalendarFormat.week,
      onPageChanged: (focusedDay) {
        setState(() {
          _focusedDay = focusedDay;
        });
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _selectedDay = selectedDay;
          _focusedDay = focusedDay;
        });
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        selectedDecoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.globalBlue,
        ),
        outsideTextStyle: calendarDateStyle,
        selectedTextStyle: calendarDateStyle.copyWith(color: Colors.white),
        defaultTextStyle:calendarDateStyle,
        weekendTextStyle: calendarDateStyle,
        holidayTextStyle: calendarDateStyle,
        todayTextStyle: calendarDateStyle,
        todayDecoration:BoxDecoration() ,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(weekdayStyle: calendarDayStyle,weekendStyle: calendarDayStyle),
    );
  }

  void _showMonthPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 500,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Select Month',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 10.0),
                  child: ListView.builder(
                    itemCount: 12,
                    itemBuilder: (BuildContext context, int index) {
                      final month = DateTime.now().month + index;
                      return ListTile(
                        title: Text(getMonthName(month)),
                        onTap: () {
                          setState(() {
                            selectedMonth = getMonthName(month);
                          });
                          Navigator.pop(context, month);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
