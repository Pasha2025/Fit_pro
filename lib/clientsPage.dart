// ignore_for_file: file_names

import 'package:fit_pro/main.dart';
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
      home: HomeScreen(),
    );
  }
}

class ClientsPage extends StatelessWidget {
  final List<Map<String, String>> testimonials = [
    {
      "before": "assets/images/divya before_resized.jpg",
      "after": "assets/images/divya after_resized.jpg",
      "name": "Divya",
      "description": "Reduced 12 kg in 3 months",
    },
    {
      "before": "assets/images/gopi krishna before_resized.jpg",
      "after": "assets/images/gopi krishna After_resized.jpg",
      "name": "Gopi Krishna",
      "description": "Reduced 39 kg in 9 months, 15 days",
    },
    {
      "before": "assets/images/vinay reddy before_resized.jpg",
      "after": "assets/images/vinay reddy after_resized.png",
      "name": "Vinay Reddy",
      "description":
          "Reduced 30 kg in 9 months, (16 inch) 40 centimeters waistline",
    },
  ];

  ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Some More Testimonials"),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: testimonials.length,
          itemBuilder: (context, index) {
            var item = testimonials[index];
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${item['name']} - ${item['description']}",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text("Before",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Image.asset(item["before"]!,
                                width: 120, height: 160, fit: BoxFit.cover),
                          ],
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Text("After",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Image.asset(item["after"]!,
                                width: 120, height: 160, fit: BoxFit.cover),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
