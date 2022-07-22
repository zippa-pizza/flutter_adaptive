import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:flutter_adaptive/platform.dart';

/// An series of icons that adapt to the current platform's look.
///
/// Some icons for iOS are from the material icons collection as they might
/// not have an equivalent in the cupertino one.
class Icons {
  static IconData accountCircle(BuildContext context) => context.isIOS
      ? CupertinoIcons.profile_circled
      : material.Icons.account_circle;

  static IconData add(BuildContext context) =>
      context.isIOS ? CupertinoIcons.add : material.Icons.add;

  static IconData addShoppingCart(BuildContext context) => context.isIOS
      ? CupertinoIcons.cart_badge_plus
      : material.Icons.add_shopping_cart;

  static IconData arrowBack(BuildContext context) =>
      context.isIOS ? CupertinoIcons.chevron_back : material.Icons.arrow_back;

  static IconData arrowDropDown(BuildContext context) =>
      material.Icons.arrow_drop_down;

  static IconData autoDelete(BuildContext context) =>
      context.isIOS ? CupertinoIcons.delete : material.Icons.auto_delete;

  static IconData business(BuildContext context) =>
      context.isIOS ? CupertinoIcons.building_2_fill : material.Icons.business;

  static IconData calendar(BuildContext context) =>
      context.isIOS ? CupertinoIcons.calendar : material.Icons.calendar_today;

  static IconData camera(BuildContext context) =>
      context.isIOS ? CupertinoIcons.camera : material.Icons.camera;

  static IconData checkCircle(BuildContext context) => context.isIOS
      ? CupertinoIcons.check_mark_circled_solid
      : material.Icons.check_circle;

  static IconData chevronLeft(BuildContext context) =>
      context.isIOS ? CupertinoIcons.chevron_left : material.Icons.chevron_left;

  static IconData chevronRight(BuildContext context) => context.isIOS
      ? CupertinoIcons.chevron_right
      : material.Icons.chevron_right;

  static IconData close(BuildContext context) =>
      context.isIOS ? CupertinoIcons.xmark : material.Icons.close;

  static IconData copy(BuildContext context) =>
      context.isIOS ? CupertinoIcons.square_on_square : material.Icons.copy;

  static IconData delete(BuildContext context) =>
      context.isIOS ? CupertinoIcons.delete : material.Icons.delete;

  static IconData deliveryDining(BuildContext context) => context.isIOS
      ? material.Icons.delivery_dining_outlined
      : material.Icons.delivery_dining;

  static IconData edit(BuildContext context) =>
      context.isIOS ? CupertinoIcons.pencil : material.Icons.edit;

  static IconData email(BuildContext context) =>
      context.isIOS ? CupertinoIcons.mail : material.Icons.email;

  static IconData error(BuildContext context) => context.isIOS
      ? CupertinoIcons.exclamationmark_circle
      : material.Icons.error;

  static IconData expandMore(BuildContext context) =>
      context.isIOS ? CupertinoIcons.chevron_down : material.Icons.expand_more;

  static IconData explore(BuildContext context) =>
      context.isIOS ? CupertinoIcons.compass : material.Icons.explore;

  static IconData filterList(BuildContext context) => context.isIOS
      ? CupertinoIcons.line_horizontal_3_decrease
      : material.Icons.filter_list;

  static IconData flipCamera(BuildContext context) => context.isIOS
      ? CupertinoIcons.camera_rotate_fill
      : material.Icons.flip_camera_android;

  static IconData home(BuildContext context) =>
      context.isIOS ? CupertinoIcons.home : material.Icons.home;

  static IconData image(BuildContext context) =>
      context.isIOS ? CupertinoIcons.photo : material.Icons.image;

  static IconData info(BuildContext context) =>
      context.isIOS ? CupertinoIcons.info : material.Icons.info;

  static IconData language(BuildContext context) =>
      context.isIOS ? CupertinoIcons.globe : material.Icons.language;

  static IconData legendToggle(BuildContext context) =>
      context.isIOS ? CupertinoIcons.square_list : material.Icons.legend_toggle;

  static IconData link(BuildContext context) =>
      context.isIOS ? CupertinoIcons.link : material.Icons.link;

  static IconData list(BuildContext context) =>
      context.isIOS ? CupertinoIcons.list_bullet : material.Icons.list;

  static IconData localPizza(BuildContext context) => context.isIOS
      ? material.Icons.local_pizza_outlined
      : material.Icons.local_pizza;

  static IconData lock(BuildContext context) =>
      context.isIOS ? CupertinoIcons.lock : material.Icons.lock;

  static IconData logout(BuildContext context) =>
      context.isIOS ? CupertinoIcons.square_arrow_right : material.Icons.logout;

  static IconData menuBook(BuildContext context) =>
      context.isIOS ? CupertinoIcons.book : material.Icons.menu_book;

  static IconData notificationAdd(BuildContext context) =>
      context.isIOS ? CupertinoIcons.bell : material.Icons.notification_add;

  static IconData shoppingBag(BuildContext context) =>
      context.isIOS ? CupertinoIcons.bag : material.Icons.shopping_bag;

  static IconData payments(BuildContext context) =>
      context.isIOS ? CupertinoIcons.creditcard : material.Icons.payments;

  static IconData people(BuildContext context) =>
      context.isIOS ? CupertinoIcons.person_2 : material.Icons.people;

  static IconData phone(BuildContext context) =>
      context.isIOS ? CupertinoIcons.phone : material.Icons.phone;

  static IconData photo(BuildContext context) =>
      context.isIOS ? CupertinoIcons.photo : material.Icons.photo;

  static IconData photoLibrary(BuildContext context) => context.isIOS
      ? CupertinoIcons.photo_on_rectangle
      : material.Icons.photo_library;

  static IconData place(BuildContext context) =>
      context.isIOS ? CupertinoIcons.location : material.Icons.place;

  static IconData print(BuildContext context) =>
      context.isIOS ? CupertinoIcons.printer : material.Icons.print;

  static IconData receipt(BuildContext context) =>
      context.isIOS ? material.Icons.receipt_outlined : material.Icons.receipt;

  static IconData refresh(BuildContext context) =>
      context.isIOS ? CupertinoIcons.refresh : material.Icons.refresh;

  static IconData remove(BuildContext context) =>
      context.isIOS ? CupertinoIcons.minus : material.Icons.remove;

  static IconData reviews(BuildContext context) =>
      context.isIOS ? CupertinoIcons.star : material.Icons.reviews;

  static IconData schedule(BuildContext context) =>
      context.isIOS ? CupertinoIcons.clock : material.Icons.schedule;

  static IconData search(BuildContext context) =>
      context.isIOS ? CupertinoIcons.search : material.Icons.search;

  static IconData settings(BuildContext context) =>
      context.isIOS ? CupertinoIcons.settings : material.Icons.settings;

  static IconData shoppingCart(BuildContext context) =>
      context.isIOS ? CupertinoIcons.cart : material.Icons.shopping_cart;

  static IconData theme(BuildContext context) =>
      context.isIOS ? CupertinoIcons.brightness : material.Icons.brightness_6;

  static IconData timer(BuildContext context) =>
      context.isIOS ? CupertinoIcons.timer : material.Icons.timer;

  static IconData today(BuildContext context) =>
      context.isIOS ? CupertinoIcons.calendar_today : material.Icons.today;

  static IconData update(BuildContext context) => context.isIOS
      ? CupertinoIcons.arrow_up_circle_fill
      : material.Icons.update;

  static IconData writeReview(BuildContext context) => context.isIOS
      ? material.Icons.rate_review_outlined
      : material.Icons.rate_review;
}
