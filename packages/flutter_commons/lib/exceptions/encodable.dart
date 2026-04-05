import 'dart:convert';

abstract class Encodable {
  const Encodable();

  String toJson() {
    return jsonEncode(toMap());
  }

  Map<String, dynamic> toMap();
}
