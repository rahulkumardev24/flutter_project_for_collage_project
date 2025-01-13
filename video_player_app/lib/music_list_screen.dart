import 'package:flutter/material.dart';
import 'package:video_player_app/video_player_screen.dart';

class MusicListScreen extends StatefulWidget {
  const MusicListScreen({super.key});

  @override
  State<MusicListScreen> createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  /// list of music
  List<String> video_list = [
    "assets/videos/dil-full-video-raghav-s-version-ek-villain-returns-john-disha-arjun-tara-kaushik-guddu-1440-publer.io.mp4",
    "assets/videos/samjhawan-lyric-video-humpty-sharma-ki-dulhania-varun-alia-arijit-singh-shreya-ghoshal-1080-publer.io.mp4",
    "assets/videos/Jeene-Laga-Hoon-Lyrical.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Video List"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text(
                "Items : ",
                style: TextStyle(fontSize: 25),
              ),
              Text(
                video_list.length.toString(),
                style: const TextStyle(fontSize: 25),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: video_list.length,
              itemBuilder: (context, index) {
                // Extract the song name from the file path
                String songName =
                    video_list[index].split('/').last.split('.').first;
                return ListTile(
                  leading: Image.asset(
                    "assets/videos/play-button.png",
                    height: 30,
                  ),
                  title: Text(
                    songName,
                    maxLines: 1,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VideoPlayerScreen(
                                  videoPath: video_list[index],
                                  currentSong: index,
                                  videoList: video_list,
                                )));
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
