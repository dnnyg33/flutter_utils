import 'package:flutter/material.dart';

/// A simple placeholder widget to display when a feature is coming soon.
class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key, this.featureName});

  final String? featureName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction, size: 64, color: Colors.grey[400]),
          const SizedBox(height: 24),
          Text(
            featureName != null ? '$featureName Coming Soon' : 'Coming Soon',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'This feature is under development',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
