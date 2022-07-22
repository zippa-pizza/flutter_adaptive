import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;

/// An series of icons that adapt to the current platform's look.
///
/// Some icons for iOS are from the material icons collection as they might
/// not have an equivalent in the cupertino one.
class Icons {
  static final bool _isIOS = adaptive.isIOS;

  static IconData get accountCircle =>
      _isIOS ? CupertinoIcons.profile_circled : material.Icons.account_circle;

  static IconData get add => _isIOS ? CupertinoIcons.add : material.Icons.add;

  static IconData get addShoppingCart => _isIOS
      ? CupertinoIcons.cart_badge_plus
      : material.Icons.add_shopping_cart;

  static IconData get arrowBack =>
      _isIOS ? CupertinoIcons.chevron_back : material.Icons.arrow_back;

  static IconData get arrowDropDown => material.Icons.arrow_drop_down;

  static IconData get autoDelete =>
      _isIOS ? CupertinoIcons.delete : material.Icons.auto_delete;

  static IconData get business =>
      _isIOS ? CupertinoIcons.building_2_fill : material.Icons.business;

  static IconData get calendar =>
      _isIOS ? CupertinoIcons.calendar : material.Icons.calendar_today;

  static IconData get camera =>
      _isIOS ? CupertinoIcons.camera : material.Icons.camera;

  static IconData get checkCircle => _isIOS
      ? CupertinoIcons.check_mark_circled_solid
      : material.Icons.check_circle;

  static IconData get chevronLeft =>
      _isIOS ? CupertinoIcons.chevron_left : material.Icons.chevron_left;

  static IconData get chevronRight =>
      _isIOS ? CupertinoIcons.chevron_right : material.Icons.chevron_right;

  static IconData get close =>
      _isIOS ? CupertinoIcons.xmark : material.Icons.close;

  static IconData get copy =>
      _isIOS ? CupertinoIcons.square_on_square : material.Icons.copy;

  static IconData get delete =>
      _isIOS ? CupertinoIcons.delete : material.Icons.delete;

  static IconData get deliveryDining => _isIOS
      ? material.Icons.delivery_dining_outlined
      : material.Icons.delivery_dining;

  static IconData get edit =>
      _isIOS ? CupertinoIcons.pencil : material.Icons.edit;

  static IconData get email =>
      _isIOS ? CupertinoIcons.mail : material.Icons.email;

  static IconData get error =>
      _isIOS ? CupertinoIcons.exclamationmark_circle : material.Icons.error;

  static IconData get expandMore =>
      _isIOS ? CupertinoIcons.chevron_down : material.Icons.expand_more;

  static IconData get explore =>
      _isIOS ? CupertinoIcons.compass : material.Icons.explore;

  static IconData get filterList => _isIOS
      ? CupertinoIcons.line_horizontal_3_decrease
      : material.Icons.filter_list;

  static IconData get flipCamera => _isIOS
      ? CupertinoIcons.camera_rotate_fill
      : material.Icons.flip_camera_android;

  static IconData get home =>
      _isIOS ? CupertinoIcons.home : material.Icons.home;

  static IconData get image =>
      _isIOS ? CupertinoIcons.photo : material.Icons.image;

  static IconData get info =>
      _isIOS ? CupertinoIcons.info : material.Icons.info;

  static IconData get language =>
      _isIOS ? CupertinoIcons.globe : material.Icons.language;

  static IconData get legendToggle =>
      _isIOS ? CupertinoIcons.square_list : material.Icons.legend_toggle;

  static IconData get link =>
      _isIOS ? CupertinoIcons.link : material.Icons.link;

  static IconData get list =>
      _isIOS ? CupertinoIcons.list_bullet : material.Icons.list;

  static IconData get localPizza =>
      _isIOS ? material.Icons.local_pizza_outlined : material.Icons.local_pizza;

  static IconData get lock =>
      _isIOS ? CupertinoIcons.lock : material.Icons.lock;

  static IconData get logout =>
      _isIOS ? CupertinoIcons.square_arrow_right : material.Icons.logout;

  static IconData get menuBook =>
      _isIOS ? CupertinoIcons.book : material.Icons.menu_book;

  static IconData get notificationAdd =>
      _isIOS ? CupertinoIcons.bell : material.Icons.notification_add;

  static IconData get shoppingBag =>
      _isIOS ? CupertinoIcons.bag : material.Icons.shopping_bag;

  static IconData get payments =>
      _isIOS ? CupertinoIcons.creditcard : material.Icons.payments;

  static IconData get people =>
      _isIOS ? CupertinoIcons.person_2 : material.Icons.people;

  static IconData get phone =>
      _isIOS ? CupertinoIcons.phone : material.Icons.phone;

  static IconData get photo =>
      _isIOS ? CupertinoIcons.photo : material.Icons.photo;

  static IconData get photoLibrary =>
      _isIOS ? CupertinoIcons.photo_on_rectangle : material.Icons.photo_library;

  static IconData get place =>
      _isIOS ? CupertinoIcons.location : material.Icons.place;

  static IconData get print =>
      _isIOS ? CupertinoIcons.printer : material.Icons.print;

  static IconData get receipt =>
      _isIOS ? material.Icons.receipt_outlined : material.Icons.receipt;

  static IconData get refresh =>
      _isIOS ? CupertinoIcons.refresh : material.Icons.refresh;

  static IconData get remove =>
      _isIOS ? CupertinoIcons.minus : material.Icons.remove;

  static IconData get reviews =>
      _isIOS ? CupertinoIcons.star : material.Icons.reviews;

  static IconData get schedule =>
      _isIOS ? CupertinoIcons.clock : material.Icons.schedule;

  static IconData get search =>
      _isIOS ? CupertinoIcons.search : material.Icons.search;

  static IconData get settings =>
      _isIOS ? CupertinoIcons.settings : material.Icons.settings;

  static IconData get shoppingCart =>
      _isIOS ? CupertinoIcons.cart : material.Icons.shopping_cart;

  static IconData get theme =>
      _isIOS ? CupertinoIcons.brightness : material.Icons.brightness_6;

  static IconData get timer =>
      _isIOS ? CupertinoIcons.timer : material.Icons.timer;

  static IconData get today =>
      _isIOS ? CupertinoIcons.calendar_today : material.Icons.today;

  static IconData get update =>
      _isIOS ? CupertinoIcons.arrow_up_circle_fill : material.Icons.update;

  static IconData get writeReview =>
      _isIOS ? material.Icons.rate_review_outlined : material.Icons.rate_review;
}
