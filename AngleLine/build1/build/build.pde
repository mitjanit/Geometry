
float a=0.0;
float r = 200;
PVector center;
PVector start;

void setup(){
	size(1080, 1080);
	center = new PVector(width/2, height/2);
	start  = new PVector(width/2 + r, height/2);
}

void draw(){
	background(255);

	noStroke(); fill(0, 255, 0, 50);
	arc(center.x, center.y, 2*r, 2*r, 0.0, radians(a));




	noFill(); stroke(0); strokeWeight(3);
	ellipseMode(CENTER);
	ellipse(width/2, height/2, 2*r, 2*r);

	stroke(255, 0, 0);
	line(center.x, center.y, start.x + 100, start.y);
	stroke(0, 0, 255);
	line(width/2, height/2, mouseX, mouseY);
	PVector mouse = new PVector(mouseX, mouseY);
	a = angleBetween2Lines(center, start, center, mouse);

	fill(0);
	textSize(20);
	text("Degrees: "+a, 50, 50);
	text("Radians: "+radians(a), 50, 80);
}

float angleBetween2Lines(PVector a1, PVector a2, PVector b1, PVector b2) {
    float angle1 = atan2(a2.y - a1.y, a1.x - a2.x);
    float angle2 = atan2(b2.y - b1.y, b1.x - b2.x);
    float angle = (float) degrees(angle1 - angle2);
    if (angle < 0) angle += 360;
    return angle;
}