import 'package:flutter/material.dart';
import 'package:practica6_app/presentation/widgets/button_date_widget.dart';
import 'package:practica6_app/presentation/widgets/drop_down_widget.dart';
import 'package:practica6_app/presentation/widgets/layout_widget.dart';
import 'package:practica6_app/providers/db_provider.dart';
import 'package:practica6_app/providers/filtros_provider.dart';
import 'package:provider/provider.dart';

class FiltrosScreen extends StatelessWidget {
  const FiltrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dbProvider = context.watch<FiltrosProvider>();
    return LayoutWidget(
      title: 'Filtros',
      content: Column(
        children: [
          // Filtros
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                       Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Desde',style: TextStyle(
                              color: Color.fromARGB(255, 4, 46, 66),
                              fontWeight: FontWeight.bold
                            ),),
                            ButtonDateWidget(
                              fecha: dbProvider.fechaInicio,
                              onChanged: (value) {
                                dbProvider.actualizarFiltros(
                                  dbProvider.tipoFiltro,
                                  value,
                                  dbProvider.fechaFin,
                                );
                              },
                            ),
                          ],
                        ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Hasta',style: TextStyle(
                              color: Color.fromARGB(255, 4, 46, 66),
                              fontWeight: FontWeight.bold
                            ),),
                            ButtonDateWidget(
                              fecha: dbProvider.fechaFin,
                              onChanged: (value) {
                                dbProvider.actualizarFiltros(
                                  dbProvider.tipoFiltro,
                                  dbProvider.fechaInicio,
                                  value,
                                );
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  DropDownWidget(
                    label: 'Tipo de transacción',
                    items: const ['Todos', 'Gasto', 'Ingreso'],
                    selected: dbProvider.tipoFiltro,
                    onChanged: (value) {
                      dbProvider.actualizarFiltros(
                        value ?? 'Todos',
                        dbProvider.fechaInicio,
                        dbProvider.fechaFin,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Lista
          Expanded(
            child: FutureBuilder<List<Transaccion>>(
              future: DBProvider.db.getTransaccionesPorTipo(
                dbProvider.tipoFiltro,
                dbProvider.fechaInicio,
                dbProvider.fechaFin,
              ),
              builder: (context, snapshot) {
                final transactions = snapshot.data ?? [];

                /* if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (transactions.isEmpty) {
                  return const Center(child: Text('No hay transacciones.'));
                }
 */
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: transactions.length,
                  itemBuilder: (context, i) {
                    final trans = transactions[i];

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            trans.tipo == 'Ingreso'
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color:
                                trans.tipo == 'Ingreso'
                                    ? Colors.green
                                    : Colors.red,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  trans
                                      .Fecha, // asegúrate que sea un String o formatearlo
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(trans.tipo),
                                Text(trans.categoria),
                              ],
                            ),
                          ),
                          Text(
                            '\Bs ${trans.monto.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                                  trans.tipo == 'Ingreso'
                                      ? Colors.green
                                      : Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () async {
                      final transacciones = await DBProvider.db
                          .getTransaccionesPorTipo(
                            dbProvider.tipoFiltro,
                            dbProvider.fechaInicio,
                            dbProvider.fechaFin,
                          );
                      await DBProvider.db.imprimirTransaccionesPdf(
                        transacciones,
                        dbProvider.tipoFiltro,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red)
                    ),
                    child: Text('DESCARGAR PDF'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
