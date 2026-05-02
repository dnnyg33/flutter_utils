part of 'responsive_page.dart';

abstract class ResponsivePageBase {
  SliverGap get sliverGap;

  FooterAnchor get footerAnchor;

  Widget pageWrapper(
    BuildContext context,
    Widget Function(BuildContext, EdgeInsets) builder,
  );

  PreferredSizeWidget? appBar({
    required BuildContext context,
    required String title,
    required Widget? subtitle,
    required bool showBackButton,
    required AppBarInteractions appBarInteractions,
  });

  /// Returns a drawer widget for overlay navigation (mobile/tablet),
  /// or `null` if the platform uses a persistent sidebar instead.
  Widget? drawer(AppBarInteractions interactions);

  /// Wraps the body with a persistent sidebar on desktop,
  /// or returns it unchanged on mobile/tablet.
  Widget wrapBodyWithSidebar(Widget body, AppBarInteractions interactions);

  /// Sticky header will go between the PrimaryAppBar
  /// and the sliverContentBuilder. It will not scroll with the
  /// content.
  Widget? stickyHeader(BuildContext context);

  Widget? secondaryAppBar(BuildContext context, String title, Widget? subtitle);

  Widget? get floatingActionButton => null;

  FloatingActionButtonLocation? get floatingActionButtonLocation => null;
}
