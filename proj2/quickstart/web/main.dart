import 'dart:html';

void main() {

  final form = querySelector('#bmiForm') as FormElement;
  final weightInput = querySelector("#weight") as InputElement;
  final heightInput = querySelector("#height") as InputElement;
  final output = querySelector('#output') as ParagraphElement;

  form.onSubmit.listen((Event event) {
    event.preventDefault();

    final double? weight = double.tryParse(weightInput.value ?? '');
    final double? height = double.tryParse(heightInput.value ?? '');

    if (weight != null && height != null) {
      final double bmi = bmiCalc(weight, height);
      final formattedBMI = bmi.toStringAsFixed(2);
      output.text = 'BMI : $formattedBMI';
    } else {
      output.text = 'Invalid input';
    }
  });
}

double bmiCalc(double weight, double height) {
  height /= 100;
  height *= height;
  double bmi = weight / height;
  return bmi;
}
