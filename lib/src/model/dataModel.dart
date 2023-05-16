import 'package:syncfusion_flutter_xlsio/xlsio.dart';

class DataModel {
  final String name;
  final int row;
  final int col;
  final CellStyle cellStyle;
  final String sheet;

  DataModel(
      this.name,
      this.row,
      this.col,
      this.cellStyle,
      this.sheet,
      );
}