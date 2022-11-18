import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/persistData/data.dart';
import 'package:gfs/utils/generate_task.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

AppDrawer drawer = AppDrawer();

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  List<TaskAssign> taches = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: drawer,
      appBar: AppBar(
        backgroundColor: dark,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          icon: Icon(
            LineIcons.verticalEllipsis,
          ),
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              LineIcons.users,
            ),
            color: Colors.white,
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            color: dark,
            width: Get.width,
            height: Get.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      color: orange,
                      width: Get.width * .5,
                      height: Get.height * .5,
                    ),
                    Container(
                      color: dark,
                      width: Get.width * .5,
                      height: Get.height * .5,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            width: Get.width,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CardTask(),
                  Container(
                    padding: EdgeInsets.zero,
                    width: Get.width,
                    height: Get.height * .9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * .8,
                          child: SfCalendar(
                            todayHighlightColor: Colors.white,
                            cellBorderColor: dark,
                            headerHeight: 50,
                            selectionDecoration: BoxDecoration(
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
                                print(details.appointments![0].location);
                              }
                            },
                            dataSource: _getCalendarDataSource(),
                            view: CalendarView.month,
                            monthViewSettings: const MonthViewSettings(
                              appointmentDisplayMode:
                                  MonthAppointmentDisplayMode.indicator,
                              showAgenda: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
  TaskMaster _task = TaskMaster();
  DataApp _data = DataApp();
  List<TaskAssign> taches = _task.generateTask(
    nombreDeGroupe: 6,
    nombreDeTache: 5,
  );
  List<Appointment> appointments = List.generate(
    taches.length,
    (index) {
      TaskAssign tache = taches[index];
      DateTime date = DateTime.now();
      if (tache.tache != 0) {
        return Appointment(
          startTime: DateTime(date.year, date.month, tache.jour),
          endTime: DateTime(date.year, date.month, tache.jour)
              .add(Duration(hours: 2)),
          isAllDay: true,
          subject: 'G${tache.groupe} + T${tache.tache}',
          color: _data.couleurTache[tache.groupe],
          location: '',
          startTimeZone: '',
          endTimeZone: '',
        );
      } else {
        return Appointment(
          startTime: DateTime(date.year, date.month, tache.jour),
          endTime: DateTime(date.year, date.month, tache.jour)
              .add(Duration(hours: 2)),
          isAllDay: true,
          subject: 'G${tache.groupe} : aucune tache',
          color: _data.couleurTache[tache.groupe],
          location: '',
          startTimeZone: '',
          endTimeZone: '',
        );
      }
    },
  );

  return DataSource(appointments);
}

class CardTask extends StatelessWidget {
  const CardTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: Get.width,
      height: 100,
      decoration: BoxDecoration(
        color: dark,
        //borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            width: Get.width * .1,
            decoration: BoxDecoration(
              color: orange,
              /* borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),*/
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "G",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
                Text(
                  "1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width * .9,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "Cuisine matin et nettoyage exterieur",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
                Container(
                  width: Get.width,
                  height: 20,
                  child: Row(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Text(
                                "Dominick, ",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
