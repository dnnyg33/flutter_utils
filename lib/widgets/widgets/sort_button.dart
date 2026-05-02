import 'package:flutter/material.dart';

enum SortDirection {
  ascending,
  descending;

  bool isAscending() => this == SortDirection.ascending;
  bool isDescending() => this == SortDirection.descending;

  SortDirection toggle() {
    return this == ascending ? descending : ascending;
  }
}

/// A generic sort button that works with any enum type
///
/// Example usage:
/// ```dart
/// enum MySortField { name, date, priority }
///
/// SortButton<MySortField>(
///   label: 'Name',
///   field: MySortField.name,
///   currentField: state.sortField,
///   direction: state.sortDirection,
///   onTap: () => bloc.add(SortFieldChanged(MySortField.name)),
/// )
/// ```
class SortButton<T extends Enum> extends StatelessWidget {
  final String label;
  final T field;
  final T currentField;
  final SortDirection direction;
  final VoidCallback onTap;

  const SortButton({
    super.key,
    required this.label,
    required this.field,
    required this.currentField,
    required this.direction,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isActive = field == currentField;
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.outline,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: isActive
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
            if (isActive) ...[
              const SizedBox(width: 4),
              Icon(
                direction == SortDirection.ascending
                    ? Icons.arrow_upward
                    : Icons.arrow_downward,
                size: 16,
                color: theme.colorScheme.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
