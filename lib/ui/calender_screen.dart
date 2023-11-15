import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Image.asset(
          'asset/logo.png',
          scale: 1,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const CalendarWidget(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: CircularPercentIndicator(
              radius: 120.0,
              lineWidth: 20.0,
              percent: 0.6,
              center: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '04',
                    style: TextStyle(fontSize: 54, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Days to go',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              // progressColor: Colors.green,
              // circularStrokeCap: CircularStrokeCap.round,
              // arcType: ArcType.FULL,
              // arcBackgroundColor: Colors.transparent,
              // backgroundColor: Colors.transparent,
              linearGradient: const LinearGradient(
                colors: [
                  Colors.green,
                  Colors.yellow,
                  Colors.red,
                ],
                stops: [0.0, 0.5, 1.0], // Gradient stops
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarFormat calendarFormat = CalendarFormat.week;
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;

  @override
  void initState() {
    super.initState();
    selectedDay = focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    final kToday = DateTime.now();
    final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
    final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: focusedDay,
      calendarFormat: calendarFormat,
      calendarStyle: const CalendarStyle(),
    );
  }
}
