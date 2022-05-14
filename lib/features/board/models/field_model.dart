class Field {
  final int row;
  final int column;
  final List<Field> adjacentFields = [];

  bool _isMine = false;
  bool _opened = false;
  bool _flagged = false;
  bool _exploded = false;

  bool get isMine => _isMine;
  bool get isOpened => _opened;
  bool get isFlagged => _flagged;
  bool get isExploded => _exploded;
  bool get hasSafeAdjacentFields => adjacentFields.every((field) => !field.isMine);
  bool get isResolved {
    final minedAndFlagged = isMine && isFlagged;
    final safeAndOpened = !isMine && isOpened;

    return minedAndFlagged || safeAndOpened;
  }

  int get adjacentMines => adjacentFields.where((field) => field.isMine).length;

  Field({
    required this.row,
    required this.column
  });

  void open() {
    if (_opened) {
      return;
    }

    _opened = true;

    if (isMine) {
      _exploded = true;
      return;
    }

    if (hasSafeAdjacentFields) {
      for (var field in adjacentFields) {
        field.open();
      }
    }
  }

  void revealMine() {
    if (isMine) {
      _opened = true;
    }
  }

  void toggleFlag() {
    if (_opened) {
      return;
    }

    _flagged = !_flagged;
  }

  void setMine() {
    _isMine = true;
  }

  void setAdjacentField(Field field) {
    final rowAbs = (row - field.row).abs();
    final columnAbs = (column - field.column).abs();

    if (rowAbs == 0 && columnAbs == 0) {
      return;
    }

    if (rowAbs <= 1 && columnAbs <= 1) {
      adjacentFields.add(field);
    }
  }

  void restart() {
    _isMine = false;
    _opened = false;
    _flagged = false;
    _exploded = false;
  }
}