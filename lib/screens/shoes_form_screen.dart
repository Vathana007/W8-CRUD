import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/shoes.dart';
import '../providers/shoes_provider.dart';

class ShoesFormScreen extends StatefulWidget {
  final Shoes? shoes; // if null, this is an add operation; otherwise, edit

  const ShoesFormScreen({super.key, this.shoes});

  @override
  _ShoesFormScreenState createState() => _ShoesFormScreenState();
}

class _ShoesFormScreenState extends State<ShoesFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late double _price;

  @override
  void initState() {
    super.initState();
    _name = widget.shoes?.name ?? '';
    _price = widget.shoes?.price ?? 0.0;
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final shoesProvider =
          Provider.of<ShoesProvider>(context, listen: false);
      if (widget.shoes == null) {
        // Add new shoes
        await shoesProvider.addShoes(_name, _price);
      } else {
        // Update existing shoes
        final updatedShoes = Shoes(
          id: widget.shoes!.id,
          name: _name,
          price: _price,
        );
        await shoesProvider.updateShoes(updatedShoes);
      }
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.shoes != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Shoes" : "Add Shoes"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: _price != 0.0 ? _price.toString() : '',
                decoration: InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a price";
                  }
                  if (double.tryParse(value) == null) {
                    return "Please enter a valid number";
                  }
                  return null;
                },
                onSaved: (value) => _price = double.parse(value!),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isEditing ? Colors.orange : Colors.green,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                  shadowColor: Colors.black45,
                ),
                child: Text(
                  isEditing ? "Update" : "Add",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
