import 'package:intl/intl.dart';

enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime date;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    required this.date,
  });

  String get formattedDate => DateFormat('hh:mm a').format(date);

}
