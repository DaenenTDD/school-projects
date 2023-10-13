Shapes shapes = new Shapes();

void setup() {
    size(800, 600);
}

void draw() {
    background(87, 144, 173);

    shapes.drawTree(200, 250);
    shapes.drawBird(100, 100);
}




class Shapes {
    public void drawTree(int _posX, int _posY) {
        fill(83, 53, 10);
        rect(_posX, _posY, 80, 300);
        fill(58, 95, 11);
        ellipse(_posX + 40, _posY, 180, 180);
    }

    public void drawBird(int _posX, int _posY) {
        fill(172, 20, 30);
        ellipse(_posX, _posY, 50, 50);
    }
}
