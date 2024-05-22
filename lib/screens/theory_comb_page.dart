import 'package:flutter/material.dart';

class CombinationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What are combinations?'),
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
                          'Understanding combinations is crucial for selecting items from sets.',
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
                          'Combinations refer to the selection of items from a larger set where the order of the items does not matter.',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Formula:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'The number of ways to choose r items from a set of n is given by:\n'
                          'C(n, r) = n! / (r!(n-r)!)',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Example:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Consider a set of numbers: [1, 2, 3, 4, 5]. If we want to choose 3 numbers from this set, the possible combinations would be:\n'
                          '[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Combinations vs Permutations:',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'In permutations, the order of items matters, while in combinations it does not. For example, in permutations, [1, 2, 3] and [3, 2, 1] are considered different, but in combinations, they are the same.',
                          style: TextStyle(fontSize: 20.0, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Image.asset('assets/images/combinations.png'),
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
