// To parse this JSON data, do
//
//     final usersAddress = usersAddressFromJson(jsonString);

import 'dart:convert';

UsersAddress usersAddressFromJson(String str) => UsersAddress.fromJson(json.decode(str));

String usersAddressToJson(UsersAddress data) => json.encode(data.toJson());

class UsersAddress {
  String? status;
  int? code;
  int? total;
  List<Datum>? data;

  UsersAddress({
    this.status,
    this.code,
    this.total,
    this.data,
  });

  factory UsersAddress.fromJson(Map<String, dynamic> json) => UsersAddress(
    status: json["status"],
    code: json["code"],
    total: json["total"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "total": total,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  int? id;
  String? name;
  String? email;
  String? vat;
  String? phone;
  String? country;
  List<Address>? addresses;
  String? website;
  String? image;
  Contact? contact;

  Datum({
    this.id,
    this.name,
    this.email,
    this.vat,
    this.phone,
    this.country,
    this.addresses,
    this.website,
    this.image,
    this.contact,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    vat: json["vat"],
    phone: json["phone"],
    country: json["country"],
    addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
    website: json["website"],
    image: json["image"],
    contact: json["contact"] == null ? null : Contact.fromJson(json["contact"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "vat": vat,
    "phone": phone,
    "country": country,
    "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "website": website,
    "image": image,
    "contact": contact?.toJson(),
  };
}

class Address {
  int? id;
  String? street;
  String? streetName;
  String? buildingNumber;
  String? city;
  String? zipcode;
  String? country;
  String? countyCode;
  double? latitude;
  double? longitude;

  Address({
    this.id,
    this.street,
    this.streetName,
    this.buildingNumber,
    this.city,
    this.zipcode,
    this.country,
    this.countyCode,
    this.latitude,
    this.longitude,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    street: json["street"],
    streetName: json["streetName"],
    buildingNumber: json["buildingNumber"],
    city: json["city"],
    zipcode: json["zipcode"],
    country: json["country"],
    countyCode: json["county_code"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "street": street,
    "streetName": streetName,
    "buildingNumber": buildingNumber,
    "city": city,
    "zipcode": zipcode,
    "country": country,
    "county_code": countyCode,
    "latitude": latitude,
    "longitude": longitude,
  };
}

class Contact {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  DateTime? birthday;
  String? gender;
  Address? address;
  String? website;
  String? image;

  Contact({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthday,
    this.gender,
    this.address,
    this.website,
    this.image,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    birthday: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
    gender: json["gender"],
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
    website: json["website"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "address": address?.toJson(),
    "website": website,
    "image": image,
  };
}
