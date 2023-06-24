import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/utils/widgets/text_widget.dart';
import 'package:timelines/timelines.dart';

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        constraints: BoxConstraints(minHeight: height * 1.5),
        // // margin: EdgeInsets.all(width * 0.1),
        height: height * 1.5,
        child: Timeline.tileBuilder(
          builder: TimelineTileBuilder.fromStyle(
            itemCount: 3,
            endConnectorStyle: ConnectorStyle.solidLine,
            contentsAlign: ContentsAlign.alternating,
            connectorStyle: ConnectorStyle.dashedLine,
            indicatorStyle: IndicatorStyle.outlined,
            contentsBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.1),
                color: lineColor,
                height: 20,
                child: Column(
                  children: [
                    textWidget(title: 'May 2023', size: 30),
                  ],
                ),
              )
                  .animate(
                    delay: Duration(seconds: 1 + index),
                  )
                  .fade();
            },
          ),
        ));
  }
}
