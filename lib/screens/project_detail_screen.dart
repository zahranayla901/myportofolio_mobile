import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({required this.project, super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final hasThumbnail = project.thumbnail.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          project.title,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF33415C),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasThumbnail) ...[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  project.thumbnail,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox(
                    height: 200,
                    child: Center(child: Icon(Icons.broken_image, size: 48)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              project.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text('Teknologi: ${project.technology}'),
            const SizedBox(height: 16),
            Text(project.description),
            const SizedBox(height: 16),
            if (project.projectUrl.isNotEmpty)
              Text('URL: ${project.projectUrl}'),
          ],
        ),
      ),
    );
  }
}