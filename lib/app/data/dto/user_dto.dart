import 'dart:convert';

import 'package:user_feed/app/domain/model/user.dart';

List<UserDto> userDtoFromJson(String str) =>
    List<UserDto>.from(json.decode(str).map((x) => UserDto.fromJson(x)));

String userDtoToJson(List<UserDto> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDto extends User {
  final DateTime createdAt;
  final String name;
  final String avatar;
  final String city;
  final String country;
  final String county;
  final String addressNo;
  final String street;
  final String zipCode;
  final String id;

  UserDto({
    required this.createdAt,
    required this.name,
    required this.avatar,
    required this.city,
    required this.country,
    required this.county,
    required this.addressNo,
    required this.street,
    required this.zipCode,
    required this.id,
  }) : super(
          createdAt: DateTime(0, 0, 0),
          name: '',
          avatar: '',
          city: '',
          country: '',
          county: '',
          addressNo: '',
          street: '',
          zipCode: '',
          id: '',
        );

  factory UserDto.fromJson(Map<String, dynamic> json) => UserDto(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        avatar: json["avatar"],
        city: json["city"],
        country: json["country"],
        county: json["county"],
        addressNo: json["address_no"],
        street: json["street"],
        zipCode: json["zip_code"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "avatar": avatar,
        "city": city,
        "country": country,
        "county": county,
        "address_no": addressNo,
        "street": street,
        "zip_code": zipCode,
        "id": id,
      };
}
