import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zefyrka/zefyrka.dart';

/**
 * 富文本编辑器
 */
GlobalKey<_MyRichEditorState> richerKey = new GlobalKey();

class MyRichEditor extends StatefulWidget {
  const MyRichEditor({Key? key}) : super(key: key);

  @override
  _MyRichEditorState createState() => _MyRichEditorState();
}

class _MyRichEditorState extends State<MyRichEditor> {
  late ZefyrController _controller = ZefyrController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: ScreenUtil().setHeight(400)
      ),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          ZefyrToolbar.basic(controller: _controller,),
          Container(
            padding: EdgeInsets.all(5),
            child: ZefyrEditor(
              controller: _controller,
            ),
          )
        ],
      ),
    );
  }

  //获取输入的值
  getRichInputValue() {
    return _controller.document.toPlainText();
  }
}








