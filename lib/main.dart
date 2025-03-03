// ignore_for_file: library_private_types_in_public_api

// ignore: depend_on_referenced_packages

import 'package:fit_pro/TrainerPage.dart';
import 'package:fit_pro/clientsPage.dart';
import 'package:fit_pro/masterClassPage.dart';
import 'package:fit_pro/registerScreen.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FIT PRO METHOD',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ClientsPage(),
    MasterClassPage(),
    TrainerPage(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Clients'),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), label: 'Master Class'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: 'Trainer'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '1aVw1gZ9Ncg', // Extracted YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage:
                  AssetImage('assets/images/vinay reddy_circleAvatar.jpg'),
            ),
            SizedBox(width: 10),
            Text('FIT PRO METHOD'),
          ],
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            FadeIn(
              duration: const Duration(seconds: 2),
              child: const Text(
                'Welcome to FIT PRO METHOD! Stay fit and healthy with our customized workout plans.',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 10),
            FadeIn(
              duration: const Duration(seconds: 2),
              child: const Text(
                'Join us today and take your fitness to the next level!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(height: 6),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
                child: const Text('Register Now'),
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 13, 54, 238)),
              child: Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('About Us'),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Please be advised that the content shown on this page is not intended to serve as a guarantee. '
                'In fact, as stipulated by law, we can not and do not make any guarantees about your ability to get '
                'results or earn any money with our ideas, information, tools, or strategies. We don’t know you and, '
                'besides, your results are up to you. Agreed? We just want to help you by giving great content, direction, '
                'and strategies that worked well for us and our students and that we believe can move you forward. '
                'All of our terms, privacy policies, and disclaimers for this program and website can be accessed on the next page. '
                'We feel transparency is important and we hold ourselves and you to a high standard of integrity. '
                'Thanks for stopping by. We hope this training and content brings you a lot of value.\n\n'
                '©2024, Vinay Reddy, All Rights Reserved',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
            ),
            // ListTile(
            //   leading: Icon(Icons.contact_mail),
            //   title: Text('Contact'),
            // ),
          ],
        ),
      ),
    );
  }
}
