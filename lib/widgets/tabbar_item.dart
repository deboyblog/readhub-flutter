import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;

  TabBarItem({this.text, this.icon, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).primaryColor;
    final Color normalColor = Color.fromRGBO(115, 115, 115, 1);

    return Container(
      height: 48,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            icon,
            color: selected ? selectedColor : normalColor,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 11.0,
              color: selected ? selectedColor : normalColor,
            ),
          )
        ],
      ),
    );
  }
}
