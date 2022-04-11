import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:math';

import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/wallet/controllers/wallet_controller.dart';

//充值页面
class RechargeView extends StatefulWidget {
  @override
  _RechargeViewState createState() => _RechargeViewState();
}

class _RechargeViewState extends State<RechargeView> {
  //支付宝图片路径
  String aliImagePath ="assets/1.0x/images/alipay.png";
  //微信支付
  String wxImagePath ="assets/1.0x/images/wx.png";
  //我的钱包
  String walletImagePath ="assets/1.0x/images/wallet.png";
  //单选框的选择
  bool wxCheck = true;
  bool aliCheck = true;
  bool walletCheck = true;
  late TextEditingController inputEditingController;

  //判断选中支付宝还是微信 默认支付宝
  int checked = 1;

  @override
  void initState() {
    super.initState();
    inputEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('充值页面'),
        leading:  IconButton(
          icon:  Icon(
            Icons.chevron_left,
            size: 35.0,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(20,10, 0, 0),
              child: TextField(
                //最大行数
                maxLines: 1,
                keyboardType: TextInputType.number,
                controller: inputEditingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10.0),
                  icon: Icon(
                    Icons.attach_money,
                    color: Colors.black,
                  ),
                  labelText: '请输入你要充值的金额',
                  helperText: '充值金额不能为空',
                ),
                autofocus: true,
              ),
            ),
            //微信
             ListTile(
              title: Container(
                child: Stack(
                  children: <Widget>[
                     Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Row(
                        children: [
                          Image.asset(
                            "${aliImagePath}",
                            width: ScreenUtil().setWidth(55),
                            height: ScreenUtil().setHeight(70),
                          ),
                          Container(child: Text("支付宝"),padding: EdgeInsets.only(left: 10),)
                        ],
                      ),
                    ),
                    Align(
                      alignment: FractionalOffset.centerRight,
                      child: Radio(
                        value: 1,
                        groupValue: checked,
                        onChanged: (value) {
                          debugPrint(value.toString());
                          setState(() {
                            this.checked = 1;
                          });
                      }),
                    )
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                });
              },
            ),
            //支付宝
             ListTile(
              title: Container(
                child: Stack(
                  children: <Widget>[
                     Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Row(
                        children: [
                          Image.asset(
                            "${wxImagePath}",
                            width: ScreenUtil().setWidth(55),
                            height: ScreenUtil().setHeight(70),
                          ),
                          Container(child: Text("微信"),padding: EdgeInsets.only(left: 10),)
                        ],
                      ),
                    ),
                      Align(
                        alignment: FractionalOffset.centerRight,
                        child: Radio(
                            value: 2,
                            groupValue: checked,
                            onChanged: (value) {
                              debugPrint(value.toString());
                              setState(() {
                                this.checked = 2;
                              });
                            }),
                      )
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                });
              },
            ),
            //我的钱包
             ListTile(
              title: Container(
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: FractionalOffset.centerLeft,
                      child: Row(
                        children: [
                          Image.asset(
                            "${walletImagePath}",
                            width: ScreenUtil().setWidth(55),
                            height: ScreenUtil().setHeight(70),
                          ),
                          Container(child: Text("我的钱包"),padding: EdgeInsets.only(left: 10),)
                        ],
                      )
                    ),
                    Align(
                      alignment: FractionalOffset.centerRight,
                      child: Radio(
                        value: 3,
                        groupValue: checked,
                        onChanged: (value) {
                          debugPrint(value.toString());
                          setState(() {
                            this.checked = 3;
                          });
                      }),
                    )
                  ],
                ),
              ),
              onTap: () {
                setState(() {
                });
              },
            ),
             Container(
              height: 45.0,
              margin: EdgeInsets.fromLTRB(10, 70, 10, 0),
              child:  SizedBox.expand(
                child:  RaisedButton(
                  onPressed: () {
                    //判断是哪个支付
                    showDialog(
                      context: context,
                      builder: (context) {
                        if(inputEditingController.text != "") {
                          //获取选择的充值方式
                          if(checked == 1 || checked == 2) {
                            return AlertDialog(
                              content: Text('很抱歉，目前不支持支付宝与微信的方式~~~'),
                            );
                          }else{
                            try{
                              var parseMoney = double.parse(inputEditingController.text);
                              if(parseMoney <= 0) {
                                throw Exception("充值金额有误");
                              }
                              return AlertDialog(
                                content: Text('选择向我的钱包中充值:￥${parseMoney}'),
                                actions: <Widget>[
                                  ElevatedButton(child: Text('取消'),onPressed: (){
                                    Navigator.of(context).pop();
                                  }, style: ElevatedButton.styleFrom(primary: Colors.red),),
                                  ElevatedButton(child: Text('确认'),onPressed: (){
                                    handleRechargeMoney(context,parseMoney);
                                  },),
                                ],
                              );
                            }catch(e) {
                              return AlertDialog(
                                content: Text('充值金额有误~~~'),
                              );
                            }
                          }
                        }else{
                          return AlertDialog(
                            content: Text('你未输入充值金额~~~'),
                          );
                        }
                      });
                  },
                  color: Colors.blue,
                  child:  Text(
                    '充值',
                    style: TextStyle(
                        fontSize: 14.0,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //处理充值金额
  handleRechargeMoney(context,money) {
    try{
      Get.find<WalletController>().handleRechargeMoney(money);
      Navigator.of(context).pop();
      //清空输入款数据
      inputEditingController.text = "";
    }catch(e) {
      Navigator.of(context).pop();
    }
  }
}
