// import 'dart:convert';
// import 'package:flutter/material.dart';
// // import 'package:flutter_quill/flutter_quill.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// /**
//  * 富文本编辑器
//  */
//
// GlobalKey<_RichEditorState> globalKey = GlobalKey();
//
// class RichEditor extends StatefulWidget {
//   const RichEditor({Key? key}) : super(key: key);
//
//   @override
//   State<RichEditor> createState() => _RichEditorState();
// }
//
// class _RichEditorState extends State<RichEditor> {
//   late QuillController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       _controller =  QuillController.basic();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             child: QuillToolbar.basic(controller: _controller),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 10),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: Colors.white
//             ),
//             constraints: BoxConstraints(
//               minHeight: ScreenUtil().setHeight(300)
//             ),
//             child: QuillEditor.basic(
//               controller: _controller,
//               readOnly: false, // true for view only mode
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   //获取富文本的值
//   String getRickEditorData() {
//     return jsonEncode(_controller.document.toDelta().toJson());
//    // return json.encode(_controller.document.toDelta());
//   }
// }
