import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final size;
  Barrier({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 70,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color.fromARGB(255, 49, 107, 51), width: 5),
          
        color: Colors.green,
      ),
    );
  }
}
