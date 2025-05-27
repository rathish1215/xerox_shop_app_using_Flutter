import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadFilePage extends StatefulWidget {
  const UploadFilePage({super.key});

  @override
  _UploadFilePageState createState() => _UploadFilePageState();
}

class _UploadFilePageState extends State<UploadFilePage> {
  File? selectedFile;
  int quantity = 1;
  bool isDoubleSided = false;
  double fileSizeMb = 0.0;
  int pageCount = 0;

  Future<void> pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx'],
    );

    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final fileSize = await file.length();

      setState(() {
        selectedFile = file;
        fileSizeMb = fileSize / (1024 * 1024);
        pageCount = estimatePages(fileSizeMb);
      });
    }
  }

  int estimatePages(double mb) {
    // Approximation: 1MB = 20 pages
    return (mb * 20).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              ),
              icon: Icon(Icons.upload_file, color: Colors.indigo[900]),
              label: Text(
                "Upload File",
                style: TextStyle(fontSize: 18, color: Colors.indigo[900]),
              ),
              onPressed: pickFile,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Supported: PDF, Excel, Word, PPT — Max size : 10MB",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          if (selectedFile != null) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Size: ${fileSizeMb.toStringAsFixed(2)} MB",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "No. of Pages: $pageCount",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text(
                  "Side: ",
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: isDoubleSided,
                  onChanged: (val) {
                    setState(() => isDoubleSided = val);
                  },
                ),
                Text(
                  isDoubleSided ? "Front & Back" : "Single Side",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "Quantity: ",
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() => quantity++);
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              "Total Pages to Print: ${pageCount * quantity}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.indigo[900],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
