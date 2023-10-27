int gridPasses = 5, currentShowcase = -1;
Button showcaseOne, showcaseTwo, backButton;

void setup() {
    size(500, 500);
    fill(255);
    backButton = new Button(200, 430, 100, 50);
    showcaseOne = new Button(100, 300, 100, 50);
    showcaseTwo = new Button(200, 300, 100, 50);
    backButton.setText("Back");
    showcaseOne.setText("Checker Board");
    showcaseTwo.setText("Lines");
}

void draw() {
    switch (currentShowcase) {
        case -1:
            background(20);
            textSize(20);
            fill(255);
            text("Select the showcase you would like to view", 250, 150);
            fill(0);
            showcaseOne.drawButton();
            showcaseTwo.drawButton();
        break;
        case 0:
            checkerBoard();
            backButton.drawButton();
        break;
        case 1:
            lines();
            backButton.drawButton();
        break;
    }
}

void mousePressed() {
    if (showcaseOne.mouseOver()) {
        currentShowcase = 0;
    }
    if (showcaseTwo.mouseOver()) {
        currentShowcase = 1;
    }
    if (backButton.mouseOver()) {
        currentShowcase = -1;
    }
}

void checkerBoard() {
    noStroke();
    background(255);
    for (int i = 0; i < gridPasses; i++) {
        for (int k = 0; k < gridPasses; k++) {
            rect(i * 100, k * 100, 50, 50);
            rect(i * 100 + 50, k * 100 + 50, 50, 50);
        }
    }
}

void lines() {
    stroke(255);
    background(20);
    for(int i = 0; i < gridPasses * 5; i++) {
        float y = i % 2;
        for (int k = 0; k < gridPasses * 5; k++) {
            float x = k % 2;
            if (x == 0 && y == 0) {
                line(i * 50, k * 50, i * 50 + 200, k * 50);
                line(i * 50, k * 50, i * 50, k * 50 + 200);
            }
        }
    }
}

class Button {
    private float _posX, _posY, _width, _height;
    private String _buttonText = "Button";
    boolean _onScreen;

    Button(float posX, float posY, float width, float height) {
        _posX = posX;
        _posY = posY;
        _width = width;
        _height = height;
    }

    void setText(String text) {
        _buttonText = text;
    }

    public void drawButton() {
        stroke(0);
        fill(170);
        if (mouseOver()) {
            fill(210);
        }
        rect(_posX, _posY, _width, _height);
        fill(0);
        textSize(15);
        textAlign(CENTER, CENTER);
        text(_buttonText, _posX + _width / 2, _posY + _height / 2);
        _onScreen = true;
    }

    boolean mouseOver() {
        if (_onScreen == true) {
            _onScreen = false;
            return mouseX >= _posX && mouseX <= _posX + _width && mouseY >= _posY && mouseY <= _posY + _height;
        } else {
            return false;
        }
    }
}
