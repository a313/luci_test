import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:luci_test/core/error/failures.dart';
import 'package:luci_test/core/util/util.dart';
import 'package:luci_test/domain/entities/activiy.dart';
import 'package:luci_test/share_widgets/errors/network_error_widget.dart';
import 'package:luci_test/share_widgets/errors/server_error_widget.dart';
import 'package:luci_test/share_widgets/loading_widget.dart';
import 'package:luci_test/theme/app_colors.dart';
import 'package:luci_test/theme/app_fonts.dart';

import '../bloc/activity/activity_bloc.dart';

class ActivityComponent extends StatelessWidget {
  const ActivityComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityBloc, ActivityState>(
      builder: (context, state) {
        if (state is ActivityInitial) {
          return const LoadingWidget();
        } else if (state is ActivityLoaded) {
          return _ActivitiesWidget(state.activities);
        } else if (state is ActivityFilter) {
          return _ActivitiesWidget(state.filterData);
        } else if (state is ActivityError && state.failure is NetworkFailure) {
          return const NetworkErrorWidget();
        } else if (state is ActivityError && state.failure is ServerFailure) {
          return const ServerErrorWidget();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class _ActivitiesWidget extends StatelessWidget {
  const _ActivitiesWidget(
    this.activities, {
    Key? key,
  }) : super(key: key);

  final List<Activity> activities;

  @override
  Widget build(BuildContext context) {
    final formatedData = handleData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Lịch sử hoạt động",
          style: AppFonts.size24(),
        ),
        const Divider(),
        const SearchComponent(),
        Expanded(
          child: CustomScrollView(
            primary: true,
            slivers: List.generate(formatedData.keys.length, (index) {
              final key = formatedData.keys.elementAt(index);
              return ActivitySection(
                headerTime: key,
                sectionData: formatedData[key]!,
              );
            }),
          ),
        ),
      ],
    );
  }

  Map<DateTime, List<Activity>> handleData() {
    final Map<DateTime, List<Activity>> formattedData = {};
    activities.sort(
      (a, b) => b.time.compareTo(a.time),
    );
    for (final act in activities) {
      final month = act.time.dateWithoutTime();
      if (formattedData.containsKey(month)) {
        final listSection = formattedData[month]!;
        listSection.add(act);
      } else {
        formattedData[month] = [act];
      }
    }
    return formattedData;
  }
}

class SearchComponent extends StatelessWidget {
  const SearchComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PAD_SYM_H12,
      child: Wrap(
        spacing: 12.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            "Tìm kiếm theo hành động",
            style: AppFonts.size13(),
          ),
          SizedBox(
              width: 200,
              child: CupertinoSearchTextField(
                onSubmitted: (action) {
                  context.read<ActivityBloc>().add(FilterActivityEvent(action));
                },
              )),
        ],
      ),
    );
  }
}

class ActivitySection extends StatelessWidget {
  final List<Activity> sectionData;
  final DateTime headerTime;

  const ActivitySection({
    Key? key,
    required this.sectionData,
    required this.headerTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader(
      header: ActivityHeader(
        date: headerTime,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => ActivityCell(activity: sectionData[index]),
          childCount: sectionData.length,
        ),
      ),
    );
  }
}

class ActivityHeader extends StatelessWidget {
  const ActivityHeader({Key? key, required this.date}) : super(key: key);
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(Icons.calendar_month),
            Expanded(
              child: Text(
                " ${date.toStringFormat("dd/MM/yyyy")}",
                style: AppFonts.size15(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ActivityCell extends StatelessWidget {
  const ActivityCell({Key? key, required this.activity}) : super(key: key);
  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PAD_SYM_H12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SIZED_BOX_H12,
          Text(
            activity.time.toStringFormat("hh:mm:ss, dd/MM/yyyy"),
            style: AppFonts.size13(),
          ),
          SIZED_BOX_H08,
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4.0)),
              color: AppColors.grey.withOpacity(0.5),
            ),
            padding: PAD_SYM_H08_V06,
            child: Text(
              activity.action,
              style: AppFonts.size15(),
            ),
          )
        ],
      ),
    );
  }
}
