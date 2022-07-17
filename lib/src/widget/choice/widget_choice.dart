import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:idkit/src/widget/choice/widget_choice_func.dart';
import 'package:idkit/src/widget/choice/widget_choice_init.dart';

/// Widget to select function.
class IDKitChoice<K extends Object> extends ChoiceWidget<K> {
  const IDKitChoice.list({
    Key? key,
    ChoiceType type = ChoiceType.single,
    required List<ChoiceState<K>> sources,
    required ItemBuilder<K> itemBuilder,
    int? mMaxCount,
    Function(ChoiceState<K>)? valueCall,
    Function(List<ChoiceState<K>>)? multipleValueCall,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? Function(Key)? findChildIndexCallback,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  })  : assert(type != ChoiceType.multiple || valueCall == null,
            '\n---- Wrong Reason ----\nThe current selection type is multiple selection, please use the function `multipleValueCall` \n---- End ----\n'),
        assert(type != ChoiceType.single || multipleValueCall == null,
            '\n---- Wrong Reason ----\nThe current selection type is single selection, please use the function `valueCall` \n---- End ----\n'),
        super(
          key: key,
          sort: ChoiceSort.list,
          type: type,
          sources: sources,
          itemBuilder: itemBuilder,
          mMaxCount: mMaxCount,
          valueCall: valueCall,
          multipleValuesCall: multipleValueCall,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          itemExtent: itemExtent,
          prototypeItem: prototypeItem,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          findChildIndexCallback: findChildIndexCallback,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        );

  const IDKitChoice.listSeparated({
    Key? key,
    ChoiceType type = ChoiceType.single,
    required List<ChoiceState<K>> sources,
    required ItemBuilder<K> itemBuilder,
    required ItemBuilder<K> separatorBuilder,
    int? mMaxCount,
    Function(ChoiceState<K>)? valueCall,
    Function(List<ChoiceState<K>>)? multipleValueCall,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    bool addAutomaticKeepAlives = true,
    bool addRepaintBoundaries = true,
    bool addSemanticIndexes = true,
    double? cacheExtent,
    int? Function(Key)? findChildIndexCallback,
    int? semanticChildCount,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
    String? restorationId,
    Clip clipBehavior = Clip.hardEdge,
  })  : assert(type != ChoiceType.multiple || valueCall == null,
            '\n---- Wrong Reason ----\nThe current selection type is multiple selection, please use the function `multipleValueCall` \n---- End ----\n'),
        assert(type != ChoiceType.single || multipleValueCall == null,
            '\n---- Wrong Reason ----\nThe current selection type is single selection, please use the function `valueCall` \n---- End ----\n'),
        super(
          key: key,
          sort: ChoiceSort.separated,
          type: type,
          sources: sources,
          itemBuilder: itemBuilder,
          separatorBuilder: separatorBuilder,
          mMaxCount: mMaxCount,
          valueCall: valueCall,
          multipleValuesCall: multipleValueCall,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
          addSemanticIndexes: addSemanticIndexes,
          cacheExtent: cacheExtent,
          findChildIndexCallback: findChildIndexCallback,
          semanticChildCount: semanticChildCount,
          dragStartBehavior: dragStartBehavior,
          keyboardDismissBehavior: keyboardDismissBehavior,
          restorationId: restorationId,
          clipBehavior: clipBehavior,
        );

  // const IDKitChoice.grid({
  //   Key? key,
  //   ChoiceType type = ChoiceType.single,
  // }) : super(
  //         key: key,
  //         sort: ChoiceSort.grid,
  //         type: type,
  //       );

  const IDKitChoice.warp({
    Key? key,
    ChoiceType type = ChoiceType.single,
    required List<ChoiceState<K>> sources,
    required ItemBuilder<K> itemBuilder,
    int? mMaxCount,
    Function(ChoiceState<K>)? valueCall,
    Function(List<ChoiceState<K>>)? multipleValueCall,
    Axis direction = Axis.horizontal,
    WrapAlignment alignment = WrapAlignment.start,
    double spacing = 0.0,
    WrapAlignment runAlignment = WrapAlignment.start,
    double runSpacing = 0.0,
    WrapCrossAlignment crossAxisAlignment = WrapCrossAlignment.start,
    TextDirection? textDirection,
    VerticalDirection verticalDirection = VerticalDirection.down,
  })  : assert(type != ChoiceType.multiple || valueCall == null,
            '\n---- Wrong Reason ----\nThe current selection type is multiple selection, please use the function `multipleValueCall` \n---- End ----\n'),
        assert(type != ChoiceType.single || multipleValueCall == null,
            '\n---- Wrong Reason ----\nThe current selection type is single selection, please use the function `valueCall` \n---- End ----\n'),
        super(
          key: key,
          sort: ChoiceSort.warp,
          type: type,
          sources: sources,
          itemBuilder: itemBuilder,
          mMaxCount: mMaxCount,
          valueCall: valueCall,
          multipleValuesCall: multipleValueCall,
          direction: direction,
          alignment: alignment,
          spacing: spacing,
          runAlignment: runAlignment,
          runSpacing: runSpacing,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
        );
}

/// Choice Type
enum ChoiceType {
  single,
  multiple,
}

/// Records the widget's state class.

class ChoiceState<S extends Object> {
  ChoiceState({
    this.state = false,
    this.data,
  });

  /// The state of the widget.
  bool state;

  /// Data carried by the class.
  final S? data;
}
