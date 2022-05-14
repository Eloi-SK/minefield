import 'package:flutter/material.dart';

import '../../models/board_model.dart';
import '../../models/field_model.dart';
import 'field_widget.dart';

class BoardWidget extends StatelessWidget {
  final Board board;
  final void Function(Field) onTap;
  final void Function(Field) onLongPress;

  const BoardWidget({
    Key? key,
    required this.board,
    required this.onTap,
    required this.onLongPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: board.columns,
      children: board.fields.map((field) => FieldWidget(
        field: field,
        onTap: onTap,
        onLongPress: onLongPress,
      )).toList(),
    );
  }
}