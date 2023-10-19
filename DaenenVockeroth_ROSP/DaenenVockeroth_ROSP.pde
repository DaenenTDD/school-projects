float birdX = random(740), birdY = random(580);
Bird bird = new Bird(birdX, birdY, 5);

void setup() {
    size(800, 600);
}

void draw() {
    background(87, 144, 173);
    drawTree(200, 250);
    bird.drawBird();
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
    }
}

void keyReleased() {
    
}

public void drawTree(float _posX, float _posY) {
    fill(83, 53, 10);
    rect(_posX, _posY, 80, 300);
    fill(58, 95, 11);
    ellipse(_posX + 40, _posY, 180, 180);
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

    public void setPos(float posX, float posY) {
        _posX = posX;
        _posY = posY;
    }
}

