import 'dart:convert';

import 'package:fintech_hackathon/domain/entity/user_entity.dart';

class UserModel extends User {
  final String uuid;
  final String emailAddress;

  UserModel({
    this.uuid,
    this.emailAddress,
  }) : super(uuid: uuid, emailAddress: emailAddress);

  UserModel copyWith({
    String uuid,
    String emailAddress,
  }) {
    return UserModel(
      uuid: uuid ?? this.uuid,
      emailAddress: emailAddress ?? this.emailAddress,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'emailAddress': emailAddress,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      uuid: map['uuid'],
      emailAddress: map['emailAddress'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() => 'UserModel(uuid: $uuid, emailAddress: $emailAddress)';

 
}
