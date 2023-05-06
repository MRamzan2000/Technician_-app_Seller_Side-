class UserInfo {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? city;
  final String? dateOfBirth;
  final String? idOfIqama;
  final String? createdAt;
  final String? updatedAt;
  final String? type;

  UserInfo( {
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.city,
    this.dateOfBirth,
    this.idOfIqama,
    this.createdAt,
    this.updatedAt,
    this.type,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['_id'],
      firstName: json['firstname'],
      lastName: json['lastname'],
      email: json['email'],
      phoneNumber: json['phonenumber'],
      city: json['city'],
      dateOfBirth: json['dateofbirth'],
      idOfIqama: json['idofiqama'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      type: json['type'],
    );
  }
}
