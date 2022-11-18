import 'dart:math';

class TaskMaster {
  List<TaskAssign> _listTache = []; //

  List<int> _tListAll = []; //

  int nombreDeJoursDuMois(int mois) {
    int nombreDeJours = 0;
    switch (mois) {
      case 1:
        //janvier
        nombreDeJours = 31;
        break;
      case 2:
        //fevrier
        nombreDeJours = 28;
        break;
      case 3:
        //mars
        nombreDeJours = 31;
        break;
      case 4:
        //avril
        nombreDeJours = 30;
        break;
      case 5:
        //mai
        nombreDeJours = 31;
        break;
      case 6:
        //juin
        nombreDeJours = 30;
        break;
      case 7:
        //juiller
        nombreDeJours = 31;
        break;
      case 8:
        //août
        nombreDeJours = 31;
        break;
      case 9:
        //septembre
        nombreDeJours = 30;
        break;
      case 10:
        //octobre
        nombreDeJours = 31;
        break;
      case 11:
        //novembre
        nombreDeJours = 30;
        break;
      case 12:
        //decembre
        nombreDeJours = 31;
        break;
      default:
        nombreDeJours = 28;
        break;
    }
    return nombreDeJours;
  }

  List<TaskAssign> generateTask({
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
          _listTache.add(TaskAssign(
            groupe: groupe,
            tache: tache > tch ? 0 : tache,
            jour: jour,
          ));
          _tListAll.remove(tache);
        } else {
          print(
            [
              jour,
              groupe,
              _tListAll[0] > tch ? 0 : _tListAll[0],
            ],
          );
          _listTache.add(TaskAssign(
            groupe: groupe,
            tache: _tListAll[0] > tch ? 0 : _tListAll[0],
            jour: jour,
          ));
          _tListAll.removeAt(0);
        }

        if (groupe == gp) {
          print('----------');
        }
      }
    }

    print(_listTache.length);
    print([gp, tch]);
    print([
      _listTache[180 - 1].tache,
      _listTache[179 - 1].tache,
      _listTache[178 - 1].tache,
      _listTache[177 - 1].tache,
      _listTache[176 - 1].tache,
      _listTache[175 - 1].tache,
      _listTache[174 - 1].tache,
    ]);
    taskList = _listTache;
    return taskList;
  }
}

class TaskAssign {
  final int groupe;
  final int tache;
  final int jour;

  TaskAssign({
    required this.groupe,
    required this.tache,
    required this.jour,
  });
}
