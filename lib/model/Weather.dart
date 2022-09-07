class Weather {
  double temp;
  int id; //Weather condition codes https://openweathermap.org/weather-conditions#Icon-list
  String backgroundImg;
  String description;

  Weather({
    required this.temp,
    required this.id,
    required this.backgroundImg,
    required this.description,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    double temp = json['main']['temp'];
    int id = json['weather'][0]["id"];
    String description = json['weather'][0]["description"];
    String backgroundImg='';
    if(id >=0 && id<300){
      backgroundImg = 'images/Thunderstorm.jpg';
    }else if(id >=300 && id <500){
      backgroundImg = 'images/Drizzle.jpg';
    }else if(id>=500 && id<600){
      backgroundImg = 'images/Rain.jpg';
    }else if(id>=600 && id<700){
      backgroundImg = 'images/Atmosphere.jpg';
    }else if(id==800){
      backgroundImg = "images/Clear.jpg";
    }else{
      if(id ==801)
        backgroundImg = "images/Cloud.jpg";
      if(id == 802)
        backgroundImg = 'images/Cloud_scattered.jpg';
      if(id == 803)
        backgroundImg = 'images/Cloud_broken.jpg';
      if(id == 804)
        backgroundImg = 'images/Cloud_overcast.jpg';
    }
    // print("temp:$temp, id:$id, backgroundImg:$backgroundImg, description:$description");
    return Weather(
      temp: temp,
      id: id,
      backgroundImg: backgroundImg,
      description: description,
    );
  }
  @override
  String toString() {
    return 'Weather{temp: $temp, id: $id, backgroundImg: $backgroundImg, description: $description}';
  }
}

class Forecast{
  int dt;
  String icon;
  double temp;
  Forecast({required this.dt, required this.icon, required this.temp});

  factory Forecast.fromJson(Map<String,dynamic> json,int idx){
    int dt;
    String icon;
    double temp;

    dt = json['list'][idx]['dt'];
    icon = "https://openweathermap.org/img/wn/${json['list'][idx]['weather'][0]['icon']}@2x.png";
    temp = json['list'][idx]['main']['temp'];
    // print(icon);
    return Forecast(dt: dt, icon: icon, temp: temp);
  }

  @override
  String toString() {
    return 'Forecast{dt: $dt, icon: $icon, temp: $temp}';
  }
}