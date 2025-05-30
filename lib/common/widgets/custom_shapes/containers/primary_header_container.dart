import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key,
    required this.child,
    this.height,
  });

  final Widget child;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child:  Container(
          color: TColors.primary,
          padding: const EdgeInsets.all(0),
          child: Stack(
            ///Background circular shapes
              children: [
                Positioned(
                    top: -150,
                    right: -250,
                    child: TCircularContainer(
                        height: height,
                        backgroundColor: TColors.textWhite.withOpacity(0.1)
                    )
                ),
                TCircularContainer(
                    height: height,
                    backgroundColor: TColors.textWhite.withOpacity(0.1)
                ),
                child
              ]
          )
      ),
    );
  }
}
