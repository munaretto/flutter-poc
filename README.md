# Flutter POC
This project was created as a playground for experimentation in a Flutter/Dart environment, using [this tutorial](https://codelabs.developers.google.com/codelabs/flutter-app-testing#0) as reference. The topics covered by this repo are:

* Tests
    * Unit tests
    * Widget tests
    * Integration tests
* State management
    * Bloc vs Redux

## How to get the project running
1. Clone this repo by typing ```git clone https://github.com/munaretto/flutter-poc.git``` or ```git clone git@github.com:munaretto/flutter-poc.git``` on your terminal and pressing enter
2. If necessary, download project dependencies with ```flutter pub get``` being at the project root
3. Run the project using your IDE or by typing ```flutter run```.
4. For running both unit and widget tests, use the command ```flutter test```. For integration tests, use ```flutter drive --driver integration_test/driver.dart --target integration_test/app_test.dart```
