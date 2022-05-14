import 'dart:math';

import 'field_model.dart';

class Board {
  final int rows;
  final int columns;
  final int mines;
  
  final List<Field> _fields = [];

  List<Field> get fields => _fields;
  bool get isResolved => _fields.every((field) => field.isResolved);

  Board({
    required this.rows,
    required this.columns,
    required this.mines
  }) {
    _createFields();
    _createAdjacentFields();
    _randomMines();
  }

  void _createFields() {
    for (var row = 0; row < rows; row++) {
      for (var column = 0; column < columns; column++) {
        _fields.add(Field(row: row, column: column));
      }
    }
  }

  void _createAdjacentFields() {
    for (var field in _fields) {
      for (var adjacentField in _fields) {
        field.setAdjacentField(adjacentField);
      }
    }
  }

  void _randomMines() {
    int minesLeft = mines;

    if (mines > rows * columns) {
      return;
    }

    while (minesLeft > 0) {
      final rdn = Random().nextInt(_fields.length);

      if (!_fields[rdn].isMine) {
        _fields[rdn].setMine();
        minesLeft--;
      }
    }
  }

  void revealMines() {
    for (var field in _fields) {
      field.revealMine();
    }
  }

  void restart() {
    for (var field in _fields) {
      field.restart();
    }

    _randomMines();
  }
}