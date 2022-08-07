import 'package:flutter/material.dart';

class MaterialDetails extends StatelessWidget {
  const MaterialDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Material Details Page"),
        ),
      ),
    );
  }
}