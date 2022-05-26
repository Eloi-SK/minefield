import 'package:flutter/material.dart';

import '../../board/models/difficulty_model.dart';
import '../../board/pages/board_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool shouldShowDifficultyButtons = false;

  final diffcultyList = [
    Difficulty.easy(),
    Difficulty.medium(),
    Difficulty.hard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campo Minado'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: showButtons(),
        ),
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

  Widget showButtons() {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: shouldShowDifficultyButtons
        ? showDifficultyButtons()
        : showStartButton(),
    );
  }

  Widget showStartButton() {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        child: const Text(
          'Iniciar',
          style: TextStyle(
            fontSize: 18,
          )
        ),
        onPressed: () {
          setState(() {
            shouldShowDifficultyButtons = true;
          });
        },
      ),
    );
  }

  Widget showDifficultyButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...diffcultyList.map(createDifficultyButton),
        SizedBox(
          width: double.maxFinite,
          child: ElevatedButton(
            child: const Text('Voltar'),
            onPressed: () {
              setState(() {
                shouldShowDifficultyButtons = false;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget createDifficultyButton(Difficulty difficulty) {
    return SizedBox(
      width: double.maxFinite,
      child: ElevatedButton(
        child: Text(difficulty.name),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BoardPage(
                rows: difficulty.rows,
                columns: difficulty.columns,
                mines: difficulty.mines,
              ),
            ),
          );
        },
      ),
    );
  }
}