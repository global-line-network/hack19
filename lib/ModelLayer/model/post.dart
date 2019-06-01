class Post {
  final String name;
  final String companyName;
  final String city;
  final String industry;
  final double salary;
  final String currency;
  final String description;
  final String image;

  Post(
      {this.name,
      this.companyName,
      this.city,
      this.industry,
      this.salary,
      this.currency,
      this.description,
      this.image});

  Map<String, dynamic> toJson() => {
        'name': name,
        'companyName': companyName,
        'city': city,
        'industry': industry,
        'salary': salary,
        'currency': currency,
        'description': description,
        'image': image
      };

  Post.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        companyName = json["companyName"],
        city = json["city"],
        industry = json["industry"],
        salary = json["salary"],
        currency = json["currency"],
        description = json["description"],
        image = json["image"];
}
