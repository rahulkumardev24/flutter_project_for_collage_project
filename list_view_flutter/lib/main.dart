import 'package:flutter/material.dart';
import 'package:list_view_flutter/list_tile_view.dart';
import 'package:list_view_flutter/list_view_builder.dart';
import 'package:list_view_flutter/list_view_screen.dart';
import 'package:list_view_flutter/list_view_seprater.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ListTileView()
    );
  }
}

