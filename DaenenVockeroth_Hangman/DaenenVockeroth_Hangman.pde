PFont monospace;
int hangmanStage;
boolean gameStarted;
Button start;
char guess;
String wordToGuess = "";

void setup() {
    monospace = createFont("cour.ttf", 20);
    frameRate(-1);
    size(750, 900);
    start = new Button(330, 500, 75, 50);
    start.setText("Play!");
}

void draw() {
    background(130);
    if (!gameStarted) {
        start.drawButton();
        textAlign(CENTER, CENTER);
        textSize(30);
        text("Type the word to guess", width / 2, 200);
        text(wordToGuess, width / 2, 300);
        return;
    }
    line(0, 450, 750, 450);
    printChars();
}

void keyPressed() {
    if (key == BACKSPACE) wordToGuess = "";
    if (!isLetter(key)) return;

    if (!gameStarted) {
        wordToGuess = wordToGuess + key;
        println(wordToGuess);
    }
}

// Loop through and display each letter in the most complicated manner I could think of
void printChars() {
    textFont(monospace, 40);
    for (int i = 65; i < 91; i++) {
        text(char(i), i * 23 - 1400, 650);
    }
}

void mousePressed() {
    if (start.mouseOver()) {
        gameStarted = true;
    }
}

// Identifies the supplied char and determines if it is a letter or not
boolean isLetter(char input) {
    if (int(key) > 64 && int(key) < 91 || int(key) > 96 && int(key) < 123) {
        return true;
    } else {
        return false;
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