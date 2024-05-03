import 'package:flutter/material.dart';
import 'perm_game_page.dart'; // Import the game page

class PermutationsPage extends StatefulWidget {
  @override
  _PermutationsPageState createState() => _PermutationsPageState();
}

class _PermutationsPageState extends State<PermutationsPage> {
  // Example data for permutations
  final List<int> numbers = [1, 2, 3];
  List<List<int>> permutations = [];

  @override
  void initState() {
    super.initState();
    _generatePermutations(numbers, 0);
  }

  // Helper function to generate permutations
  void _generatePermutations(List<int> nums, int start) {
    if (start == nums.length - 1) {
      setState(() {
        permutations.add(List<int>.from(nums));
      });
    } else {
      for (int i = start; i < nums.length; i++) {
        _swap(nums, start, i);
        _generatePermutations(nums, start + 1);
        _swap(nums, start, i);
      }
    }
  }

  void _swap(List<int> nums, int i, int j) {
    int temp = nums[i];
    nums[i] = nums[j];
    nums[j] = temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What is Permutations?'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Permutations',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/permutations.png'),
            SizedBox(height: 20),
            Text(
              'Permutations refer to the arrangement of items in all possible sequences. The number of permutations of n objects is n! (n factorial). Order matters in permutation!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Example permutations of [1, 2, 3]:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: permutations.length,
                itemBuilder: (context, index) {
                  return Text(permutations[index].toString());
                },
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the permutation game page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PermutationGamePage()),
                  );
                },
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
