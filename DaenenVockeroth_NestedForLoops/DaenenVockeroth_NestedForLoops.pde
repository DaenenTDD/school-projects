/**
    DaenenVockeroth_NestedForLoops v1.0.0
    This project consists of three showcases, a checkered grid, a sequence of lines forming a grid, and a pyramid of numbers.
    These are all scallable (except for the pyramid, only scallable up to 9 right now) and are achived using for loops inside of other for loops.
*/

// Default vars
int gridPasses = 5, currentShowcase = -1;
// Setup button references
Button showcaseOne, showcaseTwo, showcaseThree, backButton;

void setup() {
    // Basic setup
    frameRate(-1);
    size(500, 500);
    fill(255);
    // Buttons
    backButton = new Button(200, 430, 100, 50);
    showcaseOne = new Button(100, 300, 100, 50);
    showcaseTwo = new Button(200, 300, 100, 50);
    showcaseThree = new Button(300, 295, 100, 60);
    backButton.setText("Back");
    showcaseOne.setText("Checker Board");
    showcaseTwo.setText("Lines");
    showcaseThree.setText("Number\nPyramid\n(Console)");
}

void draw() {
    // Check what showcase should be displayed and display it
    switch (currentShowcase) {
        case -1:
            background(20);
            textSize(20);
            fill(255);
            text("Select the showcase you would like to view", 250, 150);
            fill(0);
            showcaseOne.drawButton();
            showcaseTwo.drawButton();
            showcaseThree.drawButton();
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

// Button click handler
void mousePressed() {
    if (showcaseOne.mouseOver()) {
        currentShowcase = 0;
    }
    if (showcaseTwo.mouseOver()) {
        currentShowcase = 1;
    }
    if (showcaseThree.mouseOver()) {
        numberPyramid();
    }
    if (backButton.mouseOver()) {
        currentShowcase = -1;
    }
}

// The checkerboard
void checkerBoard() {
    noStroke();
    background(0);
    fill(255);
    for (int i = 0; i < gridPasses; i++) {
        for (int k = 0; k < gridPasses; k++) {
            rect(i * 100, k * 100, 50, 50);
            rect(i * 100 + 50, k * 100 + 50, 50, 50);
        }
    }
}

// Lines
void lines() {
    stroke(255);
    background(20);
    for(int i = 0; i < gridPasses * 5; i++) {
        for (int k = 0; k < gridPasses * 5; k++) {
            line(i * 50, k * 50, i * 50 + 200, k * 50);
            line(i * 50, k * 50, i * 50, k * 50 + 200);
        }
    }
}

// Number pyramid (up to 9 before things get silly)
void numberPyramid() {
    int timesToPrint = 6, spacesToPrint;
    spacesToPrint = timesToPrint - 2;

    for (int i = 1; i < timesToPrint; i++) {
        for (int a = 0; a < spacesToPrint; a++) {
            print(" ");
        }
        for (int k = 0; k < i; k++) {
            print(i);
            print(" ");
        }
        print("\n");
        spacesToPrint--;
    }
}

// Button class to create buttons easily
class Button {
    private float _posX, _posY, _width, _height;
    private String _buttonText = "Button";
    private boolean _onScreen;

    Button(float posX, float posY, float width, float height) {
        _posX = posX;
        _posY = posY;
        _width = width;
        _height = height;
    }
    // Used to set the text in the button
    void setText(String text) {
        _buttonText = text;
    }

    // Drawing and updating the button on hover
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

    // Checking if the mouse is over it, and if it should be clickable (if it is not on screen, it will not be clickable)
    boolean mouseOver() {
        if (_onScreen == true) {
            _onScreen = false;
            return mouseX >= _posX && mouseX <= _posX + _width && mouseY >= _posY && mouseY <= _posY + _height;
        } else {
            return false;
        }
    }
}
