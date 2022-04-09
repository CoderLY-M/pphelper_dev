import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pphelper/app/modules/search/views/search_item/search_item.dart';
import '../controllers/search_controller.dart';


/**
 * 搜索栏目
 */

class SearchView extends SearchDelegate<String>{
  SearchController searchController = Get.put(SearchController());

  String searchHint = "请输入商品名称...";

  @override
  String get searchFieldLabel => searchHint;

  @override
  List<Widget> buildActions(BuildContext context) {
    ///刷新数据
    Get.find<SearchController>().initRecommendList();
    Get.find<SearchController>().initSearchHistoryData();
    ///显示在最右边的控件列表
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
          ///搜索建议的内容
          showSuggestions(context);
        },
      ),
      IconButton(
        icon: Icon(Icons.search, color: Colors.blue,),
        onPressed: () async{
          if(query.trim() != "") {
            //将搜索内容添加到历史记录中
            await searchController.insertHistoryData(query);
            buildResults(context);
            showResults(context);
          }else{
            Fluttertoast.showToast(
                msg: "未输入搜索内容",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Colors.red,
                fontSize: 16.0
            );
          }
        }
      )
    ];
  }


  ///左侧带动画的控件，一般都是返回
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(icon: AnimatedIcons.menu_arrow, progress: transitionAnimation
      ),
      ///调用 close 关闭 search 界面
      onPressed: ()=>close(context,""),
    );
  }


  ///展示搜索结果
  @override
  Widget buildResults(BuildContext context) {
    if(query.isNotEmpty) {
      //请求更新数据
      searchController.updateSearchProductList(query);
    }
    ///展示搜索结果
    return GetBuilder<SearchController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.searchProducts.length,
            itemBuilder: (BuildContext context, int index){
              return SearchItemView(searchProductModel: controller.searchProducts[index]);
            }
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _searchContentView(context);
  }

  /**
   * 搜索页面主体内容
   */
  Widget _searchContentView(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '大家都在搜',
              style: TextStyle(fontSize: 16),
            ),
          ),
          _searchItemTitleView(context),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '历史记录',
                  style: TextStyle(fontSize: 16),
                ),
                FlatButton(onPressed: (){
                  searchController.cleanHistoryData();
                }, child: Text("清空", style: TextStyle(color: Colors.blue),))
              ],
            ),
          ),
          _searchHistoryItemTitleView(context),
        ],
      ),
    );
  }

  /**
   * 推荐商品单个商品标题
   */
  Widget _searchItemTitleView(context) {
    return GetBuilder<SearchController>(
        builder: (controller) {
          var items = controller.recommendList;
          return Container(
            child: Wrap(
              spacing: 10,
              // runSpacing: 0,
              children: items.map((item) {
                return _searchItem(context, item);
              }).toList(),
            ),
          );
        }
    );
  }

  /**
   * 历史单个商品标题
   */
  Widget _searchHistoryItemTitleView(context) {
    return GetBuilder<SearchController>(
        builder: (controller) {
          var items = controller.searchHistory;
          return Container(
            child: Wrap(
              spacing: 10,
              // runSpacing: 0,
              children: items.map((item) {
                return _searchItem(context, item);
              }).toList(),
            ),
          );
        }
    );
  }


  Widget _searchItem(context, title) {
    return Container(
      child: InkWell(
        child: Chip(
          label: Text(title, style: TextStyle(color: Colors.blue),),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
        ),
        onTap: () {
          searchController.updateSearchProductList(title);
          showResults(context);
        },
      ),
      color: Colors.white,
    );
  }
}



