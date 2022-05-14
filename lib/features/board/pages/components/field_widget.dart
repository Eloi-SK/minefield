import 'package:flutter/material.dart';

import '../../models/field_model.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onTap;
  final void Function(Field) onLongPress;

  const FieldWidget({
    Key? key,
    required this.field,
    required this.onTap,
    required this.onLongPress
  }) : super(key: key);

  String get _getText {
    final int mines = field.adjacentMines;

    if (field.isOpened && field.isMine && field.isExploded) {
      return '💥';
    } else if (field.isOpened && field.isMine) {
      return '💣';
    } else if (field.isOpened) {
      if (mines > 0) {
        return mines.toString();
      } else {
        return '🕳️';
      }
    } else if (field.isFlagged) {
      return '🚩';
    } else {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(field),
      onLongPress: () => onLongPress(field),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.green[300],
          border: Border.all(
            color: Colors.blueGrey,
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            _getText,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ),
      ),
    );
  }
}