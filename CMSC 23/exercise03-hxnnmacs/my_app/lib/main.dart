/*
Macasarte, Hanna Julia L. 
CMSC 23 U1L - Exercise 3
*/

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// had to change to Stateful widget, because we'll be updating number of posts.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// moved most variables, methods in one class so they can access each other easily.
class _MyAppState extends State<MyApp> {
  List<String> postPictures = [
    "images/doja1.jpg",
    "images/doja2.jpg",
    "images/doja3.jpg",
    "images/doja4.jpg",
    "images/doja5.jpg",
    "images/doja6.jpg",
  ];

  int visiblePosts = 3;

  void _incrementCounter() {
    setState(() {
      // only increments if counter still hasn't reached the total numbers of pictures stored.
      if (visiblePosts < postPictures.length) {
        visiblePosts++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CMSC 23 - Exercise 3',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFCE1040),
          title: const Text(
            '@amala_dlamini',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Profile Picture
                  Container(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: Image.asset(
                        'images/doja_profile.jpeg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                  const SizedBox(width: 45),

                  // contains user display name and Add Bio button.
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Expanded(
                              child: Text(
                                "dojacat",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Add Bio'),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.pink,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('$visiblePosts Posts'),
                            const Text('123 Following'),
                            const Text('999 Followers'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // contains row of text buttons
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.image),
                      label: const Text("Posts"),
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFFE91E63),
                      ),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.videocam),
                      label: const Text("Reels"),
                      style: TextButton.styleFrom(foregroundColor: Colors.pink),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.save),
                      label: const Text("Saved"),
                      style: TextButton.styleFrom(foregroundColor: Colors.pink),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.tag),
                      label: const Text("Tagged"),
                      style: TextButton.styleFrom(foregroundColor: Colors.pink),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // the grid view.
              Expanded(child: profileInfo(visiblePosts, postPictures)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

Widget profileInfo(int visiblePosts, List<String> postPictures) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
    ),
    itemCount: visiblePosts,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Image.asset(postPictures[index], fit: BoxFit.cover),
      );
    },
  );
}

/* REFERENCES
1. Change AppBar Color
https://dev.to/kuldeeptarapara/how-to-change-appbar-color-in-flutter-a-beginners-tutorial-1h99

2. Change AppBar Text Color
https://stackoverflow.com/questions/60659506/how-do-i-change-the-colour-of-the-text-in-my-flutter-appbar

3. Text Button Icon
https://api.flutter.dev/flutter/material/TextButton/TextButton.icon.html
*/
