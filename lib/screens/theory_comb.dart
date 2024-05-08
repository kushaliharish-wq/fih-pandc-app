import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TheoryCombPage extends StatefulWidget {
  const TheoryCombPage({Key? key}) : super(key: key);

  @override
  _TheoryCombPageState createState() => _TheoryCombPageState();
}

class _TheoryCombPageState extends State<TheoryCombPage> {
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
        title: const Text('Combinations'),
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
                          'Combinations are a way of selecting items from a larger pool without considering the order.',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          'Unlike permutations, where order matters, combinations focus solely on the selection of items.',
                          style: TextStyle(fontSize: screenSize.width * 0.02),
                        ),
                        Text(
                          'For example, the number of combinations of n items taken r at a time is denoted by nCr = n! / (r!(n - r)!), where n! represents the factorial of n.',
                          style: TextStyle(fontSize: screenSize.width * 0.02),
                        ),
                        Text(
                          'Combinations are widely used in fields such as probability, statistics, and computer science for tasks like sampling, subsets, and combinations.',
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
