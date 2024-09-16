import 'package:appmovilclass/core/service/user.service.dart';
import 'package:flutter/material.dart';

import './core/models/user.model.dart';

class UserScreen extends StatelessWidget {
  final UserService userService = UserService();

  UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Usuarios"),
      ),
      body: FutureBuilder<List<User>>(
        future: userService.fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Mostrar mientras carga
          } else if (snapshot.hasError) {
            print("Error: ${snapshot.error}");
            return Center(
                child: Text(
                    "Error: ${snapshot.error}")); // Mostrar en caso de error
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<User> users = snapshot.data!;

            // Filtrar usuarios por nombre de usuario mayor de 6 caracteres
            List<User> filteredUsers = userService.filterByNameLength(users);

            return Column(
              children: [
                // Primera lista horizontal
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      var user = filteredUsers[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.username,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  user.email,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20), // Espacio entre las dos listas
                const Text(
                  'Usuarios con email ".biz"',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                // Segunda lista horizontal (usuarios con email ".biz")
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: userService.countEmailBiz(users),
                    itemBuilder: (context, index) {
                      // Mostrar la lista filtrada de usuarios con email ".biz"
                      var user = users
                          .where((user) => user.email.endsWith('biz'))
                          .toList()[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: 200,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.username,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  user.email,
                                  style: const TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            print("No se encontraron usuarios.");
            return const Center(child: Text("No se encontraron usuarios."));
          }
        },
      ),
    );
  }
}
