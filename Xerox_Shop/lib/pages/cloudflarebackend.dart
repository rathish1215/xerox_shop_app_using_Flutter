import 'dart:developer';
import 'package:cloudflare_r2/cloudflare_r2.dart';
import 'package:flutter/material.dart';
import 'components/newtypes.dart';

class CloudflareBackend extends StatefulWidget {
  final List<FileData> files;
  const CloudflareBackend({super.key, required this.files});

  @override
  State<CloudflareBackend> createState() => _CloudflareBackendState();
}

class _CloudflareBackendState extends State<CloudflareBackend> {
  String controllerAccountId = "c066124110c7d4aa00b8e423e288d1c6";
  String controllerAccessId = "170f089e4646d57ca32a729ddf9eab14";
  String controllerSecretAccessKey = "abfd962fae98b4e0db2001fd39ff22a6c315fc67b72be8dcd3573f57eac59682";
  String controllerBucket = "testfiles";
  String result = "Uploading";
  Future<void> uploader() async {
    CloudFlareR2.init(
      accoundId: controllerAccountId,
      accessKeyId: controllerAccessId,
      secretAccessKey: controllerSecretAccessKey,
    );

    Stopwatch sw = Stopwatch()..start();
    for(var file in widget.files) {
      await CloudFlareR2.putObject(
          bucket: controllerBucket,
          objectName: file.name,
          objectBytes: file.bytes,
          contentType: "application/pdf");
      sw.stop();
      log('${sw.elapsed.inSeconds} seconds');
    }
    int time = sw.elapsed.inSeconds;
    setState
      (() {
      result =
      'Files uploaded to: ${"${controllerBucket}"}\n\n Time Upload: $time seconds';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            Center(child: Text(result, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: uploader,
                  child: Text('Upload Files')),
            )
          ],
        ),
      ),
    );
  }
}
