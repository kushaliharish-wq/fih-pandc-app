import 'package:flutter/material.dart';

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
        title: const Text('What are permutations?'),
      ),
      body: FutureBuilder(
        future: Future.delayed(Duration(seconds: 1)), // Simulating a future initialization
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Understanding permutations is crucial for arranging items in sequences.',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            shadows: [
                              Shadow(
                                blurRadius: 1.0,
                                color: Colors.black,
                                offset: const Offset(1.0, 1.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Permutations refer to the arrangement of items in all possible sequences. The number of permutations of n objects is n! (n factorial). Order matters in permutation!',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Example permutations of [1, 2, 3]:',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        for (var perm in permutations)
                          Text(
                            perm.toString(),
                            style: TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset('assets/images/permutations.png'),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
