// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

import 'package:equatable/equatable.dart';

class Shop extends Equatable {
  final dynamic p_name;
  final dynamic p_id;
  final dynamic p_cost;
  final dynamic p_details;
  final dynamic p_category;
  final dynamic p_image;
  const Shop({
    required this.p_name,
    required this.p_id,
    required this.p_cost,
    required this.p_details,
    required this.p_category,
    required this.p_image,
  });

  Shop copyWith({
    dynamic p_name,
    dynamic p_id,
    dynamic p_cost,
    dynamic p_details,
    dynamic p_category,
    dynamic p_image,
  }) {
    return Shop(
      p_name: p_name ?? this.p_name,
      p_id: p_id ?? this.p_id,
      p_cost: p_cost ?? this.p_cost,
      p_details: p_details ?? this.p_details,
      p_category: p_category ?? this.p_category,
      p_image: p_image ?? this.p_image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p_name': p_name,
      'p_id': p_id,
      'p_cost': p_cost,
      'p_details': p_details,
      'p_category': p_category,
      'p_image': p_image,
    };
  }

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      p_name: map['p_name'] as dynamic,
      p_id: map['p_id'] as dynamic,
      p_cost: map['p_cost'] as dynamic,
      p_details: map['p_details'] as dynamic,
      p_category: map['p_category'] as dynamic,
      p_image: map['p_image'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shop.fromJson(String source) =>
      Shop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      p_name,
      p_id,
      p_cost,
      p_details,
      p_category,
      p_image,
    ];
  }
}
