import 'package:get/get.dart';

import 'package:pphelper/app/modules/bus/bindings/bus_binding.dart';
import 'package:pphelper/app/modules/bus/views/bus_view.dart';
import 'package:pphelper/app/modules/category/bindings/category_binding.dart';
import 'package:pphelper/app/modules/category/views/category_view.dart';
import 'package:pphelper/app/modules/chart/bindings/chart_binding.dart';
import 'package:pphelper/app/modules/chart/views/chart_view.dart';
import 'package:pphelper/app/modules/collection/bindings/collection_binding.dart';
import 'package:pphelper/app/modules/collection/views/collection_view.dart';
import 'package:pphelper/app/modules/home/bindings/home_binding.dart';
import 'package:pphelper/app/modules/home/views/home_view.dart';
import 'package:pphelper/app/modules/image_picker/bindings/image_picker_binding.dart';
import 'package:pphelper/app/modules/image_picker/views/image_picker_view.dart';
import 'package:pphelper/app/modules/index/bindings/index_binding.dart';
import 'package:pphelper/app/modules/index/views/index_view.dart';
import 'package:pphelper/app/modules/login/bindings/login_binding.dart';
import 'package:pphelper/app/modules/login/views/login_view.dart';
import 'package:pphelper/app/modules/member/bindings/member_binding.dart';
import 'package:pphelper/app/modules/member/bindings/member_person_center_binding.dart';
import 'package:pphelper/app/modules/member/views/member_view.dart';
import 'package:pphelper/app/modules/message/bindings/message_binding.dart';
import 'package:pphelper/app/modules/message/views/message_view.dart';
import 'package:pphelper/app/modules/new_stock/bindings/new_stock_binding.dart';
import 'package:pphelper/app/modules/new_stock/views/category_select/category_selelct.dart';
import 'package:pphelper/app/modules/new_stock/views/new_stock_view.dart';
import 'package:pphelper/app/modules/order/bindings/order_binding.dart';
import 'package:pphelper/app/modules/order/views/order_view.dart';
import 'package:pphelper/app/modules/order_detail/bindings/order_detail_binding.dart';
import 'package:pphelper/app/modules/order_detail/views/order_detail_view.dart';
import 'package:pphelper/app/modules/product_detail/bindings/product_detail_binding.dart';
import 'package:pphelper/app/modules/product_detail/views/product_detail_view.dart';
import 'package:pphelper/app/modules/register/bindings/register_binding.dart';
import 'package:pphelper/app/modules/register/views/register_view.dart';
import 'package:pphelper/app/modules/sale/bindings/sale_binding.dart';
import 'package:pphelper/app/modules/sale/views/sale_view.dart';
import 'package:pphelper/app/modules/seller/bindings/seller_binding.dart';
import 'package:pphelper/app/modules/seller/views/seller_view.dart';
import 'package:pphelper/app/modules/settlement/bindings/settlement_binding.dart';
import 'package:pphelper/app/modules/settlement/views/settlement_view.dart';
import 'package:pphelper/app/modules/system_info/bindings/system_info_binding.dart';
import 'package:pphelper/app/modules/system_info/views/system_info_view.dart';
import 'package:pphelper/app/modules/wallet/bindings/wallet_binding.dart';
import 'package:pphelper/app/modules/wallet/views/recharge/recharge_view.dart';
import 'package:pphelper/app/modules/wallet/views/wallet_view.dart';

import '../modules/member/views/member_drawer/member_person_center/member_person_center.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.INDEX,
      page: () => IndexView(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: _Paths.MEMBER,
      page: () => MemberView(),
      binding: MemberBinding(),
    ),
    GetPage(
      name: _Paths.BUS,
      page: () => BusView(),
      binding: BusBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAIL,
      page: () => ProductDetailView(),
      binding: ProductDetailBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.MEMBER_PERSON_CENTER,
      page: () => MemberPersonCenter(),
      binding: MemberPersonCenterBinding(),
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAIL,
      page: () => OrderDetailView(),
      binding: OrderDetailBinding(),
    ),
    GetPage(
      name: _Paths.COLLECTION,
      page: () => CollectionView(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: _Paths.SALE,
      page: () => SaleView(),
      binding: SaleBinding(),
    ),
    GetPage(
      name: _Paths.NEW_STOCK,
      page: () => NewStockView(),
      binding: NewStockBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_SELECT,
      page: () => CategorySelectView(),
      binding: NewStockBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_PICKER,
      page: () => ImagePickerView(),
      binding: ImagePickerBinding(),
    ),
    GetPage(
      name: _Paths.CHART,
      page: () => ChartView(),
      binding: ChartBinding(),
    ),
    GetPage(
      name: _Paths.SELLER,
      page: () => SellerView(),
      binding: SellerBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.RECHARGE,
      page: () => RechargeView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.SYSTEM_INFO,
      page: () => SystemInfoView(),
      binding: SystemInfoBinding(),
    ),
    GetPage(
      name: _Paths.SETTLEMENT,
      page: () => SettlementView(),
      binding: SettlementBinding(),
    ),
  ];
}
