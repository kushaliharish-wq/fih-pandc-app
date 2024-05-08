import 'package:flutter/material.dart';
import 'theory_fact_page.dart';
import 'solved_ex_page.dart'; // Import the Solved Examples page

class LearningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Options'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayerScreen()),
                );
                // Implement Theoretical functionality
              },
              child: Text('Theoretical'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Solved Examples page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PermCombGamePage()),
                );
              },
              child: Text('Solved Example'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
