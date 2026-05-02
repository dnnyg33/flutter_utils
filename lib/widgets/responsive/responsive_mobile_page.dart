part of 'responsive_page.dart';

class ResponsiveMobilePage extends ResponsivePageBase {
  final EdgeInsets padding;
  final double? appBarElevation;
  final Widget? _floatingActionButton;
  final FloatingActionButtonLocation? _floatingActionButtonLocation;

  ResponsiveMobilePage({
    this.appBarElevation,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
    Widget? floatingActionButton,
    FloatingActionButtonLocation? floatingActionButtonLocation,
  }) : _floatingActionButton = floatingActionButton,
       _floatingActionButtonLocation = floatingActionButtonLocation;

  bool get fullWidth => padding.left == 0 && padding.right == 0;

  @override
  FooterAnchor get footerAnchor => FooterAnchor.screenBottom;

  @override
  SliverGap get sliverGap => const SliverGap.two();

  @override
  Widget pageWrapper(
    BuildContext context,
    Widget Function(BuildContext, EdgeInsets) builder,
  ) {
    return builder(context, padding);
  }

  @override
  Widget? stickyHeader(BuildContext context) {
    return null;
  }

  @override
  Widget? get floatingActionButton => _floatingActionButton;

  @override
  FloatingActionButtonLocation? get floatingActionButtonLocation =>
      _floatingActionButtonLocation;

  @override
  PreferredSizeWidget? appBar({
    required BuildContext context,
    required String title,
    required Widget? subtitle,
    required bool showBackButton,
    required AppBarInteractions appBarInteractions,
  }) {
    return AppBarMobile(
      title: title,
      subtitle: subtitle,
      elevation: appBarElevation,
      interactions: appBarInteractions.changeBackButtonVisibility(
        showBackButton: showBackButton,
      ),
    );
  }

  @override
  Widget? drawer(AppBarInteractions interactions) {
    if (!interactions.showDrawer) {
      return null;
    }
    return Drawer(
      child: SizedBox.shrink()
      // Builder(
      //   builder: (context) =>
      //       AppNavigationDrawer(onItemTap: () => Navigator.of(context).pop()),
      // ),
    );
  }

  @override
  Widget wrapBodyWithSidebar(Widget body, AppBarInteractions interactions) {
    return body;
  }

  @override
  Widget? secondaryAppBar(
    BuildContext context,
    String title,
    Widget? subtitle,
  ) {
    return null;
  }
}
