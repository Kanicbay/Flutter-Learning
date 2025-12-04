import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final formatedDate = message.formattedDate;
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 5,
              top: 5,
              left: 10,
              right: 10,
            ),
            child: _MessageInformation(
              size: size,
              message: message,
              formatedDate: formatedDate,
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

class _MessageInformation extends StatelessWidget {
  const _MessageInformation({
    required this.size,
    required this.message,
    required this.formatedDate,
  });

  final Size size;
  final Message message;
  final String formatedDate;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
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
                formatedDate,
                style: const TextStyle(color: Colors.white70, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
