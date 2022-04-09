import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/**
 * 搜索历史记录数据
 */
class HistoryService extends GetxService {
  //获取搜索历史记录
  Future<List<String>> getSearchHistory() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    List<String>? historyListStr = sharedPreferences.getStringList("historyData");
    if(historyListStr != null) {
      return historyListStr;
    }else{
      return [];
    }
  }

  //添加搜索历史记录
  Future<void> insertSearchHistory(String history) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    List<String>? historyListStr = sharedPreferences.getStringList("historyData");
    if(historyListStr != null) {
      historyListStr.add(history);
      await sharedPreferences.setStringList("historyData", historyListStr);
    }else{
      List<String> historyList = [];
      historyList.add(history);
      await sharedPreferences.setStringList("historyData", historyList);
    }
  }

  //删除所有的历史记录
  Future<void> cleanSearchHistory() async{
    var sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove("historyData");
  }
}