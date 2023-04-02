class TokenObtainPair {
  String? phone;
  String? password;

  TokenObtainPair({required this.phone, required this.password});

  TokenObtainPair.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = phone;
    data['password'] = password;
    return data;
  }
}
