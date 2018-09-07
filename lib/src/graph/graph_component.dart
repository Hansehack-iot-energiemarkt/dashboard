import 'dart:async';
import 'dart:html';
import 'dart:math';
import 'dart:convert';

import 'package:angular/angular.dart';

import 'package:rikulo_highcharts/highcharts.dart';

@Component(
  selector: 'graph',
  styleUrls: ['graph_component.css'],
  templateUrl: 'graph_component.html',
  directives: [],
  providers: [],
)
class GraphComponent implements AfterContentInit {
  @ViewChild('theContainer')
  DivElement container;
  
  HighChart chart;
  ChartConfiguration chartConfig;

  static Random rnd = new Random();
  static JsonDecoder json = new JsonDecoder();

  static Function gen = () => rnd.nextInt(8) + rnd.nextInt(4);

  int i = 0;

  List<double> data;
  List<double> data2;

  @override
  ngAfterContentInit() {
    data = new List.generate(120, (_) => 0.0);
    data.last = rnd.nextDouble() * 8 + 4;
    data2 = new List.generate(120, (_) => 0.0);
    data2.last = data.last * 0.7 * rnd.nextDouble();

    chartConfig = new ChartConfiguration(
      chart: new ChartOptions(
        type: "areaspline",
      ),
      title: new ChartTitle(
        text: "",
      ),
      xAxis: new ChartXAxis(
        labels: new ChartLabels(
          enabled: false,
        ),
        tickLength: 0,
      ),
      yAxis: new ChartYAxis(
        title: new ChartTitle(
          text: "",
        ),
      ),
      credits: new ChartCredits(
        enabled: false,
      ),
      legend: new ChartLegend(
        enabled: false,
      ),
      series: <ChartDataSets>[
        new ChartDataSets(
          name: "",
          data: data,
          color: "#f58220",
          marker: new ChartMarker(
            enabled: false,
          ),
        ),
        new ChartDataSets(
          name: "",
          data: data2,
          color: "#4CAF50",
          marker: new ChartMarker(
            enabled: false,
          ),
        ),
      ],
    );

    chart = new HighChart(container, chartConfig);
    
    new Timer.periodic(new Duration(milliseconds: 500), (Timer t) {
      data.removeAt(0);
      data2.removeAt(0);
      double fact = rnd.nextDouble() * 0.4;
      data.add(data.last + (rnd.nextDouble() * data.last * fact) - data.last * fact/2);
      data2.add(data2.last + (rnd.nextDouble() * data2.last * fact) - data2.last * fact/2);
      chart.update(chartConfig, true);

      i++;
    });
  }
}