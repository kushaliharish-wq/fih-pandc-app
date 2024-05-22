import 'package:flutter/material.dart';

class PermutationGamePage extends StatefulWidget {
  @override
  _PermutationGamePageState createState() => _PermutationGamePageState();
}

class _PermutationGamePageState extends State<PermutationGamePage> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  int selectionSize = 3;
  List<List<Color>> validPermutations = [];
  List<Widget> feedbackWidgets = [];
  bool showPermutations = false;

  void _generateFeedback() {
    setState(() {
      validPermutations = [];
      feedbackWidgets.clear();
      _generatePermutations([], colors);

      if (validPermutations.isEmpty) {
        feedbackWidgets.add(Text(
          'No valid permutations for the selected colors.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ));
      } else {
        for (var permutation in validPermutations) {
          List<Widget> permutationIcons = [];
          for (var color in permutation) {
            permutationIcons.add(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: color,
                ),
              ),
            );
          }
          feedbackWidgets.add(
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: permutationIcons,
              ),
            ),
          );
        }
        feedbackWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Total permutations: 60',
              style: TextStyle(fontSize: 18),
            ),
          ),
        );
      }
      showPermutations = true;
    });
  }

  void _generatePermutations(List<Color> currentPermutation, List<Color> remainingColors) {
    if (currentPermutation.length == selectionSize) {
      validPermutations.add(List.from(currentPermutation));
      return;
    }

    for (int i = 0; i < remainingColors.length; i++) {
      List<Color> newPermutation = List.from(currentPermutation);
      newPermutation.add(remainingColors[i]);
      List<Color> newRemainingColors = List.from(remainingColors);
      newRemainingColors.removeAt(i);
      _generatePermutations(newPermutation, newRemainingColors);
    }
  }

  void _resetGame() {
    setState(() {
      validPermutations.clear();
      feedbackWidgets.clear();
      showPermutations = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permutation Game'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Out of the 5 colors, what are all the possible permutations for selecting $selectionSize colors?',
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: colors.map((color) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: color,
                            ),
                            SizedBox(height: 10), // Vertical space between rows
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'In this question, you need to find all possible arrangements of selecting $selectionSize colors out of 5 without repetition.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 10),
                Text(
                  'Try to solve the problem yourself before checking the answer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _generateFeedback,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Generate Permutations',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                if (showPermutations) ...feedbackWidgets,
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetGame,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Reset',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PermutationGamePage(),
  ));
}
