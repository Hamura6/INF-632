import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DateWidget extends StatefulWidget {
  TextEditingController fechaTransaccion;
  DateWidget({super.key,required this.fechaTransaccion});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.fechaTransaccion,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Fecha de Nacimiento',
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
     DateTime? pickedDate= await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018), 
      lastDate: new DateTime(2027),
      locale: Locale('es','ES')
      );
    if(pickedDate!=null){
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
      if(pickedTime !=null){

      final DateTime fullDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        ); 
      setState((){
        final String formatted = DateFormat('yyyy-MM-dd HH:mm').format(fullDateTime).toString();
        widget.fechaTransaccion.text=formatted;
      });
      }
    }
  }
}