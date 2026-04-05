import 'package:flutter/widgets.dart';
import 'package:flutter_commons/utils/enums/display_target.dart';

extension ContextDisplayTargetExtension on BuildContext {
  DisplayTarget get displayTarget {
    final width = MediaQuery.sizeOf(this).width;
    return DisplayTarget.init(width: width);
  }
}
