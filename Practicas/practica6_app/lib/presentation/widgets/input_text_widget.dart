import 'package:flutter/material.dart';
  Widget InputTextWidget ({required String label, required IconData icon, int maxLines = 1,required TextEditingController valor}) {
    return TextFormField(
      controller: valor,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: maxLines>1?null:Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }