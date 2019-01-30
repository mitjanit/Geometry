// https://stackoverflow.com/questions/3349125/circle-circle-intersection-points

PVector c1, c2, m;
float r1, r2;

float d; //Distance between centers
float h; //Distance betwwen 
float a;

PVector i1, i2, i3; // Intersection points

void setup(){
	size(1080, 1080, P2D);

	c1 = new PVector(400, 400);
	c2 = new PVector(500, 500);
	m  = midPoint(c1, c2); 

	r1 = 200;
	r2 = 150;

	d = dist(c1.x, c1.y, c2.x, c2.y);
	a = (r1*r1 - r2*r2 + d*d)/(2*d); 
	h = sqrt(r1*r1 - a*a);

	float x2 = c1.x + a*(c2.x - c1.x)/d;
	float y2 = c1.y + a*(c2.y - c1.y)/d;
	i1 = new PVector(x2, y2);

	float x3 = x2 + h*(c2.y - c1.y)/d;
	float y3 = y2 - h*(c2.x - c1.x)/d;
	i2 = new PVector(x3, y3);

	float x4 = x2 - h*(c2.y - c1.y)/d;
	float y4 = y2 + h*(c2.x - c1.x)/d;
	i3 = new PVector(x4, y4);
}

void draw(){
	background(255);

	ellipseMode(CENTER);
	stroke(0); noFill(); strokeWeight(3);
	ellipse(c1.x, c1.y, 2*r1, 2*r1);
	ellipse(c2.x, c2.y, 2*r2, 2*r2);

	noStroke(); fill(255, 0 ,0);
	ellipse(i1.x, i1.y, 15, 15);

	noStroke(); fill(0, 255, 0);
	ellipse(i2.x, i2.y, 15, 15);

	noStroke(); fill(0, 255, 0);
	ellipse(i3.x, i3.y, 15, 15);
}

PVector midPoint(PVector a, PVector b){
		float x = (a.x + b.x)/2.0;
		float y = (a.y + b.y)/2.0;
		return new PVector(x, y);
	}