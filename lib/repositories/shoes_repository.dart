import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/shoes.dart';
import '../dto/shoes_dto.dart';

abstract class ShoesRepository {
  Future<Shoes> addShoes({required String name, required double price});
  Future<List<Shoes>> getShoes();
  Future<Shoes> updateShoes({required Shoes shoes});
  Future<void> deleteShoes({required String id});
}

class FirebaseShoesRepository extends ShoesRepository {
  static const String baseUrl =
      'https://exercise1-week8-default-rtdb.asia-southeast1.firebasedatabase.app';
  static const String shoesCollection = "shoes";
  static const String allShoesUrl = '$baseUrl/$shoesCollection.json';

  @override
  Future<Shoes> addShoes({required String name, required double price}) async {
    Uri uri = Uri.parse(allShoesUrl);
    final newShoesData = {'name': name, 'price': price};
    final http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newShoesData),
    );

    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      throw Exception('Failed to add shoes');
    }
    final newId = json.decode(response.body)['name'];
    return Shoes(id: newId, name: name, price: price);
  }

  @override
  Future<List<Shoes>> getShoes() async {
    Uri uri = Uri.parse(allShoesUrl);
    final http.Response response = await http.get(uri);
    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      throw Exception('Failed to load shoes');
    }
    final data = json.decode(response.body) as Map<String, dynamic>?;
    if (data == null) return [];
    return data.entries
        .map((entry) => ShoesDto.fromJson(entry.key, entry.value))
        .toList();
  }

  @override
  Future<Shoes> updateShoes({required Shoes shoes}) async {
    final updateUrl = '$baseUrl/$shoesCollection/${shoes.id}.json';
    final uri = Uri.parse(updateUrl);
    final http.Response response = await http.patch(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(ShoesDto.toJson(shoes)),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to update shoes');
    }
    return shoes;
  }

  @override
  Future<void> deleteShoes({required String id}) async {
    final deleteUrl = '$baseUrl/$shoesCollection/$id.json';
    final uri = Uri.parse(deleteUrl);
    final http.Response response = await http.delete(uri);
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to delete shoes');
    }
  }
}

class MockShoesRepository extends ShoesRepository {
  final List<Shoes> shoesList = [];

  @override
  Future<Shoes> addShoes({required String name, required double price}) async {
    await Future.delayed(Duration(seconds: 1));
    final newShoes = Shoes(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      price: price,
    );
    shoesList.add(newShoes);
    return newShoes;
  }

  @override
  Future<List<Shoes>> getShoes() async {
    await Future.delayed(Duration(seconds: 1));
    return shoesList;
  }

  @override
  Future<Shoes> updateShoes({required Shoes shoes}) async {
    await Future.delayed(Duration(seconds: 1));
    final index = shoesList.indexWhere((s) => s.id == shoes.id);
    if (index == -1) {
      throw Exception("Shoes not found");
    }
    shoesList[index] = shoes;
    return shoes;
  }

  @override
  Future<void> deleteShoes({required String id}) async {
    await Future.delayed(Duration(seconds: 1));
    shoesList.removeWhere((s) => s.id == id);
  }
}
