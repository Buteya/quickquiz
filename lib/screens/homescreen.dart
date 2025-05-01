import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController controller = CarouselController(initialItem: 1);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children:[ ConstrainedBox(
          constraints: BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height *0.77,),
          child: CarouselView.weighted(
            controller: controller,
            itemSnapping: true,
            flexWeights: const <int>[1, 7, 1],
            children: [
              Container(
                color: Colors.deepOrangeAccent,
              ),
              Container(
                color: Colors.blueAccent,
              ),
              Container(
                color: Colors.deepPurpleAccent,
              ),
              Container(
                color: Colors.deepOrangeAccent,
              ),
              Container(
                color: Colors.blueAccent,
              ),
              Container(
                color: Colors.deepPurpleAccent,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
