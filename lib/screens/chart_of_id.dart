import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class ChartOfId extends StatefulWidget {
  final String Username;
  final List<double> data;
  ChartOfId(this.Username, this.data);

  @override
  _ChartOfIdState createState() => _ChartOfIdState();
}

class _ChartOfIdState extends State<ChartOfId> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 18,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(widget.Username),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Chart of the HeartBeats", style: TextStyle(color: Colors.blueGrey,fontSize: 20.0, fontWeight: FontWeight.bold),),
            Container(
              padding: EdgeInsets.all(10.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2.0,
                      color: Colors.blueGrey
                  )
              ),
              height: 400,
              child: Sparkline(
                data: widget.data,
                lineColor: Colors.pink,
                pointsMode: PointsMode.all,
                pointSize: 8.0,
              ),
            ),
          ],
        ),
      )
    );
  }
}
