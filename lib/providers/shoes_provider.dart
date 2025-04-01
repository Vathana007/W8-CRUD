import 'package:flutter/material.dart';
import '../models/shoes.dart';
import '../repositories/shoes_repository.dart';
import '../async_value.dart';

class ShoesProvider extends ChangeNotifier {
  final ShoesRepository _repository;
  AsyncValue<List<Shoes>>? shoesState;

  ShoesProvider(this._repository) {
    fetchShoes();
  }

  bool get isLoading =>
      shoesState != null && shoesState!.state == AsyncValueState.loading;
  bool get hasData =>
      shoesState != null && shoesState!.state == AsyncValueState.success;

  Future<void> fetchShoes() async {
    try {
      shoesState = AsyncValue.loading();
      notifyListeners();
      final shoes = await _repository.getShoes();
      shoesState = AsyncValue.success(shoes);
      print("SUCCESS: list size ${shoes.length}");
    } catch (error) {
      print("ERROR: $error");
      shoesState = AsyncValue.error(error);
    }
    notifyListeners();
  }

  Future<void> addShoes(String name, double price) async {
    await _repository.addShoes(name: name, price: price);
    await fetchShoes();
  }

  Future<void> updateShoes(Shoes shoes) async {
    await _repository.updateShoes(shoes: shoes);
    await fetchShoes();
  }

  Future<void> deleteShoes(String id) async {
    await _repository.deleteShoes(id: id);
    await fetchShoes();
  }
}
