import 'dart:ui';

import 'package:flutter/material.dart';

class PopUpConsomation extends StatelessWidget {
  const PopUpConsomation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        backgroundColor: Color(0xff25272a),
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Center(
            child: Text(
          'ATTENTION !!',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        )),
        content: Text(
          "Votre consomation dépasse la seuil limite 500Ar/mois. Vous pouvez changer le seuil limite dans le paramètre budget.\n\n Ouvir la page budget ? ",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        actions: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("Annuler"),
              ),
              SizedBox(
                width: 50,
              ),
              MaterialButton(
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: new Text("  Ouvrir  "),
              )
            ],
          )
        ],
      ),
    );
  }
}

class PopUpDatePicker extends StatelessWidget {
  const PopUpDatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0), child: Container());
  }
}
