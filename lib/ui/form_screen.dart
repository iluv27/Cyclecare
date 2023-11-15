import 'package:flutter/material.dart';

class PeriodFormScreen extends StatefulWidget {
  const PeriodFormScreen({super.key});

  @override
  State<PeriodFormScreen> createState() => _PeriodFormScreenState();
}

class _PeriodFormScreenState extends State<PeriodFormScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Period Form Screen'),
      ),
    );
  }
}
