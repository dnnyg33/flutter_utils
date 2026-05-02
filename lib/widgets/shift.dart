import 'package:flutter/widgets.dart';

class Shift extends StatelessWidget {
  final double? up;
  final double? down;
  final double? left;
  final double? right;
  final Widget child;

  /// Allows you to move a widget outside of its normal bounds.
  /// Probably should be used sparingly. It is unclear if there are any
  /// performance implications.
  /// Helpful when aligning widgets that have complicated built in paddings.
  /// Like buttons.
  const Shift({
    required this.child,
    super.key,
    this.up,
    this.down,
    this.left,
    this.right,
  }) : assert(
         left == null || right == null,
         'Cannot provide both left and right values',
       ),
       assert(
         up == null || down == null,
         'Cannot provide both up and down values',
       );

  @override
  Widget build(BuildContext context) {
    final left = this.left;
    final up = this.up;

    final x = left != null ? -left : right ?? 0.0;
    final y = up != null ? -up : down ?? 0.0;
    return Container(
      transform: Matrix4.translationValues(x, y, 0.0),
      child: child,
    );
  }
}
