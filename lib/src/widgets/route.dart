import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_adaptive/flutter_adaptive.dart' as adaptive;
import 'package:flutter_adaptive/src/config/config.dart';
import 'package:flutter_adaptive/src/l10n/l10n.dart';
import 'package:flutter_adaptive/src/widgets/flexible_space_bar.dart';

/// An adaptive route.
///
/// **IMPORTANT**: the [child] must be a widget that implements the sliver
/// protocol, such as [SliverList].
class Route extends StatelessWidget {
  final String title;

  /// Only honored on iOS
  final String? previousPageTitle;

  final Widget child;

  /// Persistent widget shown at the top of the page
  final PreferredSizeWidget? top;

  /// Persistent widget shown at the bottom of the page
  final Widget? bottom;

  /// Actions to be shown in the app bar
  final List<Widget>? actions;

  final Widget? floatingActionButton;

  final Future<void> Function(BuildContext context)? onRefresh;

  const Route({
    super.key,
    required this.title,
    this.previousPageTitle,
    required this.child,
    this.top,
    this.bottom,
    this.actions,
    this.floatingActionButton,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      Theme.of(context).brightness == Brightness.light
          ? SystemUiOverlayStyle.dark
              .copyWith(statusBarColor: Colors.transparent)
          : SystemUiOverlayStyle.light
              .copyWith(statusBarColor: Colors.transparent),
    );

    if (adaptive.isIOS) {
      return Scaffold(
        body: SafeArea(
          top: false,
          child: CupertinoPageScaffold(
            child: Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    slivers: [
                      CupertinoTheme(
                        data: CupertinoThemeData(
                          brightness: Theme.of(context).brightness,
                          primaryColor: Theme.of(context).colorScheme.primary,
                        ),
                        child: CupertinoSliverNavigationBar(
                          stretch: onRefresh == null,
                          largeTitle: TextOneLine(
                            title,
                            style: TextStyle(fontFamily: fontFamily(context)),
                          ),
                          previousPageTitle: previousPageTitle ??
                              PackageLocalizations.of(context).back,
                          trailing: IconTheme(
                            data: IconTheme.of(context).copyWith(
                              color: DefaultTextStyle.of(context).style.color,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: actions ?? [],
                            ),
                          ),
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          border: null,
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverTopDelegate(
                          top ??
                              const PreferredSize(
                                preferredSize: Size.fromHeight(1),
                                child: Divider(height: 1),
                              ),
                        ),
                      ),
                      if (onRefresh != null)
                        CupertinoSliverRefreshControl(
                          onRefresh: () => onRefresh!(context),
                        ),
                      child,
                    ],
                  ),
                ),
                if (bottom != null) bottom!,
              ],
            ),
          ),
        ),
        floatingActionButton: floatingActionButton,
      );
    }

    const double expandedHeight = kToolbarHeight + 41;

    Widget body = CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          actions: actions,
          expandedHeight: expandedHeight,
          flexibleSpace: CustomFlexibleSpaceBar(
            title: title,
            expandedHeight: expandedHeight,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverTopDelegate(
            top ??
                const PreferredSize(
                  preferredSize: Size.zero,
                  child: SizedBox(),
                ),
          ),
        ),
        child,
      ],
    );

    if (onRefresh != null) {
      double edgeOffset = expandedHeight + 1; // Divider

      if (top != null) {
        edgeOffset += top!.preferredSize.height;
      }

      body = RefreshIndicator(
        onRefresh: () => onRefresh!(context),
        edgeOffset: edgeOffset,
        child: body,
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: body),
            if (bottom != null) bottom!,
          ],
        ),
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}

class _SliverTopDelegate extends SliverPersistentHeaderDelegate {
  _SliverTopDelegate(this.widget);

  final PreferredSizeWidget widget;

  @override
  double get minExtent => widget.preferredSize.height + 1;
  @override
  double get maxExtent => widget.preferredSize.height + 1;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          widget,
          const Divider(height: 1),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(_SliverTopDelegate oldDelegate) {
    return true;
  }
}
