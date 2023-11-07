import 'package:flutter/material.dart';
import 'package:myshop/providers/products_providers.dart';
import 'package:provider/provider.dart';

class ModifyProductScreen extends StatefulWidget {
  static const routeName = '/modifyProductScreen';
  const ModifyProductScreen({super.key});

  @override
  State<ModifyProductScreen> createState() => _ModifyProductScreenState();
}

class _ModifyProductScreenState extends State<ModifyProductScreen> {
  final _imgUrlController = TextEditingController();
  final _focus = FocusNode();
  final _form = GlobalKey<FormState>();
  final _formData = {
    'id': DateTime.now().toString(),
    'title': 'test',
    'price': 0.0,
    'description': 'test',
    'imgUrl': 'test'
  };

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
    setState(() {});
  }

  void _save(ProductData productData) {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      productData.add(
        id: _formData['id'] as String,
        title: _formData['title'] as String,
        price: _formData['price'] as double,
        imgUrl: _formData['imgUrl'] as String,
        description: _formData['description'] as String,
      );
    }
  }

  String? _validate(String? val) {
    if (val == '') {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ProductData productData = Provider.of<ProductData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        actions: [
          IconButton(
              onPressed: () => _save(productData),
              icon: const Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FocusScope(
          child: Form(
            key: _form,
            child: ListView(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  validator: _validate,
                  onSaved: (val) {
                    _formData['title'] = val as String;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: _validate,
                  onSaved: (val) {
                    if (val != '') {
                      double modVal = double.parse(val as String).toDouble();
                      _formData['price;e'] = modVal;
                    }
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator: _validate,
                  onSaved: (val) {
                    _formData['description'] = val as String;
                  },
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
                        validator: _validate,
                        onSaved: (val) {
                          _formData['imgUrl'] = val as String;
                        },
                        onFieldSubmitted: (_) {
                          _save(productData);
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
