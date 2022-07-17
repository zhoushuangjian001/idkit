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
    required this.itemBuilder,
    this.separatorBuilder,
    this.valueCall,
    this.multipleValuesCall,
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
    // grid
    this.gridDelegate,
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
  final ItemBuilder<K> itemBuilder;
  final ItemBuilder<K>? separatorBuilder;
  final Function(ChoiceState<K>)? valueCall;
  final Function(List<ChoiceState<K>>)? multipleValuesCall;
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
  // Grid
  final SliverGridDelegate? gridDelegate;

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
  void _handleReturnData() {
    final Iterable<ChoiceState<K>> iterable =
        widget.sources.where((element) => element.state == true);
    if (iterable.isNotEmpty) {
      if (widget.type == ChoiceType.single) {
        widget.valueCall?.call(iterable.last);
      } else {
        widget.multipleValuesCall?.call(iterable.toList());
      }
    }
  }

  // Handling click events.
  void _handleTapEvent(ChoiceState<K> model) {
    if (widget.type == ChoiceType.single) {
      if (model.state) {
        model.state = false;
      } else {
        for (var element in widget.sources) {
          element.state = false;
        }
        model.state = !model.state;
      }
    } else {
      final Iterable<ChoiceState<K>> iterable =
          widget.sources.where((element) => element.state == true);
      final int? count = widget.mMaxCount;
      if (count != null && iterable.isNotEmpty) {
        final int length = iterable.length;
        late bool isEqual = (length == count && model.state == false);
        if (length > count || isEqual) {
          throw 'The number of multiple selections cannot exceed the maximum limit.';
        }
      }
      model.state = !model.state;
    }
  }

  // Data callback processing
  void dataCallBackProcess(ChoiceState<K> data) {
    if (mounted) {
      _handleTapEvent(data);
      _handleReturnData();
      setState(() {});
    }
  }

  @override
  void initState() {
    _handleReturnData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Widget child = Container();
    switch (widget.sort) {
      case ChoiceSort.list:
        child = ListView.builder(
          key: widget.key,
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
              child: widget.itemBuilder(context, data),
              onTap: () => dataCallBackProcess(data),
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
          key: widget.key,
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
              child: widget.itemBuilder(context, data),
              onTap: () => dataCallBackProcess(data),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            final ChoiceState<K> data = widget.sources[index];
            return widget.separatorBuilder?.call(context, data) ??
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
        child = GridView.builder(
          key: widget.key,
          scrollDirection: widget.scrollDirection,
          reverse: widget.reverse,
          controller: widget.controller,
          primary: widget.primary,
          physics: widget.physics,
          shrinkWrap: widget.shrinkWrap,
          padding: widget.padding,
          gridDelegate: widget.gridDelegate ??
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            final ChoiceState<K> data = widget.sources[index];
            return InkWell(
              child: widget.itemBuilder(context, data),
              onTap: () => dataCallBackProcess(data),
            );
          },
          findChildIndexCallback: widget.findChildIndexCallback,
          itemCount: widget.sources.length,
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
      case ChoiceSort.warp:
        child = Wrap(
          key: widget.key,
          direction: widget.direction,
          alignment: widget.alignment,
          spacing: widget.spacing,
          runAlignment: widget.runAlignment,
          runSpacing: widget.runSpacing,
          crossAxisAlignment: widget.crossAxisAlignment,
          textDirection: widget.textDirection,
          verticalDirection: widget.verticalDirection,
          clipBehavior: widget.clipBehavior,
          children: widget.sources.map((data) {
            return InkWell(
              child: widget.itemBuilder.call(context, data),
              onTap: () => dataCallBackProcess(data),
            );
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
