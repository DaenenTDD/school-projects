Shapes shapes = new Shapes();
float birdX = random(740), birdY = random(580);

void setup() {
    size(800, 600);
}

void draw() {
    background(87, 144, 173);
    shapes.drawTree(200, 250);
    shapes.drawBird(birdX, birdY);
}

class Shapes {
    public void drawTree(float _posX, float _posY) {
        fill(83, 53, 10);
        rect(_posX, _posY, 80, 300);
        fill(58, 95, 11);
        ellipse(_posX + 40, _posY, 180, 180);
    }

    public void drawBird(float _posX, float _posY) {
        fill(172, 20, 30);
        ellipse(_posX, _posY, 50, 50);
        fill(222, 199, 27);
        triangle(_posX + 23, _posY - 10, _posX + 33, _posY, _posX + 23, _posY + 10);
        fill(0);
        ellipse(_posX + 7, _posY - 6, 10, 10);
    }
}
