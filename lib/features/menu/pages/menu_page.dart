import 'package:flutter/material.dart';

import '../../board/pages/board_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool shouldShowDifficultyButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campo Minado'),
      ),
      body: Center(
        child: showButtons(),
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
    return ElevatedButton(
      child: const Text('Iniciar'),
      onPressed: () {
        setState(() {
          shouldShowDifficultyButtons = true;
        });
      },
    );
  }

  Widget showDifficultyButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: const Text('Fácil'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BoardPage(
                  rows: 10,
                  columns: 10,
                  mines: 5,
                ),
              ),
            );
          },
        ),
        ElevatedButton(
          child: const Text('Médio'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BoardPage(
                  rows: 15,
                  columns: 15,
                  mines: 20,
                ),
              ),
            );
          },
        ),
        ElevatedButton(
          child: const Text('Difícil'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const BoardPage(
                  rows: 20,
                  columns: 20,
                  mines: 40,
                ),
              ),
            );
          },
        ),
        ElevatedButton(
          child: const Text('Voltar'),
          onPressed: () {
            setState(() {
              shouldShowDifficultyButtons = false;
            });
          },
        ),
      ],
    );
  }
}