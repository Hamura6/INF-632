import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ButtonDateWidget extends StatefulWidget {
  DateTime fecha;
  Function onChanged;
  ButtonDateWidget({super.key, required this.fecha,required this.onChanged});

  @override
  State<ButtonDateWidget> createState() => _ButtonDateWidgetState();
}

class _ButtonDateWidgetState extends State<ButtonDateWidget> {
  @override
  Widget build(BuildContext context) {
    final formato = DateFormat('dd/MM/yyyy');
    return TextButton.icon(
                          onPressed: () => _seleccionarFecha(context, true),
                          icon: const Icon(Icons.date_range),
                          label: Text(
                             formato.format(widget.fecha) ,
                             style: TextStyle(color: Colors.lightBlue[900]),
                          ),
                        );
  }
    Future<void> _seleccionarFecha(BuildContext context, bool esInicio) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      locale: Locale('es','ES')
    );
    if (picked != null) {
      setState(() {
        if (esInicio) {
          widget.fecha = picked;
        }
      });
    }
    widget.onChanged(widget.fecha);
  }
}