class TokenObtainPair {
  final String phone;
  final String password;

  TokenObtainPair({required this.phone, required this.password});

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "password": password,
      };

  factory TokenObtainPair.fromJson(Map<String, dynamic> json) =>
      TokenObtainPair(
        phone: json["phone"],
        password: json["password"],
      );
}
