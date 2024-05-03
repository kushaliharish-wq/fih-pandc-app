import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class CombinationsGamePage extends StatefulWidget {
  @override
  _CombinationsGamePageState createState() => _CombinationsGamePageState();
}

class _CombinationsGamePageState extends State<CombinationsGamePage> {
  final List<int> fullSet = [1, 2, 3, 4, 5, 6, 7, 8];
  List<int> selectedSet = [];
  int r = 3; // Number of items to choose
  late ConfettiController _confettiController;
  bool showCelebration = false;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  void _toggleSelection(int number) {
    setState(() {
      if (selectedSet.contains(number)) {
        selectedSet.remove(number);
      } else if (selectedSet.length < r) {
        selectedSet.add(number);
      }
      _checkCombination();
    });
  }

  void _checkCombination() {
    if (selectedSet.length == r) {
      setState(() {
        showCelebration = true;
      });
      _confettiController.play();
    } else {
      setState(() {
        showCelebration = false;
        _confettiController.stop();
      });
    }
  }

  List<List<int>> _generateCombinations(List<int> set, int r) {
    if (r == 0) return [[]];
    if (set.isEmpty) return [];

    var first = set[0];
    var remaining = set.sublist(1);

    var withFirst = _generateCombinations(remaining, r - 1)
        .map((comb) => [first, ...comb])
        .toList();
    var withoutFirst = _generateCombinations(remaining, r);

    return withFirst + withoutFirst;
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
        title: Text('Combinations Game'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select $r numbers from the set:',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: fullSet.map((number) {
                    final isSelected = selectedSet.contains(number);
                    return GestureDetector(
                      onTap: () => _toggleSelection(number),
                      child: CircleAvatar(
                        child: Text(
                          number.toString(),
                          style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black),
                        ),
                        backgroundColor:
                            isSelected ? Colors.blue : Colors.grey[300],
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                if (selectedSet.length == r)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valid Combinations:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      ..._generateCombinations(selectedSet, r)
                          .map((comb) => Text(comb.toString()))
                          .toList(),
                    ],
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedSet = [];
                      showCelebration = false;
                      _confettiController.stop();
                    });
                  },
                  child: Text('Reset Selection'),
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
