part of 'responsive_page.dart';

class ResponsiveDesktopPage extends ResponsivePageBase {
  final EdgeInsets padding;

  ResponsiveDesktopPage({
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
  });

  bool get fullWidth => padding.left == 0 && padding.right == 0;

  @override
  SliverGap get sliverGap => const SliverGap.one();

  @override
  FooterAnchor get footerAnchor => FooterAnchor.contentBottom;

  @override
  PreferredSizeWidget appBar({
    required BuildContext context,
    required String title,
    required Widget? subtitle,
    required bool showBackButton,
    required AppBarInteractions appBarInteractions,
  }) {
    return AppBarDesktop(
      interactions: appBarInteractions.changeBackButtonVisibility(
        showBackButton: showBackButton,
      ),
    );
  }

  @override
  Widget? drawer(AppBarInteractions interactions) {
    return null;
  }

  @override
  Widget wrapBodyWithSidebar(Widget body, AppBarInteractions interactions) {
    if (!interactions.showDrawer || interactions.onBackPress != null) {
      return body;
    }
    return Row(
      children: [
        Expanded(child: body),
      ],
    );
  }

  @override
  Widget pageWrapper(
    BuildContext context,
    Widget Function(BuildContext, EdgeInsets) builder,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final horizontal = Breakpoint.desktop.paddingFor(
          constraints.maxWidth,
          padding.left,
        );
        return builder(
          context,
          EdgeInsets.only(
            left: horizontal,
            right: horizontal,
            top: padding.top,
            bottom: padding.bottom,
          ),
        );
      },
    );
  }

  @override
  Widget? stickyHeader(BuildContext context) {
    return null;
  }

  final double leftOffset = 16.0;

  double? get _shiftLeft =>
      fullWidth ? null : (padding.left - 8).clamp(0, leftOffset);

  double? get _shiftRight => fullWidth ? 8 : null;

  @override
  Widget? secondaryAppBar(
    BuildContext context,
    String title,
    Widget? subtitle,
  ) {
    return Shift(
      left: _shiftLeft,
      right: _shiftRight,
      child: Row(
        children: [
          Gap.one(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              if (subtitle != null) ...[subtitle],
            ],
          ),
        ],
      ),
    );
  }
}
