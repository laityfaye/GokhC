import 'package:flutter/material.dart';

class CustomScaffold1 extends StatelessWidget{
  final PreferredSizeWidget? appBar;
  final Widget? child;
  const CustomScaffold1({super.key, this.child, this.appBar});
  @override

  Widget build(BuildContext context){
    return Scaffold(
        appBar: appBar ??
            AppBar(
              iconTheme: const IconThemeData(color: Colors.white) ,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
        //extendBodyBehindAppBar: true,
        body:Stack(
            children:[
              Image.asset('assets/images/logo (2).png',
                fit: BoxFit.cover,
                width:double.infinity,
                height:double.infinity  ,),
              SafeArea(child: child!,
              ),

            ]
        )

    );

  }

}