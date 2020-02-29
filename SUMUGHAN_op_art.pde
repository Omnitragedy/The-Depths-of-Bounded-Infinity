
float rMax;
float subdivs = 40;

float centerX;
float centerY;

float rStep = .75;
float tStep = TAU / 200;
void setup() {
  //size(400, 400);
  fullScreen();


  rMax = sqrt(width*width + height*height);
  centerX = width / 2;
  centerY = height / 2;
  noFill();
}

void draw() {
  background(255);
  for (float r = 0; r < rMax; r += rStep) {
    for (float t = 0; (t < TAU && tStep > 0) || (t > - TAU && tStep < 0); t += tStep) {
      if ( (r / (rMax / subdivs)) % 2 < 1 ) {  //checks if currently within an odd or even subdivision (if final modulo is less than 1, then within even subdivision, else within odd)
        tStep = abs(tStep);
      } else {
        tStep = -abs(tStep);
      }
      
      if ((t / tStep) % 2 < .99999) {    //alterate between black and white between segments
        stroke(255);
      } else {
        stroke(0);
      }
      
      if (tStep > 0) {    //ensures that the parabolic regions are drawn using proper parameters (lower angle measure passed before the upper angle measure)
        arc(centerX, centerY, r, pow(r, 1.4), t, t + tStep);  //exponent creates interrupted distorted elliptical shape
      } else {
        arc(centerX, centerY, r, pow(r, 1.4), t + tStep, t);
      }
    }
  }
  
  //subdivs++;
}
