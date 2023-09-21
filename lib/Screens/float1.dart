import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

import 'classifier1.dart';

class ClassifierFloat1 extends Classifier1 {
  ClassifierFloat1({required int numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => 'quantized_pruned_model_allergy.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}
