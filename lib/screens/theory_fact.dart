// // import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() => runApp(const VideoPlayerApp());

// class VideoPlayerApp extends StatelessWidget {
//  const VideoPlayerApp({Key? key}) : super(key: key);

//  @override
//  Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Video Player Demo',
//       home: VideoPlayerScreen(),
//     );
//  }
// }

// class VideoPlayerScreen extends StatefulWidget {
//  const VideoPlayerScreen({Key? key}) : super(key: key);

//  @override
//  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//  late VideoPlayerController _controller;
//  late Future<void> _initializeVideoPlayerFuture;

//  @override
//  void initState() {
//     super.initState();

//     _controller = VideoPlayerController.asset('assets/videos/FactorialExpl.mp4');

//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//  }

//  @override
//  void dispose() {
//     _controller.dispose();
//     super.dispose();
//  }

//  @override
//  Widget build(BuildContext context) {
//     // Use MediaQuery to get the screen size
//     final screenSize = MediaQuery.of(context).size;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Local Video Player'),
//       ),
//       body: FutureBuilder(
//         future: _initializeVideoPlayerFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // Adjust the layout based on the screen size
//             return Column(
//               children: [
//                 Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Wrap(
//                    children: [
//                      Text(
//                        'Understanding factorials is crucial for calculating permutations and combinations.',
//                        style: TextStyle(fontSize: screenSize.width * 0.04, fontWeight: FontWeight.bold),
//                      ),
//                      // Add more Text widgets as needed
//                    ],
//                  ),
//                 ),
//                 AspectRatio(
//                  aspectRatio: _controller.value.aspectRatio,
//                  child: VideoPlayer(_controller),
//                 ),
//                 Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: Text(
//                     'Video by: Your Video Creator Name',
//                     style: TextStyle(fontSize: screenSize.width * 0.04, fontStyle: FontStyle.italic),
//                  ),
//                 ),
//               ],
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             if (_controller.value.isPlaying) {
//               _controller.pause();
//             } else {
//               _controller.play();
//             }
//           });
//         },
//         child: Icon(
//           _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//         ),
//       ),
//     );
//  }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(const VideoPlayerApp());

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

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
    // Use MediaQuery to get the screen size
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Video Player'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Adjust the layout based on the screen size
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8.0, // Adjust spacing between lines
                    runSpacing: 4.0, // Adjust spacing between runs
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Video by: Your Video Creator Name',
                    style: TextStyle(
                        fontSize: screenSize.width * 0.04,
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