import 'package:flutter/material.dart';

class TimePickerFlutter extends StatefulWidget {
  const TimePickerFlutter({super.key});

  @override
  State<TimePickerFlutter> createState() => _TimePickerFlutterState();
}

class _TimePickerFlutterState extends State<TimePickerFlutter> {
  // Variable to store the selected time
  String time = "Select a time";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Picker"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display selected time
            Text(
              time,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Button to open time picker
            ElevatedButton(
              onPressed: () async {
                // Show time picker dialog
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                // Update the selected time
                if (selectedTime != null) {
                  setState(() {
                    time = selectedTime.format(context);
                  });
                }
              },
              child: const Text("Pick a Time"),
            ),
          ],
        ),
      ),
    );
  }
}
