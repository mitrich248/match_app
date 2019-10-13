import 'package:flutter/material.dart';
import 'package:match_app/pages/select_signs_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SelectSignsPage(),
    );
  }
}
