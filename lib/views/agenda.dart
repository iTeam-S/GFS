import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/database/db.transaction.dart';
import 'package:gfs/models/menage/tour_menage.model.dart';
import 'package:gfs/persistData/data.dart';
import 'package:gfs/utils/generate_task.dart';
import 'package:gfs/utils/nombre_de_mois.dart';
import 'package:gfs/views/widgets/drawer.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../database/db.service.dart';
import '../models/menage/task_assign.model.dart';

AppDrawer drawer = AppDrawer();

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  TaskMaster _taskMaster = TaskMaster();
  TransAction _action = TransAction();
  List<TourMenage> listOfTask =
      Boxes.getTourMenage().values.toList().cast<TourMenage>();

  //---------------------------------
  _createTaskInAgenda() {
    if (listOfTask.length == 0) {
      _action.addTourMenage(
        description: _taskMaster.generateTask(
          nombreDeGroupe: 6,
          nombreDeTache: 5,
        ),
      );
    } else {
      print("existe déjà");
      List<TaskAssign> taskFromDataBase = Boxes.getTourMenage()
          .values
          .toList()
          .cast<TourMenage>()[0]
          .description;

      if (nombreDeJoursDuMois(DateTime.now().month) !=
          taskFromDataBase[taskFromDataBase.length - 1].jour) {
        _action.editTourMenage(
          index: 0,
          description: _taskMaster.generateTask(
            nombreDeGroupe: 6,
            nombreDeTache: 5,
          ),
        );
      }
    }
  }

  @override
  void initState() {
    _createTaskInAgenda();
    print(listOfTask.length);
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
              LineIcons.infoCircle,
            ),
            color: Colors.white,
          ),
        ],
      ),
      body: Container(
        color: dark,
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.zero,
                width: Get.width,
                height: Get.height * .9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .8,
                      child: SfCalendar(
                        todayHighlightColor: dark,
                        todayTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        cellBorderColor: dark,
                        headerHeight: 50,
                        selectionDecoration: BoxDecoration(
                          border: Border.all(
                            color: dark,
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
                        initialSelectedDate: DateTime.now(),
                        monthViewSettings: const MonthViewSettings(
                          appointmentDisplayCount: 3,
                          appointmentDisplayMode:
                              MonthAppointmentDisplayMode.indicator,
                          showAgenda: true,
                          monthCellStyle: MonthCellStyle(
                            todayBackgroundColor: dark,
                          ),
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
    );
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}

DataSource _getCalendarDataSource() {
  DataApp _data = DataApp();
  _data.couleurTache.shuffle();
  List<TaskAssign> tacheDB =
      Boxes.getTourMenage().values.toList().cast<TourMenage>()[0].description;
  List<Appointment> appointments = List.generate(
    tacheDB.length,
    (index) {
      TaskAssign tache = tacheDB[index];
      DateTime date = DateTime.now();

      return Appointment(
        startTime: DateTime(date.year, date.month, tache.jour),
        endTime:
            DateTime(date.year, date.month, tache.jour).add(Duration(hours: 2)),
        isAllDay: true,
        subject: tache.tache == 0
            ? 'G${tache.groupe}: aucune tache'
            : 'G${tache.groupe} + T${tache.tache}',
        color: _data.couleurTache[
            tache.groupe.isNaN ? Random().nextInt(tache.groupe) : tache.groupe],
        location: '',
        startTimeZone: '',
        endTimeZone: '',
      );
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
///DARK MODE
/**
 * SfCalendar(
                    backgroundColor: dark,
                    todayHighlightColor: dark,
                    todayTextStyle: TextStyle(
                      color: Colors.white,
                    ),

                    cellBorderColor: Colors.white,
                    weekNumberStyle: WeekNumberStyle(
                      textStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    headerHeight: 50,
                    selectionDecoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
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
                    //HEAER STYLE
                    headerStyle: CalendarHeaderStyle(
                      backgroundColor: Colors.white,
                      textStyle: TextStyle(
                        color: dark,
                        fontSize: 20,
                      ),
                    ),
                    viewHeaderStyle: ViewHeaderStyle(
                      dayTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                      dateTextStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    monthViewSettings: const MonthViewSettings(
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.indicator,
                      showAgenda: true,
                      showTrailingAndLeadingDates: false,
                      monthCellStyle: MonthCellStyle(
                        textStyle: TextStyle(
                          color: Colors.white,
                        ),
                        todayBackgroundColor: dark,
                        backgroundColor: dark,
                        trailingDatesBackgroundColor: Colors.white,
                        leadingDatesBackgroundColor: Colors.white,
                      ),
                      agendaStyle: AgendaStyle(
                        dayTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                        dateTextStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
               
 */