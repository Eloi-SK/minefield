
import 'package:flutter/material.dart';

import '../models/board_model.dart';
import '../models/field_model.dart';
import 'components/board_widget.dart';

class BoardPage extends StatefulWidget {
  const BoardPage({Key? key}) : super(key: key);

  @override
  State<BoardPage> createState() => _BoardPageState();
}

class _BoardPageState extends State<BoardPage> {
  bool? venceu;
  
  Board board = Board(
      rows: 10,
      columns: 10,
      mines: 8,
    );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campo Minado'),
      ),
      body: BoardWidget(
        board: board,
        onTap: onTap,
        onLongPress: onLongPress,
      )
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
        board.revealMines();
        showFinishDialog('Tente novamente', 'Você perdeu!');
      }

      if(board.isResolved) {
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

      if (board.isResolved) {
        venceu = true;
        showFinishDialog('Parabéns', 'Você venceu!');	
      }
    });
  }

  void restart() {
    setState(() {
      venceu = null;
      board.restart();
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