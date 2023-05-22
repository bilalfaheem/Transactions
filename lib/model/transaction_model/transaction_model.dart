import 'package:collection/collection.dart';

class TransactionModel {
  DateTime? date;
  String? amount;
  String? currency;
  String? type;
  String? description;
  String? id;

  TransactionModel({
    this.date,
    this.amount,
    this.currency,
    this.type,
    this.description,
    this.id,
  });

  factory TransactionModel.fromJson(Map<dynamic, dynamic> json) {
    return TransactionModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      amount: json['amount'] as String?,
      currency: json['currency'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date?.toIso8601String(),
        'amount': amount,
        'currency': currency,
        'type': type,
        'description': description,
        'id': id,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! TransactionModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      date.hashCode ^
      amount.hashCode ^
      currency.hashCode ^
      type.hashCode ^
      description.hashCode ^
      id.hashCode;
}
