import 'package:flutter/material.dart';

class Flutterdatatable extends StatefulWidget {
  const Flutterdatatable({super.key});

  @override
  State<Flutterdatatable> createState() => _FlutterdatatableState();
}

class _FlutterdatatableState extends State<Flutterdatatable> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("data table"),
      ),
      body: SingleChildScrollView(
        child: DataTable(
            columns: const [
          DataColumn(
            label: Text("Name"),
          ),
          DataColumn(
            label: Text("UID"),
          ),
          DataColumn(
            label: Text("Age"),
          ),
        ], rows: const [
          DataRow(cells: [
            DataCell(Text("Rahul Kumar")),
            DataCell(Text("23MCA20221")),
            DataCell(Text("23")),
          ]),
          DataRow(cells: [
            DataCell(Text("Abhimanyu")),
            DataCell(Text("23MCA20137")),
            DataCell(Text("25")),
          ]),
          DataRow(cells: [
            DataCell(Text("Himanshu")),
            DataCell(Text("23MCA20243")),
            DataCell(Text("24")),
          ]),
        ]),
      ),
    );
  }
}
