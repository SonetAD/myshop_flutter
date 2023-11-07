import 'package:flutter/material.dart';

class ModifyProductScreen extends StatefulWidget {
  static const routeName = '/modifyProductScreen';
  const ModifyProductScreen({super.key});

  @override
  State<ModifyProductScreen> createState() => _ModifyProductScreenState();
}

class _ModifyProductScreenState extends State<ModifyProductScreen> {
  final _imgUrlController = TextEditingController();
  final _focus = FocusNode();

  @override
  void initState() {
    super.initState();
    _focus.addListener(handleFocus);
  }

  @override
  void dispose() {
    super.dispose();
    _imgUrlController.dispose();
    _focus.removeListener(handleFocus);
    _focus.dispose();
  }

  void handleFocus() {
    if (!_focus.hasFocus) {
      setState(() {});
    }
  }

  void _save() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [IconButton(onPressed: _save, icon: const Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FocusScope(
          child: Form(
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.red),
                      ),
                      child: _imgUrlController.text.isEmpty
                          ? const Text('Enter Url')
                          : FittedBox(
                              child: Image.network(
                                _imgUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.url,
                        controller: _imgUrlController,
                        textInputAction: TextInputAction.done,
                        decoration: const InputDecoration(labelText: 'Url'),
                        focusNode: _focus,
                        onFieldSubmitted: (_) {
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
