import 'package:flutter/material.dart';

// based on: https://stackoverflow.com/questions/56005180/how-to-show-error-icon-inside-textfield-in-flutter
// based on: https://codewithandrea.com/articles/flutter-text-field-form-validation/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          button: TextStyle(color: Colors.white),
        ),
      ),
      home: const SubmitPage(),
    );
  }
}

class SubmitPage extends StatelessWidget {
  const SubmitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validation')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: TextSubmitWidget(onSubmit: (value) => print(value)),
        ), //
      ),
    );
  }
}

class TextSubmitWidget extends StatefulWidget {
  const TextSubmitWidget({Key? key, required this.onSubmit}) : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<TextSubmitWidget> createState() => _TextSubmitWidgetState();
}

class _TextSubmitWidgetState extends State<TextSubmitWidget> {
  final _controller = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorText {
    final text = _controller.value.text;
    if (text.isEmpty) {
      return 'Can\'t be empty';
    }
    if (text.length < 4) {
      return 'Too short';
    }
    return null;
  }

  void _submit() {
    setState(() => _submitted = true);
    if (_errorText == null) {
      widget.onSubmit(_controller.value.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      // Note: pass _controller to the animation argument
      valueListenable: _controller,
      builder: (context, TextEditingValue value, __) {
        // this entire widget tree will rebuild every time
        // the controller value changes
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 80,
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter your name',
                  // the errorText getter *depends* on _controller
                  errorText: _submitted ? _errorText : null,
                  suffixIcon: (_submitted && _errorText != null)
                      ? const Icon(
                          Icons.warning_outlined,
                          color: Colors.red,
                        )
                      : null,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                // the errorText getter *depends* on _controller
                onPressed: _controller.value.text.isNotEmpty ? _submit : null,
                child: Text(
                  'Submit',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
