// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserData userFromJson(String str) => UserData.fromJson(json.decode(str));

String userToJson(UserData data) => json.encode(data.toJson());

class UserData {
    String id;
    String username;
    String email;
    String password;
    String age;
    String phone;

    UserData({
        this.id = "",
        this.username = "",
        this.email = "",
        this.password = "",
        this.age = "",
        this.phone = "",
    });

    factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        password: json["Password"],
        age: json["Birthay"],
        phone: json["Phone"],
    );

    Map<String, dynamic> toJson() => {
      //Si no quieres agregar algun de los siguiente parametros simplemente borrar
        "id": id,
        "username": username,
        "email": email,
        //"Password": password,
        "age": age,
        "Phone": phone,
    };
}
