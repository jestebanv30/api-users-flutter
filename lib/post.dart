import 'package:appmovilclass/listadoposts.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listado de Posts"),
      ),
      body: ListView.builder(
        itemCount: listaPost.length,
        itemBuilder: (BuildContext context, int index) {
          var post = listaPost[index];

          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4, // Sombra alrededor de la tarjeta
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Bordes redondeados
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent, // Cambia el color del título
                      ),
                    ),
                    const SizedBox(height: 8), // Espacio entre título y body
                    Text(
                      post["body"],
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors
                            .black54, // Cambia el color del cuerpo del post
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
