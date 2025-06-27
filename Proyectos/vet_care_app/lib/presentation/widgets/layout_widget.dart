import 'package:flutter/material.dart';
class LayoutWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final Widget? floating;
  const LayoutWidget({super.key, required this.title, required this.content, this.floating=null});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10.0),bottomRight: Radius.circular(10.0)),
          child: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Colors.white,
            title: Text(title),
          ),
        ),
      ),
      body: content,
      floatingActionButton: floating,
    );
  }
}