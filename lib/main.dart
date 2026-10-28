import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '¡Bienvenido al Contador de Puntos!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 117, 43, 87)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bienvenido al Contador de Puntos de Hanz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _mostrarMensaje() {
    debugPrint('Botón de mensaje presionado. Puntos: $_counter');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¡Hola!'),
        content: Text('Llevas $_counter puntos. ¡es muy poco jaja! pero gracias por usar mi aplicacion'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: const Color.fromARGB(255, 235, 234, 234),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.emoji_events, size: 80, color: Color.fromARGB(255, 219, 173, 34)),
            const SizedBox(height: 16),
            const Text(
              '¿Cuntos Puntos acumulados llevas?',
              style: TextStyle(fontSize: 22),
            ),
            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 102, 18, 84),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _mostrarMensaje,
              icon: const Icon(Icons.message),
              label: const Text('Presiona este boton :)'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Sumar',
        backgroundColor: const Color.fromARGB(255, 53, 19, 37),
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}