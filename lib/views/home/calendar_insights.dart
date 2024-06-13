// Calendar Insights Widget for Home view
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:greentoad_app/config/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarInsights extends StatefulWidget {
  const CalendarInsights({super.key});

  @override
  State<CalendarInsights> createState() => _CalendarInsightsState();
}

class _CalendarInsightsState extends State<CalendarInsights> {
  // to events toggle menu
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TableCalendar(
          focusedDay: DateTime.now(),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          calendarFormat: CalendarFormat.week,
          onDaySelected: (selectedDay, focusedDay) {
            print("Selected day: $selectedDay");
          },
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            weekendStyle: TextStyle(
              fontFamily: "Montserrat",
              color: primaryColor,
            ),
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleTextStyle: TextStyle(
              fontFamily: "Roboto",
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: Colors.grey,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: Colors.grey,
            ),
          ),
          calendarStyle: const CalendarStyle(
            todayTextStyle: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
            todayDecoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(
              color: whiteColor,
              fontWeight: FontWeight.bold,
            ),
            selectedDecoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          // adjust the height as needed later!
          height: (_isMenuOpen) ? 200.0 : 0,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          color: Colors.grey[200],
          child: const Text(
            "Show Events in here..",
            textAlign: TextAlign.center,
          ),
        ),
        Center(
          child: IconButton(
            onPressed: () {
              setState(() {
                (_isMenuOpen) ? _isMenuOpen = false : _isMenuOpen = true;
              });
            },
            icon: Icon(
              (_isMenuOpen)
                  ? FontAwesomeIcons.chevronUp
                  : FontAwesomeIcons.chevronDown,
              color: Colors.grey,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
