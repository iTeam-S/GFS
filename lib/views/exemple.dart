import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalendarView view = CalendarView.month;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.zero,
            width: Get.width,
            height: Get.height * .7,
            child: SfCalendar(
              headerHeight: 50,
              selectionDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: Colors.red,
                  width: 2,
                ),
              ),
              showNavigationArrow: true,
              showDatePickerButton: true,
              firstDayOfWeek: 1,
              onTap: (details) {
                if (details.appointments!.isNotEmpty) {
                  //  print(details.appointments![0].location);
                }
              },
              dataSource: _getCalendarDataSource(),
              view: view,
              monthViewSettings: const MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}

DataSource _getCalendarDataSource() {
  List<Appointment> appointments = <Appointment>[
    Appointment(
      startTime: DateTime(2022, 11, 15),
      endTime: DateTime(2022, 11, 15).add(Duration(hours: 2)),
      isAllDay: true,
      subject: 'Groupe 1',
      color: Colors.blue,
      location: 'kkkkk',
      startTimeZone: '',
      endTimeZone: '',
    ),
    Appointment(
      startTime: DateTime(2022, 11, 15),
      endTime: DateTime(2022, 11, 15).add(Duration(hours: 2)),
      isAllDay: true,
      subject: 'Groupe 2',
      color: Colors.red,
      location: 'aaaa',
      startTimeZone: '',
      endTimeZone: '',
    )
  ];

  return DataSource(appointments);
}
