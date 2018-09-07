import 'dart:async';
import 'dart:html';
import 'dart:math';

import 'package:angular/angular.dart';

import 'package:rikulo_highcharts/highcharts.dart';

@Component(
  selector: 'graph',
  styleUrls: ['graph_component.css'],
  templateUrl: 'graph_component.html',
  directives: [],
  providers: [],
)
class GraphComponent implements AfterContentInit, AfterViewInit {
  @ViewChild('theContainer')
  ElementRef container;

  DivElement containerElement;
  
  HighChart chart;
  ChartConfiguration chartConfig;

  static Random rnd = new Random();

  static Function gen = () => rnd.nextInt(8) + rnd.nextInt(4);

  List<int> data = new List.generate(24, (_) => gen());

  @override
  ngAfterContentInit() {
    containerElement = container.nativeElement;
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
      ],
    );
  }

  @override
  ngAfterViewInit() {
    chart = new HighChart(containerElement, chartConfig);
    
    new Timer.periodic(new Duration(seconds: 1), (Timer t) {
      data.removeAt(0);
      data.add(gen());
      chart.reflow();
      chart.update(chartConfig, true);
    });
  }
}