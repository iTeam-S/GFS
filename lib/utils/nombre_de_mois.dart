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
