import 'dart:typed_data';
enum PrintColor{
  bw,
  color
}

enum Sides{
  both,
  single
}

class FileData{
  final String name;
  final double size;
  final int pages;
  final Uint8List bytes;
  FileData({required this.name, required this.size, required this.pages, required this.bytes});
}