// {
//         "name": name,
//         "email": "sayed12301144@gmail.com",
//         "password": "12345678",
//         "password_confirmation": "12345678",
//       },
class AuthParams {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;

  AuthParams({this.name, this.email, this.password, this.confirmPassword});

  factory AuthParams.fromJson(Map<String, dynamic> json) {
    return AuthParams(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      confirmPassword: json['password_confirmation'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }
}
