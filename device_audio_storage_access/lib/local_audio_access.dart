import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class AudioFileAccess extends StatefulWidget {
  @override
  _AudioFileAccessState createState() => _AudioFileAccessState();
}

class _AudioFileAccessState extends State<AudioFileAccess> {
  List<File> audioFiles = [];
  late AssetsAudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AssetsAudioPlayer();  // Initialize the assets audio player
    requestPermissions();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  // Request permissions
  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      fetchAudioFiles();
    } else {
      print("Storage permission is required.");
    }
  }

  // Fetch audio files from external storage
  Future<void> fetchAudioFiles() async {
    try {
      final directory = await getExternalStorageDirectory();
      if (directory != null) {
        final files = directory.listSync();
        final audioExtensions = ['.mp3', '.wav', '.m4a'];

        setState(() {
          audioFiles = files
              .whereType<File>()
              .where((file) =>
              audioExtensions.any((ext) => file.path.toLowerCase().endsWith(ext)))
              .toList();
        });
        print("Found ${audioFiles.length} audio files");
      } else {
        print("Directory is null");
      }
    } catch (e) {
      print("Error fetching files: $e");
    }
  }

  // Play audio using assets_audio_player
  void playAudio(File file) async {
    try {
      // Use AssetsAudioPlayer to play the audio
      await audioPlayer.open(
        Audio.file(file.path),  // Open the file from the path
        autoStart: true,         // Start playing immediately
      );
      print("Playing audio: ${file.path}");
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio File Access"),
      ),
      body: audioFiles.isEmpty
          ? Center(child: Text("No audio files found"))
          : ListView.builder(
        itemCount: audioFiles.length,
        itemBuilder: (context, index) {
          final file = audioFiles[index];
          return ListTile(
            title: Text(file.path.split('/').last),
            onTap: () => playAudio(file),
          );
        },
      ),
    );
  }
}
