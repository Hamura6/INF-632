import 'package:flutter/material.dart';
import 'package:practica6_app/presentation/widgets/date_widget.dart';
import 'package:practica6_app/presentation/widgets/drop_down_widget.dart';
import 'package:practica6_app/presentation/widgets/input_text_widget.dart';
import 'package:practica6_app/presentation/widgets/layout_widget.dart';
import 'package:practica6_app/providers/db_provider.dart';
import 'package:practica6_app/providers/transaccion_provider.dart';

class NewTransaccionScreen extends StatelessWidget {
  const NewTransaccionScreen({super.key, initialized = false});

  @override
  Widget build(BuildContext context) {
    /* TransaccionProvider provider=context.watch<TransaccionProvider>(); */

    TransaccionProvider provider =
        ModalRoute.of(context)!.settings.arguments as TransaccionProvider;
    return LayoutWidget(
      title: (provider.Id > 0) ? 'Actualizar transaccion' : 'Nueva transaccion',
      content: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: ListView(
                    children: [
                      Text(
                        provider.Id > 0
                            ? 'Modificar Transacción'
                            : 'Registrar Transaccion',
                        style: Theme.of(context).textTheme.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      DropDownWidget(
                        label: 'Tipo',
                        items: ['Gasto', 'Ingreso'],
                        selected: provider.Tipo,
                        onChanged: (value) {
                          provider.Tipo = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      InputTextWidget(
                        label: 'Monto',
                        icon: Icons.attach_money,
                        valor: provider.Monto,
                      ),
                      const SizedBox(height: 16),
                      InputTextWidget(
                        label: 'Descripción',
                        icon: Icons.description,
                        maxLines: 4,
                        valor: provider.Descripcion,
                      ),
                      const SizedBox(height: 16),
                      DropDownWidget(
                        label: 'Categoría',
                        items: ['Comida', 'Salud', 'Transporte', 'Otros'],
                        selected: provider.Categoria,
                        onChanged: (value) {
                          provider.Categoria = value;
                        },
                      ),
                      const SizedBox(height: 16),
                      DateWidget(fechaTransaccion: provider.Fecha),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: () async{
                  final data = Transaccion(
                    id: provider.Id,
                    tipo: provider.Tipo,
                    monto: double.parse(provider.Monto.text),
                    descripcion: provider.Descripcion.text,
                    categoria: provider.Categoria,
                    fecha: DateTime.parse(provider.Fecha.text),
                  );
                  if (provider.Id > 0) {
                    final res =await DBProvider.db.updateTransaccion(data);
                    if(res>0){
                    Navigator.pop(context);
                    }
                  } else {
                    final res= await DBProvider.db.nuevoTrans(data);
                    if(res>0){
                    Navigator.pop(context);
                    }
                  }
                },
                icon: const Icon(Icons.save),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.lightBlue[900])
                ),
                label: Text(
                  provider.Id > 0
                      ? 'Actualizar Transaccion'
                      : 'Guardar Transacción',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
