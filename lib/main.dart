import 'package:flutter/material.dart';

import 'features/menu/pages/menu_page.dart';

void main() {
  runApp(const MineFieldApp());
}

class MineFieldApp extends StatelessWidget {
  const MineFieldApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campo Minado',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MenuPage(),
    );
  }
}