import 'package:gfs/persistData/data.dart';

String toDateN(DateTime dateTime) {
  final DataApp _data = DataApp();
  String date = "";
  date = "${dateTime.day} ${_data.mois[dateTime.month].toLowerCase()}";
  return date;
}
