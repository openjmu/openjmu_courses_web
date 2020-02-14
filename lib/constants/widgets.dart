///
/// [Author] Alex (https://github.com/AlexVincent525)
/// [Date] 2020-02-14 11:30
///
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'constants.dart';

export 'package:openjmu_courses_web/widgets/confirmation_dialog.dart';

/// Constant widgets.
///
/// This section was declared for widgets that will be reuse in code.
/// Including [OpenJMULogo], [separator], [emptyDivider], [NoGlowScrollBehavior]

/// OpenJMU logo.
class OpenJMULogo extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const OpenJMULogo({
    Key key,
    this.width = 80.0,
    this.height,
    this.radius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular((radius)),
        child: Image.asset("images/logo_1024.png", width: width, height: height),
      ),
    );
  }
}

/// Common separator. Used in setting separate.
Widget separator(context, {Color color, double height}) => DecoratedBox(
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).canvasColor,
      ),
      child: SizedBox(height: (height ?? 8.0)),
    );

/// Empty divider. Used in widgets need empty placeholder.
Widget emptyDivider({double width, double height}) => SizedBox(
      width: width != null ? (width) : null,
      height: height != null ? (height) : null,
    );

/// SpinKit widget
class SpinKitWidget extends StatelessWidget {
  final Color color;
  final Duration duration;
  final double size;

  const SpinKitWidget({
    Key key,
    this.color,
    this.duration = const Duration(milliseconds: 1500),
    this.size = 50.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCube(
      color: color ?? currentThemeColor,
      duration: duration,
      size: (size),
    );
  }
}

class NoSplashFactory extends InteractiveInkFeatureFactory {
  const NoSplashFactory();

  @override
  InteractiveInkFeature create({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
    @required Offset position,
    @required Color color,
    @required TextDirection textDirection,
    bool containedInkWell = false,
    RectCallback rectCallback,
    BorderRadius borderRadius,
    ShapeBorder customBorder,
    double radius,
    VoidCallback onRemoved,
  }) {
    return NoSplash(
      controller: controller,
      referenceBox: referenceBox,
      color: color,
      onRemoved: onRemoved,
    );
  }
}

class NoSplash extends InteractiveInkFeature {
  NoSplash({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
    Color color,
    VoidCallback onRemoved,
  })  : assert(controller != null),
        assert(referenceBox != null),
        super(controller: controller, referenceBox: referenceBox, onRemoved: onRemoved) {
    controller.addInkFeature(this);
  }
  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}

class NoGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(_, Widget child, __) => child;
}
