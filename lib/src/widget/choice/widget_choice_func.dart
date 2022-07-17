import 'package:flutter/material.dart';
import 'package:idkit/idkit.dart';

typedef ItemBuilder<T extends Object> = Widget Function(
    BuildContext context, ChoiceState<T> data);
