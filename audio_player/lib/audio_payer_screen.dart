import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  // List of music assets
  final List<String> musicList = [
    "assets/music 1.m4a", // Make sure to add your actual paths here
    "assets/ikko-mikke-sanu-ajkal-sheesha-bada-ched.mp3",
    "assets/kisi-se-tum-pyar-karo-kisii-se-tum-pyaar-kro-andaaz.mp3Li",
  ];

  int currentIndex = 0; // Keeps track of the current music index

  Future<void> _playAudio() async {
    final String audioUrl = musicList[currentIndex];

    if (isPlaying) {
      await _player.pause(); // Pause audio if already playing
    } else {
      await _player.setAsset(audioUrl); // Load the current track
      await _player.play(); // Play the current track
    }

    // Toggle the play/pause state
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  // Method to play next track
  Future<void> _nextTrack() async {
    setState(() {
      currentIndex = (currentIndex + 1) %
          musicList.length; // Loop to first track after the last one
    });
    await _playAudio(); // Play the next track
  }

  // Method to play previous track
  Future<void> _previousTrack() async {
    setState(() {
      currentIndex = (currentIndex - 1 + musicList.length) %
          musicList.length; // Loop to last track if at the start
    });
    await _playAudio(); // Play the previous track
  }

  @override
  void dispose() {
    super.dispose();
    _player.dispose(); // Properly dispose of the audio player
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Audio Player",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display the current track name (optional)
            Text(
              "Track: ${musicList[currentIndex]}",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.skip_previous),
                  onPressed: _previousTrack, // Go to the previous track
                ),
                IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: _playAudio, // Play or pause the current track
                ),
                IconButton(
                  icon: Icon(Icons.skip_next),
                  onPressed: _nextTrack, // Go to the next track
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
