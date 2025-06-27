import 'package:flutter/material.dart';
import 'package:vet_care_app/models/patient.dart';
import '../screens/medical_record_page.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;
  final VoidCallback onEdit;
  final VoidCallback onView;
  final VoidCallback onDelete;

  const PatientCard({
    super.key,
    required this.patient,
    required this.onEdit,
    required this.onView,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.primary
        )
        ),
      elevation: 6,
      shadowColor: Colors.black54,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: colorScheme.primary.withOpacity(0.1),
                  child: Image.asset ('assets/images/${patient.species}.png', height: 35, width: 35,),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patient.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,  
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${patient.species} - ${patient.breed ?? 'Sin raza'}',
                        style: TextStyle(
                          color: colorScheme.secondary,
                          fontSize: 16,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                Row(
                  children: [
                    _iconAction(
                      icon: Icons.edit,
                      color: Colors.blue,
                      tooltip: 'Editar',
                      onPressed: onEdit,
                    ),
                    
                    _iconAction(
                      icon: Icons.delete,
                      color: Colors.redAccent,
                      tooltip: 'Eliminar',
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                    onPressed: onView, 
                    child: Row(
                      spacing: 4,
                      children: [
                        Icon(Icons.visibility),
                        Text('Ver historial clinico')
                      ],
                    )),
              ],
            )
            
          ],
        ),
      ),
    );
  }

  Widget _iconAction({
    required IconData icon,
    required Color color,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Material(
        shape: const CircleBorder(),
        color: color.withOpacity(0.1),
        child: IconButton(
          icon: Icon(icon, color: color, size: 20),
          tooltip: tooltip,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
