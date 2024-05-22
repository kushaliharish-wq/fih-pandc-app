import 'package:flutter/material.dart';

class CombinationGamePage extends StatefulWidget {
  @override
  _CombinationGamePageState createState() => _CombinationGamePageState();
}

class _CombinationGamePageState extends State<CombinationGamePage> {
  final List<Color> colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
  ];

  int basketSize = 3;
  List<List<Color>> validCombinations = [];
  List<Widget> feedbackWidgets = [];

  void _generateFeedback() {
    setState(() {
      validCombinations = [];
      feedbackWidgets.clear();
      _generateCombinations(0, [], 0);

      if (validCombinations.isEmpty) {
        feedbackWidgets.add(Text(
          'No valid combinations for the selected colors.',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ));
      } else {
        for (var combination in validCombinations) {
          List<Widget> combinationIcons = [];
          for (var color in combination) {
            combinationIcons.add(
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
                children: combinationIcons,
              ),
            ),
          );
        }
      }
    });
  }

  void _generateCombinations(int index, List<Color> currentCombination, int count) {
    if (count == basketSize) {
      validCombinations.add(List.from(currentCombination));
      return;
    }

    for (int i = index; i < colors.length; i++) {
      currentCombination.add(colors[i]);
      _generateCombinations(i + 1, currentCombination, count + 1);
      currentCombination.removeLast();
    }
  }

  void _resetGame() {
    setState(() {
      validCombinations.clear();
      feedbackWidgets.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Combination Game'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Out of the 5 colors, what are all the possible combinations for selecting $basketSize colors to fill the basket.',
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
                ElevatedButton(
                  onPressed: _generateFeedback,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Generate Combinations',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  children: feedbackWidgets,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _resetGame,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Reset Game',
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
    home: CombinationGamePage(),
  ));
}
