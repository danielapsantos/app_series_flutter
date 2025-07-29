import 'package:app_series_flutter/custom_drawer.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('I Love Series 🎬')),
      drawer: CustomDrawer(),
      body: child,
    );
  }
}
