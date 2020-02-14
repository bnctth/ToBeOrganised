import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todo/models/save_load.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    await SaveLoad.instance.load();
    Navigator.pushNamedAndRemoveUntil(context, '/',(_)=>false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        height: double.infinity,
        width: double.infinity,
        color: Colors.teal,
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 200,
        ),
      ),
    );
  }
}
