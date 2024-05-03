import 'package:flutter/material.dart';
import 'solved_ex_page2.dart'; // Import the fruit basket challenge page

class PermCombGamePage extends StatefulWidget {
  @override
  _PermCombGamePageState createState() => _PermCombGamePageState();
}

class _PermCombGamePageState extends State<PermCombGamePage> {
  final List<String> characters = ['🍎', '🍊', '🍌', '🍇', '🍒'];
  List<String> selectedSet = [];
  int r = 3; // Number of characters to choose
  String mode = 'combinations'; // 'combinations' or 'permutations'
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

  List<List<String>> _generateCombinations(List<String> set, int r) {
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
      var result = mode == 'combinations'
          ? _generateCombinations(selectedSet, r)
          : _generatePermutations(selectedSet, r);
      feedback =
          'Valid ${mode == 'combinations' ? 'Combinations' : 'Permutations'}:\n' +
              result.map((comb) => comb.toString()).join('\n');
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
        title: Text('Permutations & Combinations Game'),
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
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: characters.map((character) {
                  final isSelected = selectedSet.contains(character);
                  return GestureDetector(
                    onTap: () => _toggleSelection(character),
                    child: CircleAvatar(
                      radius: 30,
                      child: Text(
                        character,
                        style: TextStyle(
                            fontSize: 24,
                            color: isSelected ? Colors.white : Colors.black),
                      ),
                      backgroundColor:
                          isSelected ? Colors.blue : Colors.grey[300],
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ToggleButtons(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Combinations'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Permutations'),
                  ),
                ],
                isSelected: [mode == 'combinations', mode == 'permutations'],
                onPressed: (int index) {
                  setState(() {
                    mode = index == 0 ? 'combinations' : 'permutations';
                    feedback = '';
                  });
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateFeedback,
                child: Text('Generate $mode'),
              ),
              SizedBox(height: 20),
              Text(
                feedback,
                style: TextStyle(
                    fontSize: 24, color: Colors.blue), // Increased font size
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _resetGame,
                child: Text('Reset Game'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DessertPage()),
                  );
                },
                child: Text('Another one!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
