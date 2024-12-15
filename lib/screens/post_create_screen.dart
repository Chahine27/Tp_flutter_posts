import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/posts_bloc.dart';
import '../bloc/posts_event.dart';

class PostCreateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Titre'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Ajout de l'événement AddPost
                print('Titre: ${titleController.text}, Description: ${descriptionController.text}');
                context.read<PostsBloc>().add(AddPost(
                  title: titleController.text,
                  description: descriptionController.text,
                ));
                Navigator.pop(context); // Retour à la liste après création
              },
              child: const Text('Créer le Post'),
            ),
          ],
        ),
      ),
    );
  }
}
