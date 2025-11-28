import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> cards = [];

  void addCard() {
    setState(() {
      cards.add(buildCard(const Text(
        "Editar Receta",
        style: TextStyle(color: Colors.orange, fontSize: 18),
      )));
    });
  }

  // 🔹 Método para construir tarjetas uniformes y grandes
  Widget buildCard(Widget child) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 200, // 🔹 tamaño más grande
      width: 200,
      child: Center(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
        title: const Text(
          "RecetaNotes",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Barra de búsqueda más fina
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              style: const TextStyle(fontSize: 14), // 🔹 texto más chico
              decoration: InputDecoration(
                hintText: "Buscar...",
                hintStyle: const TextStyle(color: Colors.orange, fontSize: 14),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 6, // 🔹 menos alto → barra más fina
                ),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.orange, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: const Icon(Icons.search, color: Colors.orange),
              ),
            ),
          ),

          // Tarjetas dinámicas
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220, // 🔹 controla tamaño grande
                childAspectRatio: 1,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: 1 + cards.length,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Tarjeta con símbolo +
                  return GestureDetector(
                    onTap: addCard,
                    child: buildCard(
                      const Icon(Icons.add, color: Colors.orange, size: 80),
                    ),
                  );
                } else {
                  return cards[index - 1];
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.orange,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Expanded(child: Icon(Icons.home, color: Colors.white)),
            VerticalDivider(color: Colors.white, thickness: 2),
            Expanded(child: Icon(Icons.group, color: Colors.white)),
            VerticalDivider(color: Colors.white, thickness: 2),
            Expanded(child: Icon(Icons.settings, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}