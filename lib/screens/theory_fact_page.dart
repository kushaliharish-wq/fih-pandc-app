import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Import your desired next page
import 'theory_perm_page.dart'; // Adjust the import to match your actual file

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Initialize the video player with the asset video
    _controller =
        VideoPlayerController.asset('assets/videos/FactorialExpl.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('What are factorials?'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          Text(
                            'Understanding factorials is crucial for calculating permutations and combinations.',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                          Text(
                            'Factorials represent the number of ways to arrange a set of items, which is fundamental in combinatorial problems.',
                            style: TextStyle(fontSize: screenSize.width * 0.04),
                          ),
                          Text(
                            'For example, the number of ways to arrange n items is n!, and the number of ways to choose r items from a set of n is nCr = n! / (r!(n-r)!).',
                            style: TextStyle(fontSize: screenSize.width * 0.04),
                          ),
                          Text(
                            'This mathematical foundation allows us to solve complex problems in probability, statistics, and beyond.',
                            style: TextStyle(fontSize: screenSize.width * 0.04),
                          ),
                        ],
                      ),
                    ),
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        child: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the next screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PermutationsPage()),
                      );
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
