class User {

  final String email;
  final String password; // Added password field
  final String phone;



  User({

    required this.email,
    required this.password, // Added password parameter
    required this.phone,


  });

  Map<String, dynamic> toJson() {
    return {

      'email': email,
      'password': password, // Added password field
      'phone': phone,

    };
  }
}