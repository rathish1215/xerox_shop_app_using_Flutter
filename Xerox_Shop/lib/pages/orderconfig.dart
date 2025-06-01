import 'package:flutter/material.dart';
import 'components/option.dart';
import 'components/newtypes.dart';
class PrintConfig extends StatefulWidget {
  final List<FileData> files;
  const PrintConfig({super.key, required this.files});

  @override
  State<PrintConfig> createState() => _PrintConfigState();
}

class _PrintConfigState extends State<PrintConfig> {
  PrintColor color = PrintColor.bw;
  Sides side = Sides.both;
  void changeColor(PrintColor? value){
    setState(() {
      if(value!=null){
      color = value;}
    });
  }

  void changeSide(Sides? value){
    setState(() {
      if(value != null){
        side = value;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      body:Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Choose color', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              OptionBuilder<PrintColor>(
                  value: PrintColor.bw,
                  groupvalue: color,
                  title: 'Black and White',
                  change: changeColor),
              OptionBuilder<PrintColor>(
                  value: PrintColor.color,
                  groupvalue: color,
                  title: "Color",
                  change: changeColor),
              const SizedBox(height: 20,),

              const Text('Sides', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              OptionBuilder<Sides>(
                  value: Sides.both,
                  groupvalue: side,
                  title: 'Front and back',
                  change: changeSide),
              OptionBuilder<Sides>(
                  value: Sides.single,
                  groupvalue: side,
                  title: "Single side",
                  change: changeSide),
              Expanded(child: SizedBox()),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: (){},
                    child: Text('Continue')),
              )
            ],
          ),
      ),

    );
  }
}


