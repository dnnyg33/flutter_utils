import 'package:{{package_name.snakeCase()}}/l10n/{{package_name.snakeCase()}}_localizations.dart';
import 'package:{{package_name}}/src/{{feature_name.snakeCase()}}/ui/{{feature_name.snakeCase()}}_page.dart';
import 'package:{{{fullPath}}}/bloc/{{feature_name.snakeCase()}}_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

/// Body of the {{feature_name.pascalCase()}}Page.
///
/// Add what it does
class {{feature_name.pascalCase()}}Body extends StatelessWidget {
  final {{package_name.pascalCase()}}Localizations l10n;
  final {{feature_name.pascalCase()}}Interactions interactions;
  const {{feature_name.pascalCase()}}Body({
    super.key,
    required this.l10n,
    required this.interactions,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<{{feature_name.pascalCase()}}Bloc, {{feature_name.pascalCase()}}State>(
      builder: (context, state) {
        return MultiSliver(
          children: [
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  l10n.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Template Instructions',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Edit this UI in {{feature_name.snakeCase()}}_body.dart in the widgets folder of {{feature_name.snakeCase()}} feature.',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '{{feature_name.pascalCase()}}State: $state. Edit this in {{feature_name.snakeCase()}}_state.dart in bloc folder of {{feature_name.snakeCase()}} feature.',
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Localizations title: ${l10n.title}. Edit this in the l10n folder of the {{feature_name.snakeCase()}} package.',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Add your custom slivers here
            // Example:
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (context, index) => ListTile(title: Text('Item $index')),
            //     childCount: 20,
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
