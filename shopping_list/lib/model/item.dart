import 'package:flutter/cupertino.dart';
import 'package:shopping_list/utils.dart';

class ItemField {
  static const createdTime = 'createdTime';
}

class Item {
  DateTime? createdTime;
  String name;
  String id;
  String amount;

  Item({
    required this.createdTime,
    required this.name,
    required this.amount,
    this.id = '',
  });

  static Item fromJson(Map<String, dynamic> json) => Item(
        createdTime: Utils.toDateTime(json['createdTime']),
        name: json['name'],
        amount: json['amount'],
        id: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'createdTime': Utils.fromDateTimeToJson(createdTime!),
        'name': name,
        'id': id,
        'amount': amount,
      };
}
