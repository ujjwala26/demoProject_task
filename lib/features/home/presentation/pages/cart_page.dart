import 'package:flutter/material.dart';

class AddToCartPAge extends StatefulWidget {
  const AddToCartPAge({super.key});

  @override
  State<AddToCartPAge> createState() => _AddToCartPAgeState();
}

class _AddToCartPAgeState extends State<AddToCartPAge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add To Cart Page'),
        backgroundColor: Colors.green,
      ),
    );
  }
}