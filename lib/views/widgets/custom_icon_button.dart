import 'package:flutter/material.dart';
import 'package:gfs/views/widgets/popUp.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;

  const CustomIconButton({Key? key, this.icon, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: iconColor),
      // Wrap the IconButton in a Material widget for the
      // IconButton's splash to render above the container.
      child: Material(
        borderRadius: BorderRadius.circular(24),
        type: MaterialType.transparency,
        // Hard Edge makes sure the splash is clipped at the border of this
        // Material widget, which is circular due to the radius above.
        clipBehavior: Clip.hardEdge,
        child: IconButton(
          color: Colors.white,
          iconSize: 20,
          icon: Icon(
            icon,
          ),
          onPressed: () {
            showDialog(
                context: context,
                barrierColor: Colors.transparent,
                builder: (BuildContext context) {
                  return PopUpConsomation();
                });
          },
        ),
      ),
    );
  }
}
