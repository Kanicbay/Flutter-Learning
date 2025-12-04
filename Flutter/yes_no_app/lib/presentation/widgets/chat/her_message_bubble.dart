import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TextBubble(colors: colors, message: message, size: size),
        const SizedBox(height: 5),
        _ImageBubble(message.imageUrl!),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _TextBubble extends StatelessWidget {
  const _TextBubble({
    required this.colors,
    required this.message,
    required this.size,
  });

  final ColorScheme colors;
  final Message message;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  message.text,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 4),
              Column(
                children: [
                  const SizedBox(height: 12),
                  Text(
                    message.formattedDate,
                    style: const TextStyle(color: Colors.white70, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20),
      child: Image.network(
        imageUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: const Text('Enviando una imagen'),
          );
        },
      ),
    );
  }
}
