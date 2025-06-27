import 'package:flutter/material.dart';
  Widget DropDownWidget({required String label, required List<String> items, required String selected,required Function(String?) onChanged}) {
    selected=selected==''?items.first:selected;
    return DropdownButtonFormField<String>(
      value: selected,
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: onChanged,
      borderRadius: BorderRadius.circular(20.0),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.arrow_drop_down),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
    );
  }