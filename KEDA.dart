import 'package:flutter/material.dart';

void main() => runApp(MiApp());

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interfaz Peinados',
      home: PaginaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  bool showSaturationBar = false;

  @override
  Widget build(BuildContext context) {
    final ancho = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Botones superiores
          Positioned(
            top: 40,
            left: 20,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Añadir peinado'),
                    content: const SizedBox(
                      height: 100,
                      child: Center(child: Text('Aquí irá la interfaz para añadir peinados')),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Añadir peinado'),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Historial'),
                    content: const SizedBox(
                      height: 100,
                      child: Center(child: Text('Aquí irá la lista de historial')),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Historial'),
            ),
          ),
          // Botones inferiores
          // SATURACIÓN
          Positioned(
            bottom: 90,
            left: 20,
            child: showSaturationBar
                ? Container(
                    width: 120,
                    height: 18,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.grey,
                          Colors.purple,
                          Colors.white,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  showSaturationBar = !showSaturationBar;
                });
              },
              icon: const Icon(Icons.opacity),
              label: const Text('Saturación'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          // COLOR
          Positioned(
            bottom: 40,
            left: (ancho / 2) - 50,
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Color'),
                    content: SizedBox(
                      height: 180,
                      width: 180,
                      child: Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: SweepGradient(
                              colors: [
                                Colors.red,
                                Colors.yellow,
                                Colors.green,
                                Colors.cyan,
                                Colors.blue,
                                Colors.purple,
                                Colors.red,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.color_lens),
              label: const Text('Color'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ),
          // ACCESORIOS
          Positioned(
            bottom: 40,
            right: 20,
            child: ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Accesorios'),
                    content: const SizedBox(
                      height: 100,
                      child: Center(child: Text('Aquí irá la interfaz de accesorios')),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Cerrar'),
                      ),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.star),
              label: const Text('Accesorios'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
