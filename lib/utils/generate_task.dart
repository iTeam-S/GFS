import '../database/db.service.dart';
import '../database/db.transaction.dart';
import '../models/menage/task_assign.model.dart';
import '../models/menage/tour_menage.model.dart';
import 'nombre_de_mois.dart';

class TaskManager {
  TransAction _action = TransAction();
  List<TourMenage> _listOfTask =
      Boxes.getTourMenage().values.toList().cast<TourMenage>();
  List<TaskAssign> _listTache = []; //
  List<TaskAssign> taskFromDataBase =
      Boxes.getTourMenage().values.toList().cast<TourMenage>()[0].description;
  List<int> _tListAll = []; //
//
  List<TaskAssign> _generateTask({
    required int nombreDeGroupe,
    required int nombreDeTache,
  }) {
    print(_tListAll.length);
    List<TaskAssign> taskList = [];
    _listTache.clear();
    int nombreDeJours = nombreDeJoursDuMois(
      DateTime.now().month,
    );
    int gp = nombreDeGroupe;
    int tch = nombreDeTache;

    tacheAll() {
      _tListAll.clear();

      if (gp > tch) {
        for (int tache = 1; tache <= gp; tache++) {
          _tListAll.add(tache);
        }
      } else {
        for (int tache = 1; tache <= tch; tache++) {
          _tListAll.add(tache);
        }
      }
      //_tListAll.shuffle();
      _tListAll.shuffle();
      // print(_tListAll);
    }

    for (int jour = 1; jour <= nombreDeJours; jour++) {
      tacheAll();

      for (int groupe = 1; groupe <= gp; groupe++) {
        // int tache = Random().nextInt(_tListAll.length) + 1;
        int tache = _tListAll[_tListAll.length - 1];
        if (_tListAll.contains(tache)) {
          print(
            [
              jour,
              groupe,
              tache > tch ? 0 : tache,
            ],
          );
          _listTache.add(
            TaskAssign()
              ..groupe = groupe
              ..tache = tache > tch ? 0 : tache
              ..jour = jour,
          );
          _tListAll.remove(tache);
        } else {
          print(
            [
              jour,
              groupe,
              _tListAll[0] > tch ? 0 : _tListAll[0],
            ],
          );
          _listTache.add(
            TaskAssign()
              ..groupe = groupe
              ..tache = _tListAll[0] > tch ? 0 : _tListAll[0]
              ..jour = jour,
          );
          _tListAll.removeAt(0);
        }

        if (groupe == gp) {
          print('----------');
        }
      }
    }

    taskList = _listTache;
    return taskList;
  }

  createTaskInAgenda() {
    if (_listOfTask.length == 0) {
      _action.addTourMenage(
        description: _generateTask(
          nombreDeGroupe: Boxes.getGroupe().length,
          nombreDeTache: Boxes.getEmplacement().length,
        ),
      );
    } else {
      print("existe déjà");
      if (nombreDeJoursDuMois(DateTime.now().month) !=
          taskFromDataBase[taskFromDataBase.length - 1].jour) {
        _action.editTourMenage(
          index: 0,
          description: _generateTask(
            nombreDeGroupe: Boxes.getGroupe().length,
            nombreDeTache: Boxes.getEmplacement().length,
          ),
        );
      }
    }
  }

  updateTask() {
    return _action.editTourMenage(
      index: 0,
      description: _generateTask(
        nombreDeGroupe: Boxes.getGroupe().length,
        nombreDeTache: Boxes.getEmplacement().length,
      ),
    );
  }
}
