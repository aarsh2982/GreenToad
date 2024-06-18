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
  bool _isMonthlyCalendar = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTableCalendar(),
        _buildExpandEventsTrigger(),
      ],
    );
  }

  // destructured table calendar widget
  Widget _buildTableCalendar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 2000),
      child: TableCalendar(
        rowHeight: 36.0,
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        calendarFormat:
            (_isMonthlyCalendar) ? CalendarFormat.month : CalendarFormat.week,
        onDaySelected: (selectedDay, focusedDay) {
          print("Selected day: $selectedDay");
        },
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontFamily: primaryFont,
            fontWeight: FontWeight.bold,
            color: primaryColor,
            fontSize: 14.0,
          ),
          weekendStyle: TextStyle(
            fontFamily: primaryFont,
            fontWeight: FontWeight.w500,
            color: primaryColor,
            fontSize: 14.0,
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
          outsideDaysVisible: true,
          outsideTextStyle: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
          weekendTextStyle: TextStyle(
            fontSize: 14.0,
            color: Colors.grey,
          ),
          defaultTextStyle: TextStyle(
            fontSize: 14.0,
          ),
          todayTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
          todayDecoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: TextStyle(
            color: whiteColor,
            fontWeight: FontWeight.bold,
            fontSize: 14.0,
          ),
          selectedDecoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  // destructured toggle trigger widget
  Widget _buildExpandEventsTrigger() {
    return Center(
      child: IconButton(
        onPressed: () {
          setState(() {
            (_isMonthlyCalendar)
                ? _isMonthlyCalendar = false
                : _isMonthlyCalendar = true;
          });
        },
        icon: Icon(
          (_isMonthlyCalendar)
              ? FontAwesomeIcons.chevronUp
              : FontAwesomeIcons.chevronDown,
          color: Colors.grey,
          size: 20.0,
        ),
      ),
    );
  }
}
