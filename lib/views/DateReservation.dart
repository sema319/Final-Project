import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateReservationScreen extends StatefulWidget {
  const DateReservationScreen({super.key, required this.title});

  final String title;

  @override
  State<DateReservationScreen> createState() => DateReservationScreenPageState();
// State<PaymentScreen> createState() => PaymentScreenPageState();
}

class DateReservationScreenPageState extends State<DateReservationScreen> {
  @override build(BuildContext context) {
    return const MaterialApp(
      home: DateReservation(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DateReservation extends StatefulWidget {
  const DateReservation({super.key});

  @override
  State<DateReservation> createState() => _DateReservationState();
}

class _DateReservationState extends State<DateReservation> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<DateTime, bool> bookingStatus = {
    DateTime(2025, 4, 1): true,
    DateTime(2025, 4, 5): false,
    DateTime(2025, 4, 10): true,
    DateTime(2025, 4, 14): false,
    DateTime(2025, 4, 20): true,
  };

  Color getColorForDay(DateTime day) {
    final status = bookingStatus[DateTime(day.year, day.month, day.day)];
    if (status == null) return Colors.grey.shade200;
    return status ? Colors.red : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التقويم التشغيلي'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2000, 1, 1),
            lastDay: DateTime.utc(2100, 12, 31),
            focusedDay: _focusedDay,
            locale: 'he',
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;

                // إظهار حالة الحجز بالتوست
                final status = bookingStatus[DateTime(selectedDay.year, selectedDay.month, selectedDay.day)];
                final msg = status == true
                    ? 'اليوم محجوز'
                    : status == false
                    ? 'اليوم متاح'
                    : 'لا توجد معلومات لهذا اليوم';

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
              });
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, _) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: getColorForDay(day),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              },
              todayBuilder: (context, day, _) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text('${day.day}'),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          const Text('دليل الألوان:', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(backgroundColor: Colors.green, radius: 10),
              SizedBox(width: 8),
              Text('متاح (غير محجوز)'),
              SizedBox(width: 16),
              CircleAvatar(backgroundColor: Colors.red, radius: 10),
              SizedBox(width: 8),
              Text('محجوز'),
            ],
          )
        ],
      ),
    );
  }
}
