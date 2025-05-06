import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CarouselController controller = CarouselController(initialItem: 1);
  var db = FirebaseFirestore.instance;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset(
              "assets/icons/app/quickquizlogo.png",
              scale: 7.5,
            ),
            Text("quickquiz"),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: () {
                if (mounted) {
                  Navigator.of(context).pushNamed('/profile');
                }
              },
              child: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),
          ),
        ],
      ),
      body: ListView(children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.77,
          ),
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
