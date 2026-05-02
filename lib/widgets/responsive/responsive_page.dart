import 'package:flutter/material.dart';
import 'package:flutter_utils/widgets/responsive/responsive_const.dart';
import 'package:flutter_utils/widgets/responsive/responsive_value.dart';
import 'package:flutter_utils/widgets/responsive/sliver_gap.dart';
import 'package:flutter_utils/widgets/scroll_controller_holder.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../networking/boxed.dart';
import '../debug_only_wrapper.dart';
import '../shift.dart';
import 'app_bar_desktop.dart';
import 'app_bar_interactions.dart';
import 'app_bar_mobile.dart';
import 'gap.dart';

part 'responsive_desktop_page.dart';
part 'responsive_mobile_page.dart';
part 'responsive_page_base.dart';

enum FooterAnchor { screenBottom, contentBottom }

class ResponsivePage extends StatelessWidget {
  final ResponsivePageBase? mobile;
  final Boxed<ResponsivePageBase?>? desktop;
  final String title;
  final Widget? subtitle;
  final bool showBackButton;

  final AppBarInteractions? appBarInteractions;

  final Widget Function(BuildContext, ScrollController) sliverContentBuilder;

  final Widget Function(BuildContext, EdgeInsets)? footerBuilder;

  final Widget Function(BuildContext context, Widget child)?
  contentOverlayBuilder;

  final RefreshCallback? onRefresh;

  final ScrollPhysics? physics;

  final Color? backgroundColor;

  const ResponsivePage({
    required this.title,
    required this.sliverContentBuilder,
    super.key,
    this.showBackButton = true,
    this.footerBuilder,
    this.subtitle,
    this.mobile,
    this.desktop,
    this.appBarInteractions,
    this.contentOverlayBuilder,
    this.onRefresh,
    this.physics,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final mobile = this.mobile ?? ResponsiveMobilePage();
    final desktopBoxed = this.desktop;

    final desktop = desktopBoxed != null
        ? desktopBoxed.value
        : ResponsiveDesktopPage();

    final page = responsiveValue({
      Breakpoint.mobile: mobile,
      Breakpoint.tablet: desktop ?? mobile,
      Breakpoint.desktop: desktop ?? mobile,
    });

    final effectiveInteractions =
        appBarInteractions ?? AppBarInteractions.defaults(context: context);

    final _ = page.secondaryAppBar(context, title, subtitle);

    final footerAnchor = page.footerAnchor;

    final overlayBuilder = contentOverlayBuilder;
    final stickyHeader = page.stickyHeader(context);
    final footerAtBottom =
        footerAnchor == FooterAnchor.screenBottom && footerBuilder != null;
    final footerAtContentBottom =
        footerAnchor == FooterAnchor.contentBottom && footerBuilder != null;

    Widget body = ConditionalWrapper(
      condition: overlayBuilder != null,
      wrapper: (context, child) => overlayBuilder!(context, child),
      child: page.pageWrapper(context, (context, padding) {
        return ConditionalWrapper(
          condition: stickyHeader != null || footerAtBottom,
          wrapper: (context, child) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                if (stickyHeader != null) stickyHeader,
                Expanded(child: child),
                if (footerAtBottom) footerBuilder!(context, padding),
              ],
            );
          },
          child: ScrollControllerHolder(
            builder: (context, scrollController) {
              return ConditionalWrapper(
                condition: onRefresh != null,
                wrapper: (context, child) =>
                    RefreshIndicator(onRefresh: onRefresh!, child: child),
                child: CustomScrollView(
                  controller: scrollController,
                  physics: physics,
                  slivers: [
                    SliverPadding(
                      padding: padding,
                      sliver: MultiSliver(
                        children: [
                          sliverContentBuilder(context, scrollController),
                          if (footerAtContentBottom)
                            footerBuilder!(context, EdgeInsets.zero),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );

    body = page.wrapBodyWithSidebar(body, effectiveInteractions);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: page.appBar(
        context: context,
        title: title,
        subtitle: subtitle,
        showBackButton: showBackButton,
        appBarInteractions: effectiveInteractions,
      ),
      drawer: page.drawer(effectiveInteractions),
      body: body,
      floatingActionButton: page.floatingActionButton,
      floatingActionButtonLocation: page.floatingActionButtonLocation,
    );
  }
}
