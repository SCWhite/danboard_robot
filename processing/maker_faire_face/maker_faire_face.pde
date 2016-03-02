import processing.serial.*;

import org.firmata.*;
import cc.arduino.*;

import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;
Serial port;

void setup() {
  size(640, 640);
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 19200);
  video.start();
}

void draw() {
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 0, 255);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    port.write("s"+faces[0].x); 
    port.write("e"+faces[0].y); 
  }
   /*
    println(faces[1].x + "," + faces[1].y);
    rect(faces[1].x, faces[1].y, faces[1].width, faces[1].height);
    port.write("s"+faces[1].x); 
  */
}

void captureEvent(Capture c) {
  c.read();
}

