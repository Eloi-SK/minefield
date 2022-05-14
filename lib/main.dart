import 'package:flutter/material.dart';

import 'features/board/pages/board_page.dart';

void main() {
  runApp(const MineFieldApp());
}

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BoardPage(),
    );
  }
}