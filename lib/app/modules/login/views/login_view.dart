import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {

  final LoginController loginController = Get.put(LoginController());
  GlobalKey formKey = new GlobalKey<FormState>();
  TextEditingController unameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("登录"),centerTitle: true,),
      body: Center(
        child: Container(
            child: containerAllWidget(context)
        ),
      )
    );
  }

  //组合
  Widget containerAllWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 50, left: 10, right: 10),
      width: ScreenUtil().screenWidth / 1.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          _registerFormWidget(context),
          _topWidget(context)
        ],
      ),
    );
  }

  //用户名
  Widget _registerFormWidget(context) {
    return Container(
      child: Form(
        //设置globalKey，用于后面获取FormState
        key: formKey,
        //开启自动校验
        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                keyboardType: TextInputType.text,
                controller: pwdController,
                decoration: InputDecoration(
                    labelText: "密码", icon: Icon(Icons.lock)),
                obscureText: true,
                //校验密码
                validator: (v) {
                  return v.toString().trim().length > 5 ? null : "密码不能少于6位";
                }),
            // 登录按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(250),
                    child: ElevatedButton(
                      child: Text("登录"),
                      onPressed: () {
                        //在这里不能通过此方式获取FormState，context不对
                        //print(Form.of(context));
                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if ((formKey.currentState as FormState).validate()) {
                          //验证通过提交数据
                          loginController.memberLogin(unameController.text, pwdController.text);
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

  //提示
  Widget _topWidget(context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("还没有注册吗~~~~"),
          VerticalDivider(width: 20),
          InkWell(
            onTap: (){
              Get.toNamed(Routes.REGISTER);
            },
            child: Text("注册",style: TextStyle(
                color: Colors.red
            ),),
          )
        ],
      ),
    );
  }
}
