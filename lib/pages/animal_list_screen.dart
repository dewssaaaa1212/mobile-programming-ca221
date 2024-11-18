import 'package:flutter/material.dart';
import '../models/animal.dart';
import 'add_animal_screen.dart';
import 'edit_animal_screen.dart';
import '../widgets/animal_item.dart';

class AnimalListScreen extends StatefulWidget {
  const AnimalListScreen({super.key});

  @override
  _AnimalListScreenState createState() => _AnimalListScreenState();
}

class _AnimalListScreenState extends State<AnimalListScreen> {
  List<Animal> animals = [
    Animal(
      speciesName: 'Panthera tigris',
      indonesianName: 'Harimau',
      description:
          'Harimau adalah spesies kucing besar yang ditemukan di Asia.',
      imagePath:
          'https://acehprov.go.id/media/2023.01/whatsapp_image_2023-01-29_at_16_15_171.jpeg',
    ),
    Animal(
      speciesName: 'Elephas maximus',
      indonesianName: 'Gajah',
      description: 'Gajah adalah mamalia besar yang dikenal karena belalainya.',
      imagePath:
          'https://memorandum.disway.id/upload/0bbf94a2a0e33206147a7cb2e8c1ab35.jpg',
    ),
  ];

  void _editAnimal(int index) async {
    final updatedAnimal = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAnimalPage(animal: animals[index]),
      ),
    );

    if (updatedAnimal != null) {
      setState(() {
        animals[index] = updatedAnimal;
      });
    }
  }

  void _deleteAnimal(int index) {
    setState(() {
      animals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animal List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final newAnimal = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddAnimalPage(),
                ),
              );
              if (newAnimal != null) {
                setState(() {
                  animals.add(newAnimal);
                });
              }
            },
          ),
        ],
      ),
      body: animals.isEmpty
          ? const Center(child: Text('No animals added yet.'))
          : ListView.builder(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                return AnimalItem(
                  animal: animals[index],
                  onEdit: () => _editAnimal(index),
                  onDelete: () => _deleteAnimal(index),
                );
              },
            ),
    );
  }
}
