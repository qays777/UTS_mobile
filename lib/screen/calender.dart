import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  Map<DateTime, List<Event>> _events = {};

  TextEditingController _eventController = TextEditingController();

  void _onFormatChanged(CalendarFormat format) {
    setState(() {
      _calendarFormat = format;
    });
  }

  void _onSelectedDayChanged(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  void _addEvent() {
    setState(() {
      if (_events[_selectedDay] != null) {
        _events[_selectedDay]!.add(Event(title: _eventController.text));
      } else {
        _events[_selectedDay] = [Event(title: _eventController.text)];
      }
      _eventController.clear();
    });
  }

  void _deleteEvent(Event event) {
    setState(() {
      _events[_selectedDay]?.remove(event);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            calendarFormat: _calendarFormat,
            //selectedDay: _selectedDay,
            focusedDay: _focusedDay,
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2023, 12, 31),
            onFormatChanged: _onFormatChanged,
            onDaySelected: _onSelectedDayChanged,
            headerStyle: HeaderStyle(
              titleTextStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              formatButtonTextStyle: TextStyle(
                color: Colors.white,
              ),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Events on ${_selectedDay.day}/${_selectedDay.month}/${_selectedDay.year}:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    if (_events[_selectedDay] != null)
                      Column(
                        children: _events[_selectedDay]!
                            .map((event) => EventCard(
                                  event: event,
                                  onDelete: () => _deleteEvent(event),
                                ))
                            .toList(),
                      ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _eventController,
                      decoration: InputDecoration(
                        labelText: 'Tambah Catatan',
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _addEvent,
                      child: Text('Simpan'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Event {
  final String title;

  Event({required this.title});
}

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback onDelete;

  const EventCard({
    Key? key,
    required this.event,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: onDelete,
              ),
            ),
          ],
        ),
      ),
    );
  }
}