import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TheoryFactPage extends StatefulWidget {
  const TheoryFactPage({Key? key}) : super(key: key);

  @override
  _TheoryFactPageState createState() => _TheoryFactPageState();
}

class _TheoryFactPageState extends State<TheoryFactPage> {
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
        title: const Text('Factorials'),
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
                          'Understanding factorials is crucial for calculating permutations and combinations.',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Text(
                          'Factorials represent the number of ways to arrange a set of items, which is fundamental in combinatorial problems.',
                          style: TextStyle(fontSize: screenSize.width * 0.02),
                        ),
                        Text(
                          'For example, the number of ways to arrange n items is n!, and the number of ways to choose r items from a set of n is nCr = n! / (r!(n-r)!).',
                          style: TextStyle(fontSize: screenSize.width * 0.02),
                        ),
                        Text(
                          'This mathematical foundation allows us to solve complex problems in probability, statistics, and beyond.',
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
