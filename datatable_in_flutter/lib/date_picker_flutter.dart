import 'package:flutter/material.dart';

class DatePickerFlutter extends StatefulWidget {
  const DatePickerFlutter({super.key});

  @override
  State<DatePickerFlutter> createState() => _DatePickerFlutterState();
}

class _DatePickerFlutterState extends State<DatePickerFlutter> {
  // Initial date value
  String date = "Select a date";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Date Picker"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display selected date
            Text(
              date,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Button to open date picker
            ElevatedButton(
              onPressed: () async {
                // Show date picker dialog
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2030),
                );

                // Update the selected date
                if (selectedDate != null) {
                  setState(() {
                    date = "${selectedDate.day}-${selectedDate.month}-${selectedDate.year}";
                  });
                }
              },
              child: const Text("Pick a Date"),
            ),
          ],
        ),
      ),
    );
  }
}

