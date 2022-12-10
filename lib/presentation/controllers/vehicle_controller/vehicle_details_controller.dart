
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class VehicleDetailsController extends GetxController {
  var range=0.0.obs;
  var status=false.obs;
   List<ChartData> data=[
    ChartData('Mon', 12),
    ChartData('Tue', 15),
    ChartData('Wed', 30),
    ChartData('Thu', 6.4),
    ChartData('Fri', 14),
     ChartData('Sat', 7),
     ChartData('Sun', 17),
  ];
   TooltipBehavior tooltip=TooltipBehavior(enable: true);


}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
