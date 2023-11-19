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
  bool loading = false;
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

  void _save(ProductData productData, int? index) {
    setState(() {
      loading = true;
    });
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      if (index == null) {
        productData
            .add(
          id: _formData['id'] as String,
          title: _formData['title'] as String,
          price: _formData['price'] as double,
          imgUrl: _formData['imgUrl'] as String,
          description: _formData['description'] as String,
        )
            .then((_) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('New product added'),
            duration: Duration(seconds: 1),
          ));
        }).catchError((_) {
          return showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  icon: const Icon(
                    Icons.error,
                  ),
                  title: const Text('Oops!'),
                  content: const Text('Something went wrong.Please ttry again'),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Ok'))
                  ],
                );
              }).then((_) {
            Navigator.of(context).pop();
          });
        });
      } else {
        productData.edit(
          index: index,
          id: _formData['id'] as String,
          title: _formData['title'] as String,
          price: _formData['price'] as double,
          imgUrl: _formData['imgUrl'] as String,
          description: _formData['description'] as String,
        );
      }
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
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    if (data['data'] != null) {
      _imgUrlController.text = data['data']['url'];
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(data['appBarTitle']),
        actions: [
          IconButton(
              onPressed: () => _save(productData, data['data']?['index']),
              icon: const Icon(Icons.check))
        ],
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: FocusScope(
                child: Form(
                  key: _form,
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: data['data']?['title'],
                        decoration: const InputDecoration(labelText: 'Title'),
                        textInputAction: TextInputAction.next,
                        validator: _validate,
                        onSaved: (val) {
                          _formData['title'] = val as String;
                        },
                      ),
                      TextFormField(
                        initialValue: data['data']?['price'].toString(),
                        decoration: const InputDecoration(labelText: 'Price'),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validator: _validate,
                        onSaved: (val) {
                          if (val != '') {
                            double modVal =
                                double.parse(val as String).toDouble();
                            _formData['price'] = modVal;
                          }
                        },
                      ),
                      TextFormField(
                        initialValue: data['data']?['description'],
                        decoration:
                            const InputDecoration(labelText: 'Description'),
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
                              decoration:
                                  const InputDecoration(labelText: 'Url'),
                              focusNode: _focus,
                              validator: _validate,
                              onSaved: (val) {
                                _formData['imgUrl'] = val as String;
                              },
                              onFieldSubmitted: (_) {
                                _save(productData, data['data']?['index']);
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
