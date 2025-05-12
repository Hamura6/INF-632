import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidgetString extends StatelessWidget {
    final TextEditingController number1;
  final String label;

  const TextFieldWidgetString({
    super.key,
    required this.label,
    required this.number1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
                controller: number1,
                decoration: InputDecoration(
                  labelText: label,
                  fillColor: const Color.fromARGB(255, 219, 233, 249),
                  filled: true,
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                  
                ),
              );
  }
}