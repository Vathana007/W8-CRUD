import 'package:crud_week8/models/shoes.dart';

class ShoesDto {
  static Shoes fromJson(String id, Map<String, dynamic> json) {
    return Shoes(id: id, name: json['name'], price: json['price']);
  }

  static Map<String, dynamic> toJson(Shoes shoes) {
    return {'name': shoes.name, 'price': shoes.price};
  }
}