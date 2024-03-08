

class ProductModel {
  String? name;
  String? categoryName;
  String? uId;
  String? id;
  String ?salary;


  ProductModel({this.name, this.categoryName, this.id, this.uId,this.salary
  });

  ProductModel.fromJson(Map<String, dynamic>? json) {
    categoryName = json!['categoryName'] ?? '';
    name = json!['name']?? '';

    uId = json!['userId']?? '';
    salary = json!['salary']?? '';


    id = json!['_id']?? '';

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'categoryName': categoryName,

      '_id':id,
      'salary':salary,


      'userId': uId,
    };
  }
}
