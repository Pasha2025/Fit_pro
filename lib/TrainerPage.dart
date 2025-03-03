import 'package:fit_pro/clientsPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class TrainerPage extends StatelessWidget {
  const TrainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HostScreen(),
    );
  }
}

class HostScreen extends StatelessWidget {
  const HostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              color: Colors.blue[900],
              width: double.infinity,
              child: Center(
                child: Text(
                  "Know Your Host",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(
                  'assets/images/vinay reddy_circleAvatar.jpg'), // Replace with actual image
            ),
            SizedBox(height: 15),
            Text(
              "Vinay Reddy",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "Wellness Coach",
              style: TextStyle(fontSize: 16, color: Colors.orange),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoRow(
                      "Mr. Vinay Reddy is one of the top leading wellness coaches in India."),
                  InfoRow("Over 15 years of expertise."),
                  InfoRow(
                      "He has helped over 15,000 families transform their health."),
                  InfoRow(
                      "On a mission to make every Indian a 360 Fit Pro personality."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String text;
  const InfoRow(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.blue),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
