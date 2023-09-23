import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AppointmentCalendar extends StatefulWidget {
  final Function(DateTime, DateTime) onAppointmentSelected;

  const AppointmentCalendar({
    Key? key,
    required this.onAppointmentSelected,
  }) : super(key: key);

  @override
  _AppointmentCalendarState createState() => _AppointmentCalendarState();
}

class _AppointmentCalendarState extends State<AppointmentCalendar> {
  List<String> _availableTimeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM'
  ];
  String? _selectedTimeSlot;
  void _onTimeSlotSelected(String timeSlot) {
    setState(() {
      _selectedTimeSlot = timeSlot;
    });
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.now().subtract(Duration(days: 30)),
          lastDay: DateTime.now().add(Duration(days: 30)),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              widget.onAppointmentSelected(selectedDay, focusedDay);
            });
          },
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
        ),
        if (_selectedDay != null)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
                'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDay!)}'),
          ),
        PopupMenuButton<String>(
          icon: Icon(Icons.access_time),
          onSelected: _onTimeSlotSelected,
          itemBuilder: (BuildContext context) {
            return _availableTimeSlots.map((String timeSlot) {
              return PopupMenuItem<String>(
                value: timeSlot,
                child: Text(timeSlot),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
