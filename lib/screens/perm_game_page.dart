import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:confetti/confetti.dart';
import 'theory_comb_page.dart'; // Import the combinations page

class PermutationGamePage extends StatefulWidget {
  @override
  _PermutationGamePageState createState() => _PermutationGamePageState();
}

class _PermutationGamePageState extends State<PermutationGamePage> {
  final List<int> numbers = [1, 2, 3];
  List<int> permutation = [];
  List<List<int>> seenPermutations = [];
  late ConfettiController _confettiController;
  bool showCelebration = false;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _resetPermutation();
  }

  void _resetPermutation() {
    setState(() {
      permutation = List<int>.from(numbers);
      seenPermutations = [];
      showCelebration = false;
    });
    _confettiController.stop();
  }

  void _checkPermutation() {
    var equality = const ListEquality<int>();
    if (!seenPermutations.any((perm) => equality.equals(perm, permutation))) {
      setState(() {
        seenPermutations.add(List<int>.from(permutation));
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("New permutation added!")),
      );

      // Check if all permutations have been generated
      if (seenPermutations.length == _calculateFactorial(numbers.length)) {
        setState(() {
          showCelebration = true;
        });
        _confettiController.play();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Permutation already seen.")),
      );
    }
  }

  int _calculateFactorial(int n) {
    return n == 0 ? 1 : n * _calculateFactorial(n - 1);
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permutation Game'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Drag and drop to arrange the numbers:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    children: permutation.map((number) {
                      return Draggable<int>(
                        data: number,
                        feedback: CircleAvatar(
                          child: Text(number.toString()),
                        ),
                        child: CircleAvatar(
                          child: Text(number.toString()),
                        ),
                        childWhenDragging: Container(
                          width: 40,
                          height: 40,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                DragTarget<int>(
                  builder: (context, candidateData, rejectedData) {
                    return Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Drop here to rearrange",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                  onAccept: (int data) {
                    setState(() {
                      permutation.remove(data);
                      permutation.add(data);
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _checkPermutation,
                  child: Text("Check Permutation"),
                ),
                SizedBox(height: 20),
                Text(
                  'Permutations seen so far:',
                  style: TextStyle(fontSize: 16),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: seenPermutations.length,
                    itemBuilder: (context, index) {
                      return Text(seenPermutations[index].toString());
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: _resetPermutation,
                  child: Text("Reset"),
                ),
                SizedBox(height: 20),
                // Button to navigate to combinations page
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CombinationsPage()),
                    );
                  },
                  child: Text("Go to Combinations"),
                ),
              ],
            ),
          ),
          if (showCelebration)
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Good job!!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    colors: [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                      Colors.orange,
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
