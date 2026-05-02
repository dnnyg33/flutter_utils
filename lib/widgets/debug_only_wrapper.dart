import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ConditionalWrapper extends StatelessWidget {
  final bool condition;
  final Widget Function(BuildContext context, Widget child)? wrapper;
  final Widget child;

  const ConditionalWrapper({
    required this.condition,
    required this.wrapper,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return condition ? wrapper?.call(context, child) ?? child : child;
  }
}

class DebugOnlyWrapper extends StatelessWidget {
  final Widget Function(BuildContext context, Widget child) debugOnly;
  final Widget child;

  const DebugOnlyWrapper({
    required this.debugOnly,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalWrapper(
      condition: kDebugMode,
      wrapper: debugOnly,
      child: child,
    );
  }
}

class DebugOnlyTap extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;

  const DebugOnlyTap({required this.child, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return DebugOnlyWrapper(
      debugOnly: (context, child) {
        return GestureDetector(onTap: onTap, child: child);
      },
      child: child,
    );
  }
}

class DebugOrAdminWrapper extends StatelessWidget {
  final Widget Function(BuildContext context, Widget child) wrapper;
  final Widget child;

  const DebugOrAdminWrapper({
    required this.wrapper,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //todo setup AuthBloc
    final isAdmin = false;
    // final isAdmin = context.select((AuthBloc bloc) {
    //   return bloc.state.isAdmin();
    // });

    return ConditionalWrapper(
      condition: kDebugMode || isAdmin,
      wrapper: wrapper,
      child: child,
    );
  }
}
