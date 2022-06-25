import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:idkit/src/widget/choice/widget_choice.dart';
import 'package:idkit/src/widget/choice/widget_choice_func.dart';

class ChoiceWidget<K extends Object> extends StatefulWidget {
  const ChoiceWidget({
    Key? key,
    this.type = ChoiceType.single,
    // list
    this.scrollDirection = Axis.vertical,
    required this.sources,
    required this.sort,
    this.itemBuilder,
    this.separatorBuilder,
    this.valuesCall,
    this.mMaxCount,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding,
    this.itemExtent,
    this.prototypeItem,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.findChildIndexCallback,
    // warp
    this.direction = Axis.horizontal,
    this.alignment = WrapAlignment.start,
    this.spacing = 0.0,
    this.runAlignment = WrapAlignment.start,
    this.runSpacing = 0.0,
    this.crossAxisAlignment = WrapCrossAlignment.start,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  final ChoiceType type;
  final ChoiceSort sort;
  final int? mMaxCount;
  final List<ChoiceState<K>> sources;
  final ItemBuilder<K>? itemBuilder;
  final ItemBuilder<K>? separatorBuilder;
  final Function(Iterable<ChoiceState<K>>)? valuesCall;
  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final double? itemExtent;
  final Widget? prototypeItem;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? Function(Key)? findChildIndexCallback;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;

  // warp
  final Axis direction;
  final WrapAlignment alignment;
  final double spacing;
  final WrapAlignment runAlignment;
  final double runSpacing;
  final WrapCrossAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;

  // common
  final Clip clipBehavior;

  @override
  State<ChoiceWidget<K>> createState() => _ChoiceWidgetState<K>();
}

class _ChoiceWidgetState<K extends Object> extends State<ChoiceWidget<K>> {
  // Back to data processing.
  void _handleBackData() {
    final Iterable<ChoiceState<K>> iterable =
        widget.sources.where((element) => element.state);
    if (iterable.isNotEmpty) {
      widget.valuesCall?.call(iterable);
    }
  }

  // Handling click events.
  void _handleTapEvent(ChoiceState<K> model) {
    if (widget.type == ChoiceType.single) {
      for (var element in widget.sources) {
        element.state = false;
      }
    } else {
      final Iterable<ChoiceState<K>> iterable =
          widget.sources.where((element) => element.state);
      final int? count = widget.mMaxCount;
      if (count != null) {
        if (iterable.length >= count) {
          throw 'The number of multiple selections cannot exceed the maximum limit.';
        }
      }
    }
    model.state = !model.state;
  }

  @override
  void initState() {
    _handleBackData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Widget child = Container();
    switch (widget.sort) {
      case ChoiceSort.list:
        child = ListView.builder(
          scrollDirection: widget.scrollDirection,
          reverse: widget.reverse,
          controller: widget.controller,
          primary: widget.primary,
          physics: widget.physics,
          shrinkWrap: widget.shrinkWrap,
          padding: widget.padding,
          itemExtent: widget.itemExtent,
          prototypeItem: widget.prototypeItem,
          itemBuilder: (context, index) {
            final ChoiceState<K> data = widget.sources[index];
            return InkWell(
              child: widget.itemBuilder!(context, data, index),
              onTap: () {
                _handleTapEvent(data);
                if (mounted) {
                  setState(() {
                    _handleBackData();
                  });
                }
              },
            );
          },
          itemCount: widget.sources.length,
          findChildIndexCallback: widget.findChildIndexCallback,
          addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
          addRepaintBoundaries: widget.addRepaintBoundaries,
          addSemanticIndexes: widget.addSemanticIndexes,
          cacheExtent: widget.cacheExtent,
          semanticChildCount: widget.semanticChildCount,
          dragStartBehavior: widget.dragStartBehavior,
          keyboardDismissBehavior: widget.keyboardDismissBehavior,
          restorationId: widget.restorationId,
          clipBehavior: widget.clipBehavior,
        );
        break;
      case ChoiceSort.separated:
        child = ListView.separated(
          scrollDirection: widget.scrollDirection,
          reverse: widget.reverse,
          controller: widget.controller,
          primary: widget.primary,
          physics: widget.physics,
          shrinkWrap: widget.shrinkWrap,
          padding: widget.padding,
          itemBuilder: (context, index) {
            final ChoiceState<K> data = widget.sources[index];
            return InkWell(
              child: widget.itemBuilder!(context, data, index),
              onTap: () {
                _handleTapEvent(data);
                if (mounted) {
                  setState(() {
                    _handleBackData();
                  });
                }
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            final ChoiceState<K> data = widget.sources[index];
            return widget.separatorBuilder?.call(context, data, index) ??
                const Divider();
          },
          itemCount: widget.sources.length,
          findChildIndexCallback: widget.findChildIndexCallback,
          addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
          addRepaintBoundaries: widget.addRepaintBoundaries,
          addSemanticIndexes: widget.addSemanticIndexes,
          cacheExtent: widget.cacheExtent,
          dragStartBehavior: widget.dragStartBehavior,
          keyboardDismissBehavior: widget.keyboardDismissBehavior,
          restorationId: widget.restorationId,
          clipBehavior: widget.clipBehavior,
        );
        break;
      case ChoiceSort.grid:
        child = GridView.count(
          crossAxisCount: 2,
          children: [],
        );
        break;
      case ChoiceSort.warp:
        child = Wrap(
          direction: widget.direction,
          alignment: widget.alignment,
          spacing: widget.spacing,
          runAlignment: widget.runAlignment,
          runSpacing: widget.runSpacing,
          crossAxisAlignment: widget.crossAxisAlignment,
          textDirection: widget.textDirection,
          verticalDirection: widget.verticalDirection,
          clipBehavior: widget.clipBehavior,
          children: widget.sources.map((e) {
            final index = widget.sources.indexOf(e);
            return widget.itemBuilder!.call(context, e, index);
          }).toList(),
        );
        break;
    }
    return child;
  }
}

/// Choose sort of widget
enum ChoiceSort {
  list,
  separated,
  grid,
  warp,
}