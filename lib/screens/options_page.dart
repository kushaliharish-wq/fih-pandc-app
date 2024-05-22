import 'package:flutter/material.dart';
import 'learning_page.dart'; // Import the LearningPage

class OptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What do you want to do?'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/images/image.jpg"), // Replace "assets/background_image.jpg" with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  height: 10), // Add space between the app bar and the text
              Text(
                'Select an option',
                style: TextStyle(
                  fontSize: 45, // Match the font size with main.dart
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
              SizedBox(
                  height: 40), // Add space between the text and the buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LearningPage()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Increase padding to make button bigger
                      child: Text(
                        'Learning',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight
                                .bold), // Adjust text size to match main.dart
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 60), // Set minimum button size
                      shape: RoundedRectangleBorder(
                        // Apply rounded corners
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(width: 60), // Add gap of 40 pixels between buttons
                  ElevatedButton(
                    onPressed: () {
                      // Implement Practice functionality
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Increase padding to make button bigger
                      child: Text(
                        'Practice',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight
                                .bold), // Adjust text size to match main.dart
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 60), // Set minimum button size
                      shape: RoundedRectangleBorder(
                        // Apply rounded corners
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(width: 60), // Add gap of 40 pixels between buttons
                  ElevatedButton(
                    onPressed: () {
                      // Implement Test functionality
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(
                          16.0), // Increase padding to make button bigger
                      child: Text(
                        'Test',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight
                                .bold), // Adjust text size to match main.dart
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 60), // Set minimum button size
                      shape: RoundedRectangleBorder(
                        // Apply rounded corners
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
