import 'package:flutter/material.dart';

class DessertPage extends StatefulWidget {
  @override
  _DessertPageState createState() => _DessertPageState();
}

class _DessertPageState extends State<DessertPage> {
  final List<String> flavorEmojis = ['🍦', '🍨', '🍧', '🍭', '🍫', '🍬'];
  final List<String> flavorNames = [
    'Vanilla',
    'Chocolate',
    'Strawberry',
    'Mint',
    'Cookie Dough',
    'Pistachio'
  ];

  List<String> selectedSet = [];
  String mode = 'combinations'; // 'combinations' or 'permutations'
  String task = '';
  String feedback = '';
  int taskSize = 3; // The number of flavors to choose

  @override
  void initState() {
    super.initState();
    _generateTask();
  }

  void _toggleSelection(String flavorName) {
    setState(() {
      if (selectedSet.contains(flavorName)) {
        selectedSet.remove(flavorName);
      } else if (selectedSet.length < taskSize) {
        selectedSet.add(flavorName);
      }
      _generateFeedback();
    });
  }

  void _generateTask() {
    setState(() {
      taskSize = 3; // Adjust the size as required
      selectedSet = [];
      mode = (taskSize % 2 == 0) ? 'combinations' : 'permutations';
      task = mode == 'combinations'
          ? 'Create combinations of $taskSize flavors'
          : 'Create permutations of $taskSize flavors';
      feedback = '';
    });
  }

  void _generateFeedback() {
    if (selectedSet.length < taskSize) {
      setState(() {
        feedback = 'Select $taskSize flavors.';
      });
      return;
    }

    List<List<String>> result = mode == 'combinations'
        ? _generateCombinations(selectedSet, taskSize)
        : _generatePermutations(selectedSet, taskSize);

    setState(() {
      feedback =
          'Valid ${mode == 'combinations' ? 'Combinations' : 'Permutations'}:\n' +
              result.map((arrangement) => arrangement.toString()).join('\n');
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dessert Challenge'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                task,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: List.generate(flavorEmojis.length, (index) {
                  final flavorName = flavorNames[index];
                  final flavorEmoji = flavorEmojis[index];
                  final isSelected = selectedSet.contains(flavorName);
                  return GestureDetector(
                    onTap: () => _toggleSelection(flavorName),
                    child: CircleAvatar(
                      radius: 30, // Adjust size as needed
                      child: Text(
                        flavorEmoji,
                        style: TextStyle(
                          fontSize: 24,
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      backgroundColor:
                          isSelected ? Colors.blue : Colors.grey[300],
                    ),
                  );
                }),
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
                style: TextStyle(fontSize: 20, color: Colors.blue),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _generateTask,
                child: Text('New Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
