import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/core/home/home_tab_frame.dart';
import 'package:news/modules/news/providers/subscriptions_stream_provider.dart';
import 'package:news/modules/news/widgets/subscription_item.dart';
import 'package:news/widgets/indicators.dart';

class SubscriptionsPage extends ConsumerWidget {
  const SubscriptionsPage();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return HomeTabFrame(
      title: 'Subscriptions',
      body: watch(subscriptionsStreamProvider).when(
        data: (subscriptions) => subscriptions.isNotEmpty
            ? CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) => SubscriptionItem(subscriptions[index]),
                        childCount: subscriptions.length,
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Text('You have no subscriptions'),
              ),
        loading: () => LoadingIndicator(),
        error: (_, __) => ErrorIndicator(),
      ),
    );
  }
}
