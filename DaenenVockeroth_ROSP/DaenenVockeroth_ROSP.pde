float birdX = random(740), birdY = random(580);
Bird bird = new Bird(birdX, birdY, 9);
int r = 87, g = 144, b = 173;
boolean isColliding = false, isVisible = true;

void setup() {
    size(800, 600);
}

void draw() {
    noCursor();
    background(r, g, b);
    drawTree(350, 300);
    bird.drawBird();
    if (isVisible) {
        float[] dogPos = drawDog(mouseX, mouseY);
        float d = dist(bird.getPos()[0], bird.getPos()[1], dogPos[0], dogPos[1]);
        if (d < 35 && !isColliding) {
            isColliding = true;
            r = round(random(255));
            g = round(random(255));
            b = round(random(255));
        } else if (d > 35) {
            isColliding = false;
        }
    }
}

void keyPressed() {
    int keyASCII = int(key);
    if (keyASCII < 97) {
        keyASCII += 32;
    }
    
    switch (keyASCII) {
        case 119:
            bird.movingUp = true;
        break;
        case 97:
            bird.movingLeft = true;
        break;
        case 115:
            bird.movingDown = true;
        break;
        case 100:
            bird.movingRight = true;
        break;
        default:
            println(bird.getPos());
        break;	
    }
}

void keyReleased() {
    int keyASCII = int(key);
    if (keyASCII < 97) {
        keyASCII += 32;
    }
    
    switch (keyASCII) {
        case 119:
            bird.movingUp = false;
        break;
        case 97:
            bird.movingLeft = false;
        break;
        case 115:
            bird.movingDown = false;
        break;
        case 100:
            bird.movingRight = false;
        break;
    }
}

void mousePressed() {
    r = round(random(255));
    g = round(random(255));
    b = round(random(255));

    if (isVisible) { isVisible = false; } else { isVisible = true; }
}

public void drawTree(float _posX, float _posY) {
    fill(83, 53, 10);
    rect(_posX, _posY, 80, 300);
    fill(58, 95, 11);
    ellipse(_posX + 40, _posY, 180, 180);
}

public float[] drawDog(float _posX, float _posY) {
    triangle(_posX, _posY - 10, _posX - 10, _posY + 10, _posX + 10, _posY + 10);
    return new float[] { _posX, _posY };
}

class Bird {
    public float _posX, _posY, _moveSpeed;
    public boolean movingUp = false, movingLeft = false, movingDown = false, movingRight = false;
    Bird(float posX, float posY, float moveSpeed) {
        _posX = posX;
        _posY = posY;
        _moveSpeed = moveSpeed;
    }

    public void drawBird() {
        if (movingUp) {
            setPos(_posX, _posY -= _moveSpeed);
        }
        if (movingLeft) {
            setPos(_posX -= _moveSpeed, _posY);
        }
        if (movingDown) {
            setPos(_posX, _posY += _moveSpeed);
        }
        if (movingRight) {
            setPos(_posX += _moveSpeed, _posY);
        }

        fill(172, 20, 30);
        ellipse(_posX, _posY, 50, 50);
        fill(222, 199, 27);
        triangle(_posX + 23, _posY - 10, _posX + 33, _posY, _posX + 23, _posY + 10);
        fill(0);
        ellipse(_posX + 7, _posY - 6, 10, 10);
    }

    public float[] getPos() {
        return new float[] { _posX, _posY };
    }

    public void setPos(float posX, float posY) {
        _posX = posX;
        _posY = posY;
    }
}
