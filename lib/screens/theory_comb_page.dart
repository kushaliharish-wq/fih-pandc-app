import 'package:flutter/material.dart';
import 'comb_game_page.dart'; // Import the game page

class CombinationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Combinations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Center the image
            Center(
              child: Image.asset(
                'assets/images/combinations.png',
                fit: BoxFit.contain, // Ensures the image fits the screen width
                width: double.infinity, // Take the full width of the parent
                height: MediaQuery.of(context).size.height *
                    0.3, // Adjust height proportionally
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Combinations',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Combinations refer to the selection of items from a larger set where the order of the items does not matter.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Formula:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'The number of ways to choose r items from a set of n is given by:\n'
              'C(n, r) = n! / (r!(n-r)!)',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Example:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Consider a set of numbers: [1, 2, 3, 4, 5]. If we want to choose 3 numbers from this set, the possible combinations would be:\n'
              '[1, 2, 3], [1, 2, 4], [1, 2, 5], [1, 3, 4], [1, 3, 5], [1, 4, 5], [2, 3, 4], [2, 3, 5], [2, 4, 5], [3, 4, 5]',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Combinations vs Permutations:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'In permutations, the order of items matters, while in combinations it does not. For example, in permutations, [1, 2, 3] and [3, 2, 1] are considered different, but in combinations, they are the same.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CombinationsGamePage()),
                  );
                },
                child: Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
