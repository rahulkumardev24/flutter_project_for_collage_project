import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  final int currentSong;
  final List<String> videoList; // Add this to pass video list

  VideoPlayerScreen({
    super.key,
    required this.videoPath,
    required this.currentSong,
    required this.videoList,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  bool isVisible = true;
  bool isFullscreen = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentSong;
    _initializeVideoPlayer(widget.videoPath);
  }

  /// Initializes the video player with the video at the given index
  void _initializeVideoPlayer(String videoPath) {
    _videoPlayerController = VideoPlayerController.asset(videoPath)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      })
      ..addListener(() {
        setState(() {});
      });
  }

  /// Changes the video based on the selected index
  Future<void> changeVideo(int newIndex) async {
    if (newIndex >= 0 && newIndex < widget.videoList.length) {
      await _videoPlayerController.pause();
      await _videoPlayerController.dispose();
      setState(() {
        currentIndex = newIndex;
        _initializeVideoPlayer(widget.videoList[currentIndex]);
      });
    }
  }

  /// Toggles between fullscreen and normal mode
  void toggleFullscreen() {
    final bool wasPlaying = _videoPlayerController.value.isPlaying;
    final Duration currentPosition = _videoPlayerController.value.position;

    setState(() {
      if (isFullscreen) {
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight
        ]);
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
      }
      isFullscreen = !isFullscreen;
    });

    if (wasPlaying) {
      _videoPlayerController.play();
    } else {
      _videoPlayerController.pause();
    }
    _videoPlayerController.seekTo(currentPosition);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPlaying = _videoPlayerController.value.isPlaying;

    return Scaffold(
      appBar: isFullscreen
          ? null
          : AppBar(
              title: const Text("Video Player Screen"),
            ),
      body: Center(
        child: _videoPlayerController.value.isInitialized
            ? isFullscreen
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isPlaying) {
                          _videoPlayerController.pause();
                          isVisible = true;
                        } else {
                          _videoPlayerController.play();
                          isVisible = false;
                        }
                      });
                    },
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: VideoPlayer(_videoPlayerController),
                        ),

                        /// full screen icon
                        if (isVisible)
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: const Icon(
                                Icons.fullscreen_exit,
                                color: Colors.white,
                              ),
                              onPressed: toggleFullscreen,
                            ),
                          ),

                        /// Slider
                        if (isVisible)
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Slider(
                              value: _videoPlayerController
                                  .value.position.inSeconds
                                  .toDouble(),
                              min: 0.0,
                              max: _videoPlayerController
                                  .value.duration.inSeconds
                                  .toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  _videoPlayerController
                                      .seekTo(Duration(seconds: value.toInt()));
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AspectRatio(
                          aspectRatio: _videoPlayerController.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              VideoPlayer(_videoPlayerController),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isPlaying) {
                                      _videoPlayerController.pause();
                                      isVisible = true;
                                    } else {
                                      _videoPlayerController.play();
                                      isVisible = false;
                                    }
                                  });
                                },
                                child: AnimatedOpacity(
                                  duration: const Duration(seconds: 1),
                                  opacity: isVisible ? 1 : 0,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black54,
                                    radius: 30,
                                    child: Icon(
                                      isPlaying
                                          ? Icons.pause
                                          : Icons.play_arrow,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: IconButton(
                                  icon: Icon(
                                    isFullscreen
                                        ? Icons.fullscreen_exit
                                        : Icons.fullscreen,
                                    color: Colors.white,
                                  ),
                                  onPressed: toggleFullscreen,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                left: 10,
                                right: 10,
                                child: Slider(
                                  value: _videoPlayerController
                                      .value.position.inSeconds
                                      .toDouble(),
                                  min: 0.0,
                                  max: _videoPlayerController
                                      .value.duration.inSeconds
                                      .toDouble(),
                                  onChanged: (value) {
                                    setState(() {
                                      _videoPlayerController.seekTo(
                                          Duration(seconds: value.toInt()));
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (currentIndex > 0) {
                                    changeVideo(currentIndex - 1);
                                  }
                                },
                                icon: const Icon(Icons.skip_previous_rounded),
                              ),
                              IconButton(
                                onPressed: () {
                                  if (currentIndex <
                                      widget.videoList.length - 1) {
                                    changeVideo(currentIndex + 1);
                                  }
                                },
                                icon: const Icon(Icons.skip_next_rounded),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
