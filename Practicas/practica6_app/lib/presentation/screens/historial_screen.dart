import 'package:flutter/material.dart';
import 'package:practica6_app/presentation/widgets/customer_drawer.dart';
import 'package:practica6_app/providers/db_provider.dart';
import 'package:practica6_app/providers/transaccion_provider.dart';
import 'package:provider/provider.dart';

class HistorialScreen extends StatelessWidget {
  const HistorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dbProvider = context.watch<DBProvider>();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: CustomerDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          child: AppBar(
            backgroundColor: Colors.lightBlue[900],
            foregroundColor: Colors.white,
            title: const Text('Historial'),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  /* showSearch(
                    context: context,
                    delegate: TransaccionSearchDelegate(dbProvider),
                  ); */
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  TransaccionProvider provider =
                      context.read<TransaccionProvider>();
                  provider.clearProvider();
                  Navigator.pushNamed(
                    context,
                    'transaccion',
                    arguments: provider,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Transaccion>>(
          future: dbProvider.getTransacciones(),
          builder: (context, snapshot) {
            if (snapshot.hasData == false) {
              return Center(child: CircularProgressIndicator());
            }
            final transacciones = snapshot.data ?? [];

            if (transacciones.isEmpty) {
              return const Center(
                child: Text('No hay transacciones registradas'),
              );
            }

            return ListView.separated(
              itemCount: transacciones.length,
              separatorBuilder: (_, __) => const SizedBox(height: 5),
              itemBuilder: (context, i) {
                final trans = transacciones[i];

                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(
                      color: const Color.fromARGB(255, 2, 68, 98),
                    ),
                  ),
                  elevation: 6,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Transacción #${i + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 3, 73, 106),
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(trans.Fecha),
                          leading: CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 191, 220, 233),
                            child: const Icon(
                              Icons.monetization_on,
                              color: Color.fromARGB(255, 2, 68, 98),
                            ),
                          ),
                        ),
                        _infoRow(label: 'Tipo', value: trans.tipo),
                        _infoRow(
                          label: 'Monto',
                          value: '\Bs ${trans.monto.toStringAsFixed(2)}',
                          color:
                              trans.tipo == 'Ingreso'
                                  ? Colors.green
                                  : Colors.red,
                        ),
                        _infoRow(
                          label: 'Descripción',
                          value: trans.descripcion,
                        ),
                        _infoRow(label: 'Categoría', value: trans.categoria),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                TransaccionProvider provider =
                                    context.read<TransaccionProvider>();
                                provider.Id = trans.id ?? 0;
                                provider.Tipo = trans.tipo;
                                provider.Categoria = trans.categoria;
                                provider.Descripcion.text = trans.descripcion;
                                provider.Monto.text = trans.monto.toString();
                                provider.fecha.text = trans.Fecha;
                                Navigator.pushNamed(
                                  context,
                                  'transaccion',
                                  arguments: provider,
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.visibility,
                                color: Colors.green,
                              ),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("¿Desea eliminar la transaccion?",style: TextStyle(color: Color.fromARGB(255, 7, 70, 99)),),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(trans.Fecha),
                                          Text(trans.descripcion),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStatePropertyAll(Colors.grey),
                                            foregroundColor: WidgetStatePropertyAll(Colors.white)
                                          ),
                                          child: const Text("Cancelar"),
                                          onPressed: () {
                                            Navigator.pop(context);// Cierra el diálogo
                                          },
                                        ),
                                        TextButton(
                                          child: const Text("Aceptar"),
                                          style: ButtonStyle(
                                            backgroundColor: WidgetStatePropertyAll(Colors.lightBlue[900]),
                                            foregroundColor: WidgetStatePropertyAll(Colors.white)
                                          ),
                                          onPressed: () {
                                            DBProvider.db.deleteTransacciones(trans.id??0);
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _infoRow({
    String label = '',
    String value = '',
    Color color = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),

          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
