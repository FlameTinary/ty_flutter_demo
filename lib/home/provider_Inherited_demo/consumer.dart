import 'package:flutter/material.dart';
import 'package:ty_flutter_demo/home/provider_Inherited_demo/change_notifier_provider.dart';

class Consumer<T> extends StatelessWidget {
  Consumer({
    super.key,
    required this.builder,
  });

  final Widget Function(BuildContext context, T? value) builder;
  @override
  Widget build(BuildContext context) {
    return builder(
      context,
      ChangeNotifierProvider.of<T>(context),
    );
  }
}
