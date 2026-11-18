import 'package:flutter/material.dart';

List<String> images = [
  "EX-3/assets/bird.jpg",
  "EX-3/assets/bird2.jpg",
  "EX-3/assets/insect.jpg",
  "EX-3/assets/girl.jpg",
  "EX-3/assets/man.jpg",
];

// pubspec.yaml must list the assets:
//
// flutter:
//   assets:
//     - assets/

void main() => runApp(const MaterialApp(
      // Hides the red DEBUG banner shown in debug builds.
      debugShowCheckedModeBanner: false,
      home: ImageGallery(),
    ));

// Wrap Scaffold: the app bar buttons and the body both depend on the state.
class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  // State type: one int, the index of the displayed image.
  int _index = 0;

  void _previous() {
    setState(() {
      // Adding images.length avoids a negative index (circular carousel).
      _index = (_index - 1 + images.length) % images.length;
    });
  }

  void _next() {
    setState(() {
      _index = (_index + 1) % images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _previous,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _next,
            ),
          ),
        ],
      ),
      body: Image.asset(images[_index]),
    );
  }
}
