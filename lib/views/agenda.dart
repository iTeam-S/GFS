import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gfs/constants.dart';
import 'package:gfs/models/menage/tour_menage.model.dart';
import 'package:gfs/persistData/data.dart';
import 'package:gfs/utils/generate_task.dart';
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
  TaskManager _taskMaster = TaskManager();
  //---------------------------------

  @override
  void initState() {
    _taskMaster.createTaskInAgenda();

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
            onPressed: () {
              popEdit();
            },
            icon: Icon(
              Icons.refresh,
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

  Future popEdit() {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            backgroundColor: Colors.transparent,
            children: [
              Container(
                height: 220,
                margin: EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      child: Text(
                        "Etes vous sûr de vouloir actualiser l'agenda ? ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      child: Text(
                        "cela implique la mis à jour definitive de tous les programmes sur l'agenda !",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black45,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: MaterialButton(
                              color: Colors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "OUI",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () async {
                                await _taskMaster.updateTask();
                                setState(() {});
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100,
                            height: 40,
                            child: MaterialButton(
                                elevation: 0,
                                color: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Text(
                                  "NON",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<Appointment> source) {
    appointments = source;
  }
}

DataSource _getCalendarDataSource() {
  DataApp _data = DataApp();
  List<Appointment> appointments = [];
  List<TaskAssign> tacheDB = [];
  tacheDB =
      Boxes.getTourMenage().values.toList().cast<TourMenage>()[0].description;
  appointments = List.generate(
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