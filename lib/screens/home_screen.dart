import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shoes.dart';
import '../providers/shoes_provider.dart';
import '../widgets/shoes_list_item.dart';
import 'shoes_form_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openAddForm(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoesFormScreen(),
      ),
    );
  }

  void _openEditForm(BuildContext context, Shoes shoes) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoesFormScreen(shoes: shoes),
      ),
    );
  }

  void _onDeletePressed(BuildContext context, String id) {
    Provider.of<ShoesProvider>(context, listen: false).deleteShoes(id);
  }

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    Widget content;

    if (shoesProvider.isLoading) {
      content = const Center(child: CircularProgressIndicator());
    } else if (shoesProvider.hasData) {
      final shoesList = shoesProvider.shoesState!.data!;
      content = shoesList.isEmpty
          ? const Center(child: Text("No shoes yet"))
          : ListView.builder(
              itemCount: shoesList.length,
              itemBuilder: (context, index) {
                final shoes = shoesList[index];
                return ShoesListItem(
                  shoes: shoes,
                  onDelete: () => _onDeletePressed(context, shoes.id),
                  onEdit: () => _openEditForm(context, shoes),
                );
              },
            );
    } else {
      content = const Center(child: Text("Something went wrong"));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shoes",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () => _openAddForm(context),
              icon: const Icon(Icons.add, color: Colors.white))
        ],
      ),
      body: content,
    );
  }
}
