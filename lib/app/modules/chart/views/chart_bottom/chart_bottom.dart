import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/chart/controllers/chart_controller.dart';


/**
 * 聊天底部
 */
class ChartBottom extends StatefulWidget {
  const ChartBottom({Key? key}) : super(key: key);

  @override
  State<ChartBottom> createState() => _ChartBottomState();
}

class _ChartBottomState extends State<ChartBottom> {
  late TextEditingController inputEditingController;
  late FocusNode inputNode;

  @override
  void initState() {
    super.initState();
    inputEditingController = new TextEditingController();
    inputNode = new FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: IconButton(onPressed: () {
            } , icon: Icon(Icons.settings, color: Colors.blue,),),
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(3.0)),
            constraints: BoxConstraints(minHeight: 30.0, maxHeight: 150.0),
            child: TextField(
              focusNode: inputNode,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 14.0),
                  isDense: true,
                  hintText: "输入消息...",
                  contentPadding: EdgeInsets.all(5.0),
                  border: OutlineInputBorder(borderSide: BorderSide.none)
              ),
              controller: inputEditingController,
              // focusNode: _focusNode,
              onChanged: (val) {
                setState(() {
                  // editorLastCursor = inputEditingController.selection.baseOffset;
                });
              },
              onTap: () {handleEditorTaped();},
            ),
          ),
          Container(
            child: InkWell(
              onTap: () async{
                //获取数据
                var message = inputEditingController.text;
                if(message != "") {
                  await Get.find<ChartController>().handleSendMessage(message);
                  //关闭键盘
                  inputNode.unfocus();
                  //清空输入
                  inputEditingController.text = "";
                }else{
                  Fluttertoast.showToast(
                      msg: "发送消息不能为空~~~~",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.white,
                      textColor: Colors.red,
                      fontSize: 16.0
                  );
                }
              },
              child: Row(
                children: [
                  Text("发送消息", style: TextStyle(color: Colors.blue),),
                  Icon(Icons.send, color: Colors.blue,)
                ],
              ),
            )
          )
        ],
      ),
    );
  }

  void handleEditorTaped() {}
}
