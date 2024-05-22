import 'package:flutter/material.dart';
import 'screens/options_page.dart'; // Make sure this path matches your file structure

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Permutation & Combination Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PermCombUI(),
    );
  }
}

class PermCombUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "assets/images/image.jpg"), // Replace "assets/background_image.jpg" with your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Permutations & Combinations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors
                        .black, // Text color changed to white for better visibility
                    shadows: [
                      Shadow(
                        blurRadius: 1.0,
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                      ),
                    ],
                    fontFamily: 'Montserrat', // Example of using a custom font
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(20), // Add padding around the button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OptionsPage()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical:
                              10), // Add vertical padding inside the button
                      child: Text(
                        'Let\'s Go',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white, // Set text color
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        // Apply rounded corners
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(200, 60),
                      backgroundColor: Colors.amber, // Set background color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
