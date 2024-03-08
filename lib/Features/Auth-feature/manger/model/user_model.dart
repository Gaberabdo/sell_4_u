

class UserModel {
  String? name;
  String? email;

  String? uId;

  String? role;


  UserModel({this.name, this.email, this.role, this.uId,
     });

  UserModel.fromJson(Map<String, dynamic>? json) {
    email = json!['email'] ?? '';
    name = json!['name']?? '';

    uId = json!['uId']?? '';


    role = json!['role']?? '';

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,

      'role':role,


      'uId': uId,
    };
  }
}
