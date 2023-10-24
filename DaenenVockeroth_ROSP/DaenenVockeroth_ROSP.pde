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
    // Check if the dog should be drawn
    if (isVisible) {
        // Draw dog and save it's position in dogPos 
        float[] dogPos = drawDog(mouseX, mouseY);
        // Get distance between dog and bird
        float d = dist(bird.getPos()[0], bird.getPos()[1], dogPos[0], dogPos[1]);
        // Check for collision, and set background to random values
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
    // Check if key is uppercase and convert to lowercase
    int keyASCII = int(key);
    if (keyASCII < 97) {
        keyASCII += 32;
    }
    
    // Check what key is being pressed and move bird accordingly
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
    // Convert uppercase to lowercase
    int keyASCII = int(key);
    if (keyASCII < 97) {
        keyASCII += 32;
    }
    
    // Check what key is released and stop moving accordingly
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

    // Invert the dogs visibility status 
    isVisible = isVisible ? false : true;
}

// Method for drawing the tree
public void drawTree(float _posX, float _posY) {
    fill(83, 53, 10);
    rect(_posX, _posY, 80, 300);
    fill(58, 95, 11);
    ellipse(_posX + 40, _posY, 180, 180);
}

// Method for drawing the dog, returns the dogs position
public float[] drawDog(float _posX, float _posY) {
    triangle(_posX, _posY - 10, _posX - 10, _posY + 10, _posX + 10, _posY + 10);
    return new float[] { _posX, _posY };
}

// Class for the bird
class Bird {
    public float _posX, _posY, _moveSpeed;
    public boolean movingUp = false, movingLeft = false, movingDown = false, movingRight = false;
    Bird(float posX, float posY, float moveSpeed) {
        _posX = posX;
        _posY = posY;
        _moveSpeed = moveSpeed;
    }

    // Draw's the bird on the screen
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

    // Returns the position of the bird in an array
    public float[] getPos() {
        return new float[] { _posX, _posY };
    }

    // Used to set the position of the bird
    public void setPos(float posX, float posY) {
        _posX = posX;
        _posY = posY;
    }
}
