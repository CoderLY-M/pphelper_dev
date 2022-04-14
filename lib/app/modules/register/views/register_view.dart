import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../login/models/member_model.dart';
import '../controllers/register_controller.dart';

/**
 * 注册视图
 */

class RegisterView extends GetView<RegisterController> {
  GlobalKey formKey = new GlobalKey<FormState>();
  TextEditingController unameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  TextEditingController tpwdController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  final RegisterController registerController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('注册'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: _containerAllWidget(context),
        ),
      )
    );
  }

  //组合组件
  Widget _containerAllWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 10, right: 10),
      width: ScreenUtil().screenWidth / 1.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          _buildRegisterFormWidget(context),
        ],
      ),
    );
  }

  //注册表单组件
  Widget _buildRegisterFormWidget(context) {
    return Container(
        child: Form(
          //设置globalKey，用于后面获取FormState
          key: formKey,
          //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.text,
                  //键盘回车键的样式
                  textInputAction: TextInputAction.next,
                  controller: unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      icon: Icon(Icons.person)),
                  // 校验用户名
                  validator: (v) {
                    return v.toString().trim().length > 0 ? null : "用户名不能为空";
                  }),
              TextFormField(
                  autofocus: false,
                  controller: pwdController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "密码", icon: Icon(Icons.lock_open)),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v.toString().trim().length > 5 ? null : "密码不能少于6位";
                  }),
              TextFormField(
                  autofocus: false,
                  controller: tpwdController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "重复密码", icon: Icon(Icons.lock)),
                  obscureText: true,
                  //校验第二次密码密码
                  validator: (v) {
                    return v.toString().trim().length > 5 ? null : "密码不能少于6位";
                  }),
              TextFormField(
                  autofocus: false,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: "电话", icon: Icon(Icons.local_phone)),
                  obscureText: true,
                  //校验电话号码
                  validator: (v) {
                    return v.toString().trim().length > 5 ? null : "电话不能少于10位";
                  }),
              // 注册按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(250),
                      child: ElevatedButton(
                        child: Text("注册"),
                        onPressed: () {
                          //在这里不能通过此方式获取FormState，context不对
                          //print(Form.of(context));
                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。
                          if ((formKey.currentState as FormState).validate()) {
                            if(pwdController.text == tpwdController.text) {
                              _submitFormData();
                            }else{
                              Fluttertoast.showToast(
                                  msg: "两次密码输入不相同",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  //提交表单数据
  _submitFormData() {
    //构建提交数据
    MemberModel memberModel = new MemberModel();
    memberModel.username = unameController.text;
    memberModel.password = pwdController.text;
    memberModel.phone = phoneController.text;
    registerController.updateLoginMember(memberModel);
  }
}
