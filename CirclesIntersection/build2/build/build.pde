// https://stackoverflow.com/questions/3349125/circle-circle-intersection-points

CircleIntersections ci;
PVector c1, c2;
float r1, r2;

PVector i1, i2; // Intersection points

void setup(){
	size(1080, 1080, P2D);

	c1 = new PVector(400, 400);
	c2 = new PVector(500, 500);

	r1 = 200;
	r2 = 150;

	ci = getCirclesIntersections(c1, c2, r1, r2);

}

void draw(){
	background(255);

	c1.x = mouseX;
	c1.y = mouseY;

	ellipseMode(CENTER);
	stroke(0); noFill(); strokeWeight(3);
	ellipse(c1.x, c1.y, 2*r1, 2*r1);
	ellipse(c2.x, c2.y, 2*r2, 2*r2);

	ci = getCirclesIntersections(c1, c2, r1, r2);
	ci.display();
}


CircleIntersections getCirclesIntersections(PVector c1, PVector c2, float r1, float r2){
	float d = dist(c1.x, c1.y, c2.x, c2.y);
	float a = (r1*r1 - r2*r2 + d*d)/(2.0*d); 
	float h = sqrt(r1*r1 - a*a);

	float mx = c1.x + a*(c2.x - c1.x)/d;
	float my = c1.y + a*(c2.y - c1.y)/d;
	PVector m = new PVector(mx, my);

	float i1x = mx + h*(c2.y - c1.y)/d;
	float i1y = my - h*(c2.x - c1.x)/d;
	PVector i1 = new PVector(i1x, i1y);

	float i2x = mx - h*(c2.y - c1.y)/d;
	float i2y = my + h*(c2.x - c1.x)/d;
	PVector i2 = new PVector(i2x, i2y);

	return new CircleIntersections(i1, i2, m);
}


class CircleIntersections {
	
	PVector i1, i2;
	PVector m;

	CircleIntersections(PVector a, PVector b, PVector m){
		this.i1 = a.copy();
		this.i2 = b.copy();
		this.m = m.copy();
	}

	void display(){
		ellipseMode(CENTER);
		noStroke(); fill(0, 255, 0);
		ellipse(i1.x, i1.y, 15, 15);
		ellipse(i2.x, i2.y, 15, 15);
		fill(255, 0, 0);
		ellipse(m.x, m.y, 15, 15);
	}
}