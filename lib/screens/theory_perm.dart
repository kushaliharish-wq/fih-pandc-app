import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TheoryPermPage extends StatefulWidget {
  const TheoryPermPage({Key? key}) : super(key: key);

  @override
  _TheoryPermPageState createState() => _TheoryPermPageState();
}

class _TheoryPermPageState extends State<TheoryPermPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/videos/FactorialExpl.mp4');
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
        title: const Text('Permutations'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      spacing: 8.0,
                      runSpacing: 4.0,
                      children: [
                        Text(
                          'Understanding permutations is essential in combinatorial mathematics.',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          'Permutations refer to the arrangement of objects in a specific order.',
                          style: TextStyle(fontSize: screenSize.width * 0.02),
                        ),
                        Text(
                          'For example, the number of permutations of n items taken r at a time is denoted by nPr = n! / (n - r)!, where n! represents the factorial of n.',
                          style: TextStyle(fontSize: screenSize.width * 0.02),
                        ),
                        Text(
                          'Permutations are used in various fields, including probability, statistics, and computer science, to solve problems related to arrangements and orderings.',
                          style: TextStyle(fontSize: screenSize.width * 0.02),
                        ),
                      ],
                    ),
                  ),
                  AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Video by: Your Video Creator Name',
                      style: TextStyle(
                          fontSize: screenSize.width * 0.02,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
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
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
