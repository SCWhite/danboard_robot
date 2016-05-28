# danboard_robot
An arduino project using processing+openCV to let the robot always look at people in front of him

就是這個小傢伙  
  
![alt tag](http://i.imgur.com/i2CU7Pk.jpg)

使用Arduino+processing(with openCV lib)  

用processing 的人臉偵測 算出人臉在螢幕上的座標  
然後傳送給Arduino 控制兩顆伺服馬達  
即可使機器人一直看向前方的人  

所以是:  
[Cam]----[PC]----[Arduino]-----[Servo]  
　　　　　|serial  
　　　[processing]    
　　　  
說穿了並不複雜XD  
  
測試影片在此(滑鼠控制)   
原理相同 只是換成人臉偵測  

[![Alt text for your video](http://img.youtube.com/vi/QwQDs6WpVa0/0.jpg)](https://youtu.be/QwQDs6WpVa0)  

有需要再放詳細資料吧    
(後來有想改用樹梅派做 不過懶了XD)   
(arduino 也不小心設錯邊界了XD)  
