import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';


class PieChartAnimated extends StatelessWidget {
  final double size;
  final List<CircularChartItem> items;
  final int animationDuration;
  final bool isRadial;
  final String middleLabel;
  final bool edgeRounded;
  const PieChartAnimated({Key? key, required this.size, required this.items, this.animationDuration=300, this.isRadial=false, this.edgeRounded=false, this.middleLabel=''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedCircularChartState> _chartKey = new GlobalKey<AnimatedCircularChartState>();

    List<CircularStackEntry> data = <CircularStackEntry>[
      CircularStackEntry(
        List.generate(items.length, (index) => CircularSegmentEntry(items[index].value, items[index].color, rankKey: 'Q1')),
        rankKey: 'Quarterly Profits',
      ),
    ];
    return AnimatedCircularChart(
      duration: Duration(milliseconds: animationDuration),
      key: _chartKey,
      size: Size(size, size),
      initialChartData: data,
      chartType: isRadial? CircularChartType.Radial : CircularChartType.Pie,
      holeLabel: middleLabel,
      edgeStyle: edgeRounded? SegmentEdgeStyle.round : SegmentEdgeStyle.flat,
      labelStyle: TextStyle(
        color: Colors.blueGrey[600],
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
    );
  }
}



class CircularChartItem {
  final Color  color;
  final double value;

  const CircularChartItem({
    this.color=Colors.black,
    this.value=0,
  });
  factory CircularChartItem.fromData(CircularChartItem obj) {
    return CircularChartItem(
      color: obj.color,
      value: obj.value,
    );
  }
}