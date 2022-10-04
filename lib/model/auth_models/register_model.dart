class RegisterModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String userName;

  RegisterModel(
      {required this.password,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.userName});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'username': userName,
    };
  }
}
