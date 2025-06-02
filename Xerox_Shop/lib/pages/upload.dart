import 'dart:io';
import 'package:dart_pdf_reader/dart_pdf_reader.dart' as pdf;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'cloudflarebackend.dart';
import 'orderconfig.dart';
import 'components/newtypes.dart';
// import 'components/custom';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  List<FileData> files = [];
  bool isLoading = false;
  int pages = 0;
  double size = 0;
  Future<int> getPdfPageCount(String path) async {
    final stream = pdf.FileStream(File(path).openSync());
    final doc = await pdf.PDFParser(stream).parse();
    final catalog = await doc.catalog;
    final pages = await catalog.getPages();
    return pages.pageCount;
  }
  Future<void> getFiles() async {
    setState(() {
      isLoading = true;
    });
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        withData: true,
        allowMultiple: true,
        allowedExtensions: ['pdf'],
    );
    if (result != null) {
      double temp = 0;
      for (var file in result.files){
        temp += file.size/(1024*1024);
      }
      if(temp+size > 10){
        setState(() {
          isLoading = false;
        });
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("File Size Limit Exceeded"),
              content: Text("The combined file size exceeds the 10MB limit."),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                )
              ],
            );
          },
        );
        return;
      }
        for(var file in result.files){
          int pagecount = await getPdfPageCount(file.path!);
          pages += pagecount;
          double sizep = file.size/(1024 * 1024);
          size += sizep;
          if (file.bytes != null) {
            files.add(FileData(
              name: file.name,
              size: sizep,
              pages: pagecount,
              bytes: file.bytes!,
            ));
          } else {
            print("The file is null");
          }
        }
  }
    setState(() {
      isLoading = false;
    });
  }
  void delete(int ind){
    size -= files[ind].size;
    pages -= files[ind].pages;
    files.removeAt(ind);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // drawer: Drawer(),
      body: isLoading ? Center(child: CircularProgressIndicator()):
      Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // Upload Part
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(onPressed: () async{
                    await getFiles();
                    setState(() {});
                    ;
                  },
                      icon: const Icon(CupertinoIcons.plus)
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Upload', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                        Text('Combined size should be less than 10 MB', style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50,),
              // Files part
              Expanded(
                child: ListView.builder(
                  itemCount: files.length,
                    itemBuilder: (context, index){
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    files[index].name,
                                    style: TextStyle(fontSize: 15), // Optional, usually true by default
                                  ),
                                  Text(
                                    '${(files[index].size.toStringAsFixed(2))} MB',
                                    style: TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  delete(index);
                                });
                              },
                              icon: Icon(CupertinoIcons.delete),
                            )
                          ],
                        ),
                      ),
                    );

                    }),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                  const Text('Size: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("${size.toStringAsFixed(2)} MB", style: TextStyle(fontSize: 20),)]
                  ),
                  Row(
                    children: [
                      const Text('Pages: ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text("$pages", style: TextStyle(fontSize: 20),)]
                  ),
                ],
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrintConfig(files: files))
                  );
                },
                    child: const Text('Continue')),
              ),
            ],
          ),
      ),
    );
  }
}
