import 'package:flutter/material.dart';
import '../models/animal.dart';

class EditAnimalPage extends StatefulWidget {
  final Animal animal;

  const EditAnimalPage({super.key, required this.animal});

  @override
  State<EditAnimalPage> createState() => _EditAnimalPageState();
}

class _EditAnimalPageState extends State<EditAnimalPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _speciesNameController;
  late TextEditingController _indonesianNameController;
  late TextEditingController _descriptionController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _speciesNameController = TextEditingController(text: widget.animal.speciesName);
    _indonesianNameController = TextEditingController(text: widget.animal.indonesianName);
    _descriptionController = TextEditingController(text: widget.animal.description);
    _imageUrlController = TextEditingController(text: widget.animal.imagePath);
  }

  @override
  void dispose() {
    _speciesNameController.dispose();
    _indonesianNameController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  void _saveAnimal() {
    if (_formKey.currentState!.validate()) {
      final updatedAnimal = Animal(
        speciesName: _speciesNameController.text,
        indonesianName: _indonesianNameController.text,
        description: _descriptionController.text,
        imagePath: _imageUrlController.text,
      );

      Navigator.pop(context, updatedAnimal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Animal'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Species Name', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _speciesNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.pets),
                    hintText: 'Enter species name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the species name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Indonesian Name', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _indonesianNameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.text_fields),
                    hintText: 'Enter Indonesian name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the Indonesian name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Description', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.description),
                    hintText: 'Enter description',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                const Text('Image URL', style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _imageUrlController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.image),
                    hintText: 'Enter image URL',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an image URL';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _saveAnimal,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.brown),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
