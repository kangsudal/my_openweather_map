![image](https://user-images.githubusercontent.com/32862869/188173262-3c9794fd-d13a-482a-81a9-857c0615f733.png)
-geolocator로 현위치를 가져온다
-latitude, longitude, key->api->temp, id(weather condition code), description을 받아온다
-id에 따라 배경이 바뀌도록

문제점:
![image](https://user-images.githubusercontent.com/32862869/188175108-ce1d2813-b455-46a5-9c3e-cd651183abae.png)
첫 시작에서 fetchWeatherData 호출이 늦게된다. run을 다시하면  원하던 화면이나온다. initState에 넣어도 해결안되고, await는 initState에서 쓸 수 없다. runApp전에 쓰기엔 Provider context가 없어서 안된다.
