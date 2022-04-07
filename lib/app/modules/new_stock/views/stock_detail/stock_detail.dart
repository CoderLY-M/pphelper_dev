import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pphelper/app/modules/image_picker/controllers/image_picker_controller.dart';
import 'package:pphelper/app/modules/new_stock/controllers/new_stock_controller.dart';
import 'package:pphelper/app/modules/new_stock/models/stock_model.dart';
import 'package:pphelper/app/routes/app_pages.dart';
import 'package:pphelper/app/utils/validate_util.dart';

import '../../../image_picker/views/image_picker_view.dart';
import '../../controllers/select_category_controller.dart';
import '../rich_editor/rich_editor.dart';


class StockDetailView extends StatelessWidget {
  final TextEditingController nameEditingController = new TextEditingController();
  final TextEditingController priceEditingController = new TextEditingController();
  final TextEditingController countEditingController = new TextEditingController();
  final TextEditingController detailEditingController = new TextEditingController();
  final TextEditingController descEditingController = new TextEditingController();
  final TextEditingController imagesEditingController = new TextEditingController();
  final TextEditingController categoryEditingController = new TextEditingController();
  final SelectCategoryController selectCategoryController = Get.put(SelectCategoryController());


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          _formView(context),
          Positioned(
            left: 0,
            bottom: 0,
            child: submitWidget(),
          )
        ],
      )
    );
  }

  //提交按键
  Widget submitWidget() {
    return Container(
      height: ScreenUtil().setHeight(70),
      width: ScreenUtil().screenWidth,
      child: Center(
        child: Container(
          width: ScreenUtil().setWidth(350),
          child: ElevatedButton(
            onPressed: () {
              //获取数据
              getFormData();
            },
            child: Text("提交"),
          ),
        ),
      )
    );
  }


  //获取数据
  getFormData() {
    var name = nameEditingController.text;
    var price = priceEditingController.text;
    var count = countEditingController.text == "" ? "0" : countEditingController.text;
    var desc = descEditingController.text;
    var category = selectCategoryController.selectCategory;
    //获取图片名称
    var imageFiles = Get.find<ImagePickerController>().files;
    //获取富文本数据
    // var rickEditorData = globalKey.currentState?.getRickEditorData();
    //校验
    var validateProductName = ValidateUtil.validateProductName(name);
    var validatePrice = ValidateUtil.validatePrice(price);
    var validateProductCount = ValidateUtil.validateProductCount(count);
    var validateProductDesc = ValidateUtil.validateProductDesc(desc);
    var validateProductImages = ValidateUtil.validateProductImages(imageFiles);
    var validateProductCategory = ValidateUtil.validateProductCategory(category);
    if(validateProductName && validateProductDesc && validatePrice && validateProductCount && validateProductImages && validateProductCategory) {
      //封装对象
      StockModel stockModel = new StockModel();
      stockModel.productName = name.trim();
      stockModel.productPrice = double.parse(price);
      stockModel.productCount = int.parse(count);
      stockModel.productDesc = desc.trim();
      stockModel.sortId = category.toString();
      // stockModel.productDetail = rickEditorData;
      Get.find<NewStockController>().updateStockModel(stockModel, imageFiles);
    }
  }

  //分类选择器
  categoryView(BuildContext context) {
    //获取分类数据
    new Picker(
        adapter: PickerDataAdapter<String>(data: selectCategoryController.getCategoryData(selectCategoryController.categoryData)),
        changeToFirst: true,
        hideHeader: false,
        confirmText: "确定",
        cancelText: "取消",
        onConfirm: (Picker picker, List value) {
          var selectedValues = picker.getSelectedValues();
          selectCategoryController.updateSelectCategory(selectedValues);
        }
    ).showModal(context);
  }

  //表单
  Widget _formView(context) {
    return Container(
      child:ListView(
          children: [
            StockDetailCommentTitle(title: "商品基本信息",),
            StockDetailCommentBasic(labelText: "商品名称", hintText: "请输入商品名称", textEditingController: nameEditingController, onChanged: (val) {}),
            StockDetailCommentBasic(labelText: "商品价格", hintText: "请输入商品价格", textEditingController: priceEditingController, onChanged: (val) {}, suffixText: "元",),
            StockDetailCommentBasic(labelText: "商品描述", hintText: "请输入商品描述",  textEditingController: descEditingController, onChanged: (val) {}),
            StockDetailCommentDIY(labelText: "商品数量", hintText: "请输入商品数量", suffixText: "件",  textEditingController: countEditingController, onChanged: (val) {},
              contentBuilder: (BuildContext context) {
                return Container(
                  child: Expanded(
                      child: Container(
                        child: NumberControllerWidget(removeValueChanged: (value) {
                        }, updateValueChanged: (value) {
                          countEditingController.text = value.toString();
                        }, addValueChanged: (value) {
                        }, ),
                        height: ScreenUtil().setHeight(60),
                      )
                  ),
                );
              },),
            StockDetailCommentDIY(labelText: "商品分类", textEditingController: categoryEditingController, onChanged: (val) {},
              contentBuilder: (BuildContext context) {
                return Container(
                  child: Expanded(
                      child: Container(
                        height: ScreenUtil().setHeight(50),
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            //跳转到分类选择
                            //_scaffoldKey.currentState);
                            categoryView(context);
                          },
                          child: GetBuilder<SelectCategoryController>(
                            builder: (controller) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${controller.selectCategoryName}" ,style: TextStyle(fontSize: ScreenUtil().setSp(20),),),
                                  Icon(Icons.height)
                                ],
                              );
                            },
                          )
                        ),
                      )
                  ),
                );
              },),
            Divider(height: 20,color: Colors.white,),
            StockDetailCommentTitle(title: "商品图片",),
            ImagePickerView(),
            StockDetailCommentTitle(title: "商品细节",),
            // RichEditor(
            //   key: globalKey,
            // ),
          ],
        ),
    );
  }
}

//标题组件
class StockDetailCommentTitle extends StatelessWidget {
  const StockDetailCommentTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        title,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          fontWeight: FontWeight.w300,
          color: Theme.of(context).primaryColor
        ),
      ),
    );
  }
}

//基本信息描述组件
class StockDetailCommentBasic extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController textEditingController;
  final ValueChanged onChanged;
  final Widget? suffix;
  final String? suffixText;
  const StockDetailCommentBasic({
    Key? key,
    required this.labelText,
    this.hintText,
    required this.textEditingController,
    required this.onChanged,
    this.suffix,
    this.suffixText, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor))
        ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 50),
            child: Text(labelText, style: TextStyle(
            ),),
          ),
          Expanded(
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    color: Theme.of(context).hintColor
                  )
              ),
            ),
          ),
          if (suffix != null) Container(child: suffix,),
          if (suffix == null && suffixText != null) Text(suffixText!),
        ],
      )
    );
  }
}

//自定义信息描述组件
class StockDetailCommentDIY extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController textEditingController;
  final ValueChanged onChanged;
  final Widget? suffix;
  final String? suffixText;
  final Widget Function(BuildContext context) contentBuilder;
  const StockDetailCommentDIY({
    Key? key,
    required this.labelText,
    this.hintText,
    required this.textEditingController,
    required this.onChanged,
    this.suffix,
    this.suffixText, required this.contentBuilder, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor))
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 50),
              child: Text(labelText, style: TextStyle(
              ),),
            ),
            contentBuilder(context),
            if (suffix != null) Container(child: suffix,),
            if (suffix == null && suffixText != null) Text(suffixText!),
          ],
        )
    );
  }
}



//商品数量选择
class NumberControllerWidget extends StatefulWidget {
  //高度
  final double height;
  //输入框的宽度 总体宽度为自适应
  final double width;
  //按钮的宽度
  final double iconWidth;
  //默认输入框显示的数量
  final String numText;
  //点击加号回调 数量
  final ValueChanged addValueChanged;
  //点击减号回调 数量
  final ValueChanged removeValueChanged;
  //点击减号任意一个回调 数量
  final ValueChanged updateValueChanged;
  //数据改变的回调函数

  NumberControllerWidget({
    this.height = 30,
    this.width = 40,
    this.iconWidth = 40,
    this.numText = '0',
    required this.addValueChanged,
    required this.removeValueChanged,
    required this.updateValueChanged,
  });
  @override
  _NumberControllerWidgetState createState() => _NumberControllerWidgetState();
}

class _NumberControllerWidgetState extends State<NumberControllerWidget> {
  var textController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    this.textController.text = widget.numText;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(width: 1, color: Colors.black12)
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //减号
              CoustomIconButton(icon: Icons.remove, isAdd: false),
              //输入框
              Container(
                width: widget.width,
                decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 1, color: Colors.black12),
                        right: BorderSide(width: 1, color: Colors.black12)
                    )
                ),
                child: TextField(
                  controller: textController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    var num = 0;
                    try {
                      num = int.parse(textController.text);
                      if (widget.updateValueChanged != null) widget
                          .updateValueChanged(num);
                    } catch (e) {
                      print(e);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12
                  ),
                  enableInteractiveSelection: false,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 0, top: 2, bottom: 2, right: 0),
                    border: const OutlineInputBorder(
                      gapPadding: 0,
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              //加号
              CoustomIconButton(icon: Icons.add, isAdd: true),
            ],
          ),
        )
      ],
    );
  }

  Widget CoustomIconButton({required IconData icon, required bool isAdd}) {
    return Container(
      width: widget.iconWidth,
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(icon),
        onPressed: () {
          var num = int.parse(textController.text);
          if (!isAdd && num == 0) return;
          if (isAdd) {
            num ++;
            if (widget.addValueChanged != null) widget.addValueChanged(num);
          }
          else {
            num --;
            if (widget.removeValueChanged != null) widget.removeValueChanged(
                num);
          }
          textController.text = '$num';
          if (widget.updateValueChanged != null) widget.updateValueChanged(num);
        },
      ),
    );
  }
}

