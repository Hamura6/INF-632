import 'package:flutter/material.dart';
import 'package:practica6_app/presentation/widgets/layout_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:practica6_app/providers/db_provider.dart';

class InicioScreen extends StatelessWidget {
  const InicioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
      title: 'Inicio',
      content: ListView(
        children: [
          FutureBuilder<Map<String, double>>(
            future: DBProvider.db.getResumenIngresosYGastos(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No hay datos.'));
              }

              final ingresos = snapshot.data!['Ingreso'] ?? 0;
              final gastos = snapshot.data!['Gasto'] ?? 0;
              final saldo = ingresos - gastos;

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                    color: const Color.fromARGB(255, 6, 64, 91)
                  )
                ),
                elevation: 12,
                margin: const EdgeInsets.all(16.0),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const Text(
                        'Saldo Actual',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '\Bs ${saldo.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 5, 59, 83),
                        ),
                      ),

                      FutureBuilder(
            future: DBProvider.db.getResumenIngresosYGastos(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No hay datos para mostrar.'));
              }

              final ingresos = snapshot.data!['Ingreso'] ?? 0;
              final gastos = snapshot.data!['Gasto'] ?? 0;
              final total = ingresos + gastos;

              if (total == 0) {
                return const Center(child: Text('No hay ingresos ni gastos.'));
              }

              return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 2,
                        children: [
                          Column(
                            children: [
                              Row(    
                                spacing: 2,
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                color: Colors.green,
                              ),
                          Text('Ingresos',style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Text('$ingresos Bs',style: TextStyle(color: Colors.green),),
                            ],
                          ),
                          
                          Column(
                            children: [
                              Row(    
                                spacing: 2,
                            children: [
                              Container(
                                height: 12,
                                width: 12,
                                color: Colors.red,
                              ),
                          Text('Gasto',style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Text('$gastos Bs', style: TextStyle(color: Colors.red),),
                            ],
                          ),
                        ],
                      );
            },
          ),
                      
                    ],
                  ),
                ),
              );
            },
          ),
          FutureBuilder(
            future: DBProvider.db.getResumenIngresosYGastos(),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No hay datos para mostrar.'));
              }

              final ingresos = snapshot.data!['Ingreso'] ?? 0;
              final gastos = snapshot.data!['Gasto'] ?? 0;
              final total = ingresos + gastos;

              if (total == 0) {
                return const Center(child: Text('No hay ingresos ni gastos.'));
              }

              return SizedBox(
                height: 300,
                child: Card(
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 2,
                      centerSpaceRadius: 40,
                      sections: [
                        PieChartSectionData(
                          value: ingresos,
                          color: Colors.green,
                          title:
                              '${((ingresos / total) * 100).toStringAsFixed(1)}%',
                          radius: 60,
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        PieChartSectionData(
                          value: gastos,
                          color: Colors.red,
                          title:
                              '${((gastos / total) * 100).toStringAsFixed(1)}%',
                          radius: 60,
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
