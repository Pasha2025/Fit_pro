import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MasterClassPage(),
    );
  }
}

class MasterClassPage extends StatelessWidget {
  const MasterClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Masterclass Details'),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildSectionTitle('What You Will Get From The Masterclass...'),
              _buildBulletPoints([
                "How to Optimize your workouts",
                "How to Improve your nutrition",
                "How to Master your mindset",
                "How to Reduce snoring",
                "How to Reduce waist size",
                "How to Optimize cellular nutrition",
                "Personalized guidance and community support"
              ]),
              SizedBox(height: 20),
              _buildSectionTitle('For Whom is This Masterclass?'),
              _buildBulletPoints([
                "Working Professionals - Improve health & look better",
                "Entrepreneurs - Unlock peak performance",
                "Students - Adopt healthy nutrition for better focus",
                "Housewives - Maintain good health despite a busy schedule",
              ]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      color: Colors.blue[800],
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildBulletPoints(List<String> points) {
    return Column(
      children: points
          .map((point) => ListTile(
                leading: Icon(Icons.check_circle, color: Colors.blue),
                title: Text(point, style: TextStyle(fontSize: 16)),
              ))
          .toList(),
    );
  }
}
