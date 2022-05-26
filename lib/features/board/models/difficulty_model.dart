class Difficulty {
  final String name;
  final int rows;
  final int columns;
  final int mines;

  const Difficulty({
    required this.name,
    required this.rows,
    required this.columns,
    required this.mines,
  });

  Difficulty.easy() : this(
    name: 'Fácil',
    rows: 10,
    columns: 10,
    mines: 5,
  );

  Difficulty.medium() : this(
    name: 'Médio',
    rows: 15,
    columns: 15,
    mines: 20,
  );

  Difficulty.hard() : this(
    name: 'Difícil',
    rows: 20,
    columns: 20,
    mines: 40,
  );
}