import 'package:flutter/material.dart';

class PermutationGamePage extends StatefulWidget {
  @override
  _PermutationGamePageState createState() => _PermutationGamePageState();
}

class _PermutationGamePageState extends State<PermutationGamePage> {
  final List<String> characters = ['🍎', '🍊', '🍌', '🍇', '🍒'];
  List<String> selectedSet = [];
  int r = 3; // Number of characters to choose
  String feedback = '';

  void _toggleSelection(String character) {
    setState(() {
      if (selectedSet.contains(character)) {
        selectedSet.remove(character);
      } else if (selectedSet.length < r) {
        selectedSet.add(character);
      }
    });
  }

  List<List<String>> _generatePermutations(List<String> set, int r) {
    if (r == 0) return [[]];
    if (set.isEmpty) return [];

    return set.expand((first) {
      var remaining = set.where((c) => c != first).toList();
      return _generatePermutations(remaining, r - 1)
          .map((perm) => [first, ...perm])
          .toList();
    }).toList();
  }

  void _generateFeedback() {
    setState(() {
      if (selectedSet.length < r) {
        feedback = 'Select $r characters.';
        return;
      }
      var result = _generatePermutations(selectedSet, r);
      feedback = 'Valid Permutations:\n' +
          result.map((perm) => perm.join(' ')).join('\n');
    });
  }

  void _resetGame() {
    setState(() {
      selectedSet = [];
      feedback = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permutations Game'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select $r characters:',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 10),
              Center( // Wrap with Center widget
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10,
                  children: characters.map((character) {
                    final isSelected = selectedSet.contains(character);
                    return GestureDetector(
                      onTap: () => _toggleSelection(character),
                      child: CircleAvatar(
                        radius: 40,
                        child: Text(
                          character,
                          style: TextStyle(
                              fontSize: 30,
                              color: isSelected ? Colors.white : Colors.black),
                        ),
                        backgroundColor:
                            isSelected ? Colors.blue : Colors.grey[300],
                      ),
                    );
                  }).toList(),
                ),
              ), // End of Center widget
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
              Center( // Wrap with Center widget
                child: Text(
                  feedback,
                  style: TextStyle(
                      fontSize: 24, color: Colors.blue), // Increased font size
                ),
              ), // End of Center widget
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
