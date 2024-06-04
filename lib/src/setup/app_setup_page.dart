import 'package:flutter/material.dart';

class AppSetupPage extends StatefulWidget {
  const AppSetupPage({super.key});

  @override
  State<AppSetupPage> createState() => _AppSetupPageState();
}

class _AppSetupPageState extends State<AppSetupPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Planing App setup system"),
      ),
    );
  }
}
