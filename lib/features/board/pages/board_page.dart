
import 'package:flutter/material.dart';

import '../models/board_model.dart';
import '../models/field_model.dart';
import 'components/board_widget.dart';

class BoardPage extends StatefulWidget {
  final int rows;
  final int columns;
  final int mines;

  const BoardPage({
    Key? key,
    required this.rows,
    required this.columns,
    required this.mines
  }) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  bool? venceu;
  Board? board;

  @override
  void initState() {
    board = Board(
      rows: widget.rows,
      columns: widget.columns,
      mines: widget.mines,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campo Minado - ${widget.mines} minas',  
        ),
      ),
      body: BoardWidget(
        board: board!,
        onTap: onTap,
        onLongPress: onLongPress,
      ),
      bottomNavigationBar: const SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
            'Desenvolvido por Eloi Matos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  void onTap(Field field) {
    if (venceu != null) {
      return;
    }

    setState(() {
      field.open();

      if (field.isExploded) {
        venceu = false;
        board!.revealMines();
        showFinishDialog('Tente novamente', 'Você perdeu!');
      }

      if(board!.isResolved) {
        venceu = true;
        showFinishDialog('Parabéns', 'Você venceu!');	
      }
    });
  }

  void onLongPress(Field field) {
    if (venceu != null) {
      return;
    }

    setState(() {
      field.toggleFlag();

      if (board!.isResolved) {
        venceu = true;
        showFinishDialog('Parabéns', 'Você venceu!');	
      }
    });
  }

  void restart() {
    setState(() {
      venceu = null;
      board!.restart();
    });
  }

  Future<void> showFinishDialog(String title, String message) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text('Reiniciar'),
              onPressed: () {
                restart();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}