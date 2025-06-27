import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget {
  final TextEditingController birthDateController;
  final void Function(DateTime fullDateTime)? onChanged;

  const DateWidget({
    super.key,
    required this.birthDateController,
    this.onChanged,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.birthDateController,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Fecha de nacimiento',
        hintText: 'Selecciona una fecha',
        prefixIcon: const Icon(Icons.calendar_today),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        filled: true,
        fillColor: Colors.grey.shade100,
      ),
      onTap: () => _seleccionarFecha(context),
    );
  }

  void _seleccionarFecha(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
      locale: const Locale('es', 'ES'),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, child) {
          return Localizations.override(
            context: context,
            locale: const Locale('es', 'ES'),
            child: child,
          );
        },
      );

      if (pickedTime != null) {
        final DateTime fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        final String formatted =
            DateFormat('yyyy-MM-dd HH:mm').format(fullDateTime);

        setState(() {
          widget.birthDateController.text = formatted;
        });

        // Notifica al padre si lo necesita
        if (widget.onChanged != null) {
          widget.onChanged!(fullDateTime);
        }
      }
    }
  }
}
