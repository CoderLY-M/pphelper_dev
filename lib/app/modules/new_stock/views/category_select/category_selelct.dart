import 'package:flutter/material.dart';

class CategorySelectView extends StatelessWidget {
  const CategorySelectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("分类选择"), centerTitle: true,),
      body: Container(
        child: Text("分类选择"),
      ),
    );
  }
}
