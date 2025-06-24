import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String userId = 'user123';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkout',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF2EDD7),
        primaryColor: Color(0xFF755139),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF755139),
            foregroundColor: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(),
        ),
      ),
      home: CheckoutPage(userId: userId),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  final String userId;
  const CheckoutPage({super.key, required this.userId});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic>? selectedAddress;
  String _selectedPayment = 'Cash on Delivery';

  List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Shoes',
      'price': 2999,
      'quantity': 1,
      'image': 'asset/images/nike.jpg',
    },
  ];

  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);

  Future<void> submitOrder() async {
    final response = await http.post(
      Uri.parse('http://192.168.2.128:3000/checkout'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'items': cartItems,
        'address': selectedAddress,
        'total': totalAmount,
        'userId': widget.userId,
        'paymentMethod': _selectedPayment,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('✅ Order placed successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('❌ Order failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedAddress = selectedAddress == null
        ? ''
        : '${selectedAddress!['street']}, ${selectedAddress!['city']}, ${selectedAddress!['state']} - ${selectedAddress!['pincode']}, ${selectedAddress!['country']}\nLandmark: ${selectedAddress!['landmark']}\nMobile: ${selectedAddress!['mobile']}';

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Your Items", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ...cartItems.map((item) => Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade400),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item['image'],
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 4),
                          Text('Qty: ${item['quantity']}'),
                          SizedBox(height: 4),
                          Text(
                            '₹${item['price'] * item['quantity']}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),


              Divider(),
              Text("Shipping Address", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddressPage(userId: widget.userId)),
                  );
                  if (result != null) {
                    setState(() => selectedAddress = result);
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                   border: Border.all(color: Colors.grey.shade400),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on, color: Theme.of(context).primaryColor),
                      SizedBox(width: 12),
                      Expanded(
                        child: selectedAddress == null
                            ? Text(
                          "Tap to select shipping address",
                          style: TextStyle(color: Colors.grey.shade600),
                        )
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${selectedAddress!['street']}, ${selectedAddress!['city']}, ${selectedAddress!['state']} - ${selectedAddress!['pincode']}, ${selectedAddress!['country']}",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "Landmark: ${selectedAddress!['landmark']}",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                            Text(
                              "Mobile: ${selectedAddress!['mobile']}",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.edit_location_alt, color: Theme.of(context).primaryColor),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 6),
              if (selectedAddress == null)
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 4),
                  child: Text(
                    'Please select an address',
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              SizedBox(height: 20),
              Text("Select Payment Method", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              RadioListTile<String>(
                title: Text("Cash on Delivery"),
                value: 'Cash on Delivery',
                groupValue: _selectedPayment,
                onChanged: (value) {
                  setState(() => _selectedPayment = value!);
                },
              ),
              RadioListTile<String>(
                title: Text("Razor Pay"),
                value: 'Razor Pay',
                groupValue: _selectedPayment,
                onChanged: (value) {
                  setState(() => _selectedPayment = value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.shopping_cart_checkout),
                label: Text("Place Order"),
                onPressed: () {
                  if (_formKey.currentState!.validate()) submitOrder();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddressPage extends StatefulWidget {
  final String userId;
  const AddressPage({super.key, required this.userId});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<Map<String, dynamic>> addresses = [];
  bool isLoading = true;
  final GlobalKey<FormState> _editFormKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();
  final _street = TextEditingController();
  final _city = TextEditingController();
  final _landmark = TextEditingController();
  final _pincode = TextEditingController();
  final _state = TextEditingController();
  final _country = TextEditingController();
  final _mobile = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchAddresses();
  }

  Future<void> fetchAddresses() async {
    try {
      final res = await http.get(Uri.parse('http://192.168.2.128:3000/add/${widget.userId}'));
      if (res.statusCode == 200) {
        final List data = json.decode(res.body);
        setState(() {
          addresses = data.cast<Map<String, dynamic>>();
          isLoading = false;
        });
      }
    } catch (e) {
      print("Fetch Error: $e");
      setState(() => isLoading = false);
    }
  }

  Future<void> addAddress() async {
    if (!_formKey.currentState!.validate()) return;
    final newAddress = {
      "userId": widget.userId,
      "street": _street.text,
      "city": _city.text,
      "landmark": _landmark.text,
      "pincode": _pincode.text,
      "state": _state.text,
      "country": _country.text,
      "mobile": _mobile.text,
    };
    try {
      final res = await http.post(
        Uri.parse('http://192.168.2.128:3000/add'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(newAddress),
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        clearForm();
        fetchAddresses();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("✅ Address added")));
      }
    } catch (e) {
      print("Add Error: $e");
    }
  }

  void clearForm() {
    _street.clear();
    _city.clear();
    _landmark.clear();
    _pincode.clear();
    _state.clear();
    _country.clear();
    _mobile.clear();
  }

  Future<void> deleteAddress(String id) async {
    try {
      final res = await http.delete(Uri.parse('http://192.168.2.128:3000/add/$id'));
      if (res.statusCode == 200) fetchAddresses();
    } catch (e) {
      print("Delete Error: $e");
    }
  }

  // void showEditDialog(Map<String, dynamic> addr) {
  //   _street.text = addr['street'];
  //   _city.text = addr['city'];
  //   _landmark.text = addr['landmark'];
  //   _pincode.text = addr['pincode'];
  //   _state.text = addr['state'];
  //   _country.text = addr['country'];
  //   _mobile.text = addr['mobile'];
  //
  //   showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: Text("Edit Address"),
  //       content: SingleChildScrollView(
  //         child: Form(
  //           key: _formKey,
  //           child: Column(
  //             children: [
  //               buildTextField(_street, "Street"),
  //               buildTextField(_city, "City"),
  //               buildTextField(_landmark, "Landmark"),
  //               buildTextField(_pincode, "Pincode", isNumber: true, validator: (v) => v!.length != 6 ? "Enter 6-digit Pincode" : null),
  //               buildTextField(_state, "State"),
  //               buildTextField(_country, "Country"),
  //               buildTextField(_mobile, "Mobile", isNumber: true, validator: (v) => v!.length != 10 ? "Enter 10-digit Mobile" : null),
  //             ],
  //           ),
  //         ),
  //       ),
  //       actions: [
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: Text("Cancel"),
  //         ),
  //         ElevatedButton(
  //           onPressed: () async {
  //             if (!_formKey.currentState!.validate()) return;
  //             final updated = {
  //               "street": _street.text,
  //               "city": _city.text,
  //               "landmark": _landmark.text,
  //               "pincode": _pincode.text,
  //               "state": _state.text,
  //               "country": _country.text,
  //               "mobile": _mobile.text,
  //             };
  //             final res = await http.put(
  //               Uri.parse('http://192.168.2.128:3000/add/${addr['_id']}'),
  //               headers: {'Content-Type': 'application/json'},
  //               body: jsonEncode(updated),
  //             );
  //             if (res.statusCode == 200) {
  //               Navigator.pop(context);
  //               fetchAddresses();
  //             }
  //           },
  //           child: Text("Save"),
  //         )
  //       ],
  //     ),
  //   );
  // }
  void showEditDialog(Map<String, dynamic> addr) {
    _street.text = addr['street'];
    _city.text = addr['city'];
    _landmark.text = addr['landmark'];
    _pincode.text = addr['pincode'];
    _state.text = addr['state'];
    _country.text = addr['country'];
    _mobile.text = addr['mobile'];

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Edit Address"),
        content: Form(
          key: _editFormKey,  // Use separate form key
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _street,
                  decoration: InputDecoration(labelText: "Street"),
                  validator: (v) => v!.isEmpty ? "Required" : null,
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _city,
                  decoration: InputDecoration(labelText: "City"),
                  validator: (v) => v!.isEmpty ? "Required" : null,
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _landmark,
                  decoration: InputDecoration(labelText: "Landmark"),
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _pincode,
                  decoration: InputDecoration(labelText: "Pincode"),
                  keyboardType: TextInputType.number,
                  validator: (v) => v!.length != 6 ? "Enter valid 6-digit Pincode" : null,
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _state,
                  decoration: InputDecoration(labelText: "State"),
                  validator: (v) => v!.isEmpty ? "Required" : null,
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _country,
                  decoration: InputDecoration(labelText: "Country"),
                  validator: (v) => v!.isEmpty ? "Required" : null,
                ),
                SizedBox(height: 8),
                TextFormField(
                  controller: _mobile,
                  decoration: InputDecoration(labelText: "Mobile"),
                  keyboardType: TextInputType.phone,
                  validator: (v) => v!.length != 10 ? "Enter valid 10-digit Mobile" : null,
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (!_editFormKey.currentState!.validate()) return;

              final updated = {
                "street": _street.text,
                "city": _city.text,
                "landmark": _landmark.text,
                "pincode": _pincode.text,
                "state": _state.text,
                "country": _country.text,
                "mobile": _mobile.text,
              };

              final res = await http.put(
                Uri.parse('http://localhost:3000/add/${addr['_id']}'),
                headers: {'Content-Type': 'application/json'},
                body: jsonEncode(updated),
              );

              if (res.statusCode == 200) {
                Navigator.pop(context);
                fetchAddresses();
              }
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label,
      {bool isNumber = false, String? Function(String?)? validator}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        validator: validator ?? (v) => v!.isEmpty ? 'Required' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2EDD7),
      appBar: AppBar(
        title: Text("Manage Addresses"),
        backgroundColor: Color(0xFF755139),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    buildTextField(_street, "Street"),
                    buildTextField(_city, "City"),
                    buildTextField(_landmark, "Landmark"),
                    buildTextField(_pincode, "Pincode", isNumber: true, validator: (v) => v!.length != 6 ? "Enter valid 6-digit Pincode" : null),
                    buildTextField(_state, "State"),
                    buildTextField(_country, "Country"),
                    buildTextField(_mobile, "Mobile", isNumber: true, validator: (v) => v!.length != 10 ? "Enter valid 10-digit Mobile" : null),
                    SizedBox(height: 12),
                    ElevatedButton.icon(
                      icon: Icon(Icons.add_location_alt),
                      label: Text("Add Address"),
                      onPressed: addAddress,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF755139),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : addresses.isEmpty
                ? Center(child: Text("No addresses found."))
                : ListView.builder(
              itemCount: addresses.length,
              itemBuilder: (context, index) {
                final addr = addresses[index];
                return Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(12),
                    title: Text('${addr['street']}, ${addr['city']}',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Text('Pincode: ${addr['pincode']}'),
                        Text('Mobile: ${addr['mobile']}'),
                      ],
                    ),
                    trailing: Wrap(
                      spacing: 4,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => showEditDialog(addr),
                          tooltip: "Edit",
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteAddress(addr['_id']),
                          tooltip: "Delete",
                        ),
                        IconButton(
                          icon: Icon(Icons.check_circle, color: Color(0xFF755139)),
                          onPressed: () => Navigator.pop(context, addr),
                          tooltip: "Select",
                        ),
                      ],
                    ),

                  ),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
