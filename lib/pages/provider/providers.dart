import 'package:example/pages/provider/counter.dart';
import 'package:example/pages/provider/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildStatelessWidget> providers = [
  ChangeNotifierProvider<ThemeModel>(
    create: (_){
      return ThemeModel(ThemeType.light);
    },
  ),

  ChangeNotifierProvider<Counter>(
    create: (_){
      return Counter();
    },
  ),
];