import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.model.dart';

class UserService {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  Future<List<User>> fetchUsers() async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      List<User> users = jsonData.map((json) => User.fromJson(json)).toList();
      return users;
    } else {
      throw Exception('Error al obtener los datos: ${response.statusCode}');
    }
  }

  List<User> filterByNameLength(List<User> users) {
    int lenght = 6;

    users = users.where((user) => user.username.length > lenght).toList();

    return users;
  }

  int countEmailBiz(List<User> users) {
    String endEmail = 'biz';
    int countUser = 0;

    countUser = users.where((user) => user.email.endsWith(endEmail)).length;

    return countUser;
  }
}
