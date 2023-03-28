import 'package:animation/enum.dart';
import 'package:animation/select_size_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StarbucksSize starbucksSize = StarbucksSize.small;

  void _changeSize(StarbucksSize newSize) {
    setState(() {
      starbucksSize = newSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Select coffee size",
            style: TextStyle(
                fontSize: 25,
                color: Colors.orange,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SelectSizeButton(
                text: "L",
                backgroundColor: starbucksSize == StarbucksSize.large
                    ? Colors.black
                    : Colors.black.withOpacity(0.1),
                onStarbucksSizedChanged: () => _changeSize(StarbucksSize.large),
              ),
              SelectSizeButton(
                  onStarbucksSizedChanged: () =>
                      _changeSize(StarbucksSize.medium),
                  backgroundColor: starbucksSize == StarbucksSize.medium
                      ? Colors.black
                      : Colors.black.withOpacity(0.1),
                  text: "M"),
              SelectSizeButton(
                  onStarbucksSizedChanged: () =>
                      _changeSize(StarbucksSize.small),
                  backgroundColor: starbucksSize == StarbucksSize.small
                      ? Colors.black
                      : Colors.black.withOpacity(0.1),
                  text: "S")
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          AnimatedContainer(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            height: starbucksSize == StarbucksSize.small
                ? 170
                : starbucksSize == StarbucksSize.medium
                    ? 270
                    : 350,
            duration: Duration(milliseconds: 200),
            child: Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('images/star.png'))),
          ),
        ],
      ),
    );
  }
}
