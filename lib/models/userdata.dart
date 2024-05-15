class UserData {
  String name;
  String phone;
  String email;

  UserData({required this.name, required this.phone, required this.email});
  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        name: json['Name'] as String,
        phone: json['Phone'] as String,
        email: json['Email'] as String,
      );
}
