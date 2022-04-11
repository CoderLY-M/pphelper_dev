import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/login/models/member_model.dart';
import 'package:pphelper/app/modules/member/controllers/member_controller.dart';
import 'package:pphelper/app/modules/member/controllers/avatar_image_picker_controller.dart';

import '../../avatar_image_picker/avatar_image_picker.dart';


class MemberPersonCenter extends StatefulWidget {
  const MemberPersonCenter({Key? key}) : super(key: key);

  @override
  _MemberPersonCenterState createState() => _MemberPersonCenterState();
}

class _MemberPersonCenterState extends State<MemberPersonCenter> {
  GlobalKey updateMemberInfoKey = new GlobalKey<FormState>();
  late TextEditingController idController;
  late TextEditingController usernameController;
  late TextEditingController nickNameController;
  late TextEditingController pwdController;
  late TextEditingController phoneController;
  late TextEditingController ageController;
  late TextEditingController emailController;
  late TextEditingController tokenController;
  late var sexController;
  final MemberController memberController = Get.find<MemberController>();

  @override
  void initState() {
    super.initState();
    initFormData();
  }

  //初始化数据
  initFormData() {
    var loginMember = memberController.loginMember;
    if(mounted) {
      this.setState(() {
        sexController = loginMember.sex;
        usernameController = new TextEditingController(text: "${loginMember.username}");
        idController = new TextEditingController(text: "${loginMember.id}");
        nickNameController = new TextEditingController(text: "${loginMember.nickName}");
        pwdController = new TextEditingController(text: "${loginMember.password}");
        phoneController = new TextEditingController(text: "${loginMember.phone}");
        emailController = new TextEditingController(text: "${loginMember.email}");
        ageController = new TextEditingController(text: "${loginMember.age}");
        tokenController = new TextEditingController(text: "${loginMember.token}");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("个人中心"), centerTitle: true,),
      body: Container(
        child: ListView(
          children: [
            _personCenterForm(context),
          ],
        ),
      ),
    );
  }

  Widget _personCenterForm(context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Form(
        //设置globalKey，用于后面获取FormState
        key: updateMemberInfoKey,
        //开启自动校验
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  AvatarImagePickerView(),
                  Text("上传/修改头像")
                ],
              ),
            ),
            Container(
              child: TextFormField(
                  keyboardType: TextInputType.number,
                  //键盘回车键的样式
                  textInputAction: TextInputAction.next,
                  controller: idController,
                  enabled: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "UID",
                      prefixIcon: Icon(Icons.error)
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                //键盘回车键的样式
                textInputAction: TextInputAction.next,
                controller: usernameController,
                enabled: false,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "用户名",
                    prefixIcon: Icon(Icons.error)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                  autofocus: false,
                  keyboardType: TextInputType.number,
                  //键盘回车键的样式
                  textInputAction: TextInputAction.next,
                  controller: nickNameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "昵称",
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide( width: 1),
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v.toString().trim().length > 0 ? null : "昵称不能为空";
                  }),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                  autofocus: false,
                  controller: pwdController,
                  decoration: InputDecoration(
                      hintText: "密码",
                    prefixIcon: Icon(Icons.lock_open),
                    contentPadding: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide( width: 1),
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v.toString().trim().length > 5 ? null : "密码不能少于6位";
                  }),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                autofocus: false,
                controller: ageController,
                decoration: InputDecoration(
                    hintText: "年龄",
                    prefixIcon: Icon(Icons.access_time),
                    contentPadding: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide( width: 1),
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
                validator: (value) {
                  try{
                    var parse = int.parse(value!);
                    if(parse <= 0) {
                      return "年龄必须为正整数";
                    }
                  }catch(e) {
                    return "年龄必须为数字";
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                  autofocus: false,
                  controller: phoneController,
                  decoration: InputDecoration(
                      hintText: "联系方式",
                      prefixIcon: Icon(Icons.local_phone),
                      contentPadding: EdgeInsets.only(
                        top: 0,
                        bottom: 0,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide( width: 1),
                        borderRadius: BorderRadius.circular(10),
                      )
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: TextFormField(
                  autofocus: false,
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "邮箱",
                    prefixIcon: Icon(Icons.email),
                    contentPadding: EdgeInsets.only(
                      top: 0,
                      bottom: 0,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide( width: 1),
                      borderRadius: BorderRadius.circular(10),
                    )
                  ),
              ),
            ),
            Divider(height: 20,color: Colors.white,),
            TextFormField(
              autofocus: false,
              controller: tokenController,
              maxLines: 8,
              minLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1)),
                  labelText: "个性签名",
                  prefixIcon: Icon(Icons.token)
              ),
            ),
            _setWidget(context),
            // 注册按钮
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(250),
                    child: ElevatedButton(
                      child: Text("修改"),
                      onPressed: () {
                        //在这里不能通过此方式获取FormState，context不对
                        //print(Form.of(context));
                        // 通过_formKey.currentState 获取FormState后，
                        // 调用validate()方法校验用户名密码是否合法，校验
                        // 通过后再提交数据。
                        if ((updateMemberInfoKey.currentState as FormState).validate()) {
                          _submitFormData();
                        }
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //提交表单数据
  _submitFormData() {
    //构建提交数据
    MemberModel memberModel = new MemberModel();
    memberModel.id = idController.text;
    memberModel.username = usernameController.text;
    memberModel.password = pwdController.text;
    memberModel.nickName = nickNameController.text;
    memberModel.phone = phoneController.text;
    memberModel.email = emailController.text;
    memberModel.age = int.parse(ageController.text);
    memberModel.token = tokenController.text;
    memberModel.sex = sexController;
    // Get.find<AvatarImagePickerController>().
    memberController.updateLoginMember(memberModel);
  }

  //性别组件
  Widget _setWidget(context) {
    return Row(
      children: <Widget>[
        Icon(Icons.people, color: Colors.grey,),
        Radio(
          value: 0,
          groupValue: sexController,
          activeColor: Theme.of(context).primaryColor,
          onChanged: (data){
            if(mounted) {
              setState(() {
                sexController = data;
              });
            }
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        Text(
          '男',
          style: TextStyle(
              fontSize: 18.0
          ),
        ),
        Radio(
          value: 1,
          groupValue: sexController,
          onChanged: (data){
            if(mounted) {
              setState(() {
                sexController = data;
              });
            }
          },
        ),
        Text(
          '女',
          style: TextStyle(
              fontSize: 18.0
          ),
        ),
      ],
    );
  }
}
