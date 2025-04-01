import 'package:flutter/material.dart';
import '../models/shoes.dart';

class ShoesListItem extends StatelessWidget {
  final Shoes shoes;
  final VoidCallback onDelete;
  final VoidCallback? onEdit;

  const ShoesListItem({
    super.key,
    required this.shoes,
    required this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(shoes.name),
      subtitle: Text("\$${shoes.price.toString()}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onEdit != null)
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.blue),
              onPressed: onEdit,
            ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
