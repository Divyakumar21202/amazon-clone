
import 'dart:convert';

class User {
  final String name;
  final String id;
  final String email;
  final String address;
  final String token;
  final String type;
  final String password;

  User({required this.email,required this.name, required this.id, required this.address, required this.token, required this.type, required this.password});
  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'id': id,
      'email': email,
      'address': address,
      'token': token,
      'type': type,
      'password': password
    };
  }
  factory User.fromMap(Map<String, dynamic> json) => User(
    name: json['name'],
    email: json['email'],
    id: json['_id'],
    address: json['address'],
    token: json['token'],
    type: json['type'],
    password: json['password'],
  );
  String toJson()=>json.encode(toMap());
  factory User.fromJson(String source) => User.fromMap(json.decode(source));

}
