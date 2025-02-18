import 'package:flutter/material.dart';

class MedicineListScreen extends StatelessWidget {
  final List<Map<String, String>> medicines = [
    {
      'name': 'Avastin 400mg Injection',
      'image': 'images/pill1.jpg',
      'manufacturer': 'Roche Products India Pvt Ltd',
    },
    {
      'name': 'Avastin 400mg Injection',
      'image': 'images/pill2.jpg',
      'manufacturer': 'Roche Products India Pvt Ltd',
    },
    {
      'name': 'Avastin 400mg Injection',
      'image': 'images/pill3.jpg',
      'manufacturer': 'Roche Products India Pvt Ltd',
    },
    {
      'name': 'Avastin 400mg Injection',
      'image': 'images/pill4.jpg',
      'manufacturer': 'Roche Products India Pvt Ltd',
    },
    {
      'name': 'Avastin 400mg Injection',
      'image': 'images/pill5.jpg',
      'manufacturer': 'Roche Products India Pvt Ltd',
    },
  ];

  MedicineListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine list'),
        backgroundColor: Colors.white,
        elevation: 0, // Loại bỏ bóng đổ dưới AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Thanh tìm kiếm được thiết kế lại với bo tròn
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(30),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    hintText: "Search...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  onTap: () {
                    showSearch(context: context, delegate: MedicineSearchDelegate());
                  },
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: medicines.length,
                itemBuilder: (context, index) {
                  final medicine = medicines[index];
                  return Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            medicine['image']!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            medicine['name']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Nhà sản xuất: ${medicine['manufacturer']}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MedicineSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> medicines = [
    {
      'name': 'Avastin 400mg Injection',
      'image': 'images/doctor1.jpg',
      'manufacturer': 'Roche Products India Pvt Ltd',
    },
    {
      'name': 'Avastin 400mg Injection',
      'image': 'images/doctor1.jpg',
      'manufacturer': 'Roche Products India Pvt Ltd',
    },
    {
      'name': 'Avastin 400mg Injection',
      'image': 'images/doctor1.jpg',
      'manufacturer': 'Roche Products India Pvt Ltd',
    },
    // Thêm các thuốc khác vào đây
  ];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Đóng khi nhấn vào mũi tên quay lại
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          close(context, null); // Đóng trang tìm kiếm khi nhấn vào "X"
        },
      ),
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = medicines
        .where((medicine) =>
        medicine['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final medicine = results[index];
        return ListTile(
          leading: Image.asset(medicine['image']!, width: 50, height: 50),
          title: Text(medicine['name']!),
          subtitle: Text(medicine['manufacturer']!),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = medicines
        .where((medicine) =>
        medicine['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final medicine = suggestions[index];
        return ListTile(
          leading: Image.asset(medicine['image']!, width: 50, height: 50),
          title: Text(medicine['name']!),
          subtitle: Text(medicine['manufacturer']!),
        );
      },
    );
  }
}
