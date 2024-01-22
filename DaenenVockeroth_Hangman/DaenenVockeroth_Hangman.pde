PFont monospace;
int hangmanStage = 0;
boolean gameStarted;
Button start;
char guess;
String wordToGuess = "", wrongLetters = "", correctLetters = "", usedLetters = "";

void setup() {
    background(130);
    monospace = createFont("cour.ttf", 20);
    frameRate(-1);
    size(750, 900);
    start = new Button(330, 500, 75, 50);
    start.setText("Play!");
}

void draw() {
    if (!gameStarted) {
        start.drawButton();
        textAlign(CENTER, CENTER);
        textSize(30);
        text("Type the word to guess", width / 2, 200);
        text("The word must be longer than 3 letters, max of 12", width / 2, 50);
        text(wordToGuess, width / 2, 300);
        return;
    }

    if (hangmanStage >= 11) {
        fill(0);
        rectMode(CORNER);
        rect(20, 350, 710, 500);
        fill(255);
        text("YOU LOSE, THE WORD WAS: \n" + wordToGuess, 390, 570);
        noLoop();
    }

    if (hangmanStage < 11 && correctLetters.length() == wordToGuess.length()) {
        fill(0);
        rectMode(CORNER);
        rect(20, 50, 710, 300);
        fill(0, 255, 40);
        text("YOU WIN!!", 370, 200);
        noLoop();
    }
}

void keyPressed() {
    int keyASCII = int(key);
    if (keyASCII > 96) {
        keyASCII -= 32;
    }
    if (!gameStarted) {
        background(130);
        if (key == BACKSPACE) wordToGuess = "";
        if (!isLetter(char(keyASCII))) return;
        wordToGuess = wordToGuess + char(keyASCII);
    } else {
        if (!isLetter(char(keyASCII))) return;
        
        for (int i = 0; i < wordToGuess.length(); i++) {
            if (!wordToGuess.contains(str(char(keyASCII))) && !wrongLetters.contains(str(char(keyASCII)))) {
                fill(255, 0, 0);
                rectMode(CENTER);
                rect(keyASCII * 23 - 1400, 650, 20, 50);
                fill(0);
                printChars();
                hangmanStage++;
                println(hangmanStage);
                drawHangman(hangmanStage);
                wrongLetters = wrongLetters + char(keyASCII);
                return;
            }
            if (char(keyASCII) == wordToGuess.charAt(i) && !usedLetters.contains(str(char(keyASCII)))) {
                correctLetters = correctLetters + wordToGuess.charAt(i);
                fill(0, 255, 0);
                rectMode(CENTER);
                rect(keyASCII * 23 - 1400, 650, 20, 50);
                fill(0);
                printChars();
                int amount = wordToGuess.length();
                float leftShift = textWidth('_') / 2 * amount;
                text(wordToGuess.charAt(i), i * 30 + 370 - leftShift, 400);
            }
        }
        usedLetters = usedLetters + char(keyASCII);
    }
}

// Loop through and display each letter in the most complicated manner I could think of
void printChars() {
    fill(0);
    textFont(monospace, 40);
    for (int i = 65; i < 91; i++) {
        text(char(i), i * 23 - 1400, 650);
    }
}

void printCharSpaces(String string) {
    fill(0);
    textFont(monospace, 40);
    int amount = string.length();
    float leftShift = textWidth('_') / 2 * amount;
    for (int i = 1; i < amount + 1; i++) {
        text("_", i * 30 + 340 - leftShift, 400);
    } 
}

void mousePressed() {
    if (start.mouseOver()) {
        if (wordToGuess.length() > 3 && wordToGuess.length() < 13) {
            background(130);
            gameStarted = true;
            line(0, 450, 750, 450);
            printCharSpaces(wordToGuess);
            printChars();
        }
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

void drawHangman(int stage) {
    switch (stage) {
        case 1: 
            line(200, 320, 500, 320);
        break;
        case 2: 
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
        break;
        case 3:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
        break;
        case 4:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
            line(200, 50, 350, 50);
        break;
        case 5:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
            line(200, 50, 350, 50);
            line(350, 50, 350, 100);
        break;
        case 6:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
            line(200, 50, 350, 50);
            line(350, 50, 350, 100);
            fill(130);
            ellipse(350, 100, 50, 50);
        break;
        case 7:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
            line(200, 50, 350, 50);
            line(350, 50, 350, 100);
            fill(130);
            ellipse(350, 100, 50, 50);
            line(350, 125, 350, 200);
        break;
        case 8:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
            line(200, 50, 350, 50);
            line(350, 50, 350, 100);
            fill(130);
            ellipse(350, 100, 50, 50);
            line(350, 125, 350, 200);
            line(350, 200, 335, 250);
        break;
        case 9:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
            line(200, 50, 350, 50);
            line(350, 50, 350, 100);
            fill(130);
            ellipse(350, 100, 50, 50);
            line(350, 125, 350, 200);
            line(350, 200, 335, 250);
            line(350, 200, 365, 250);
        break;
        case 10:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
            line(200, 50, 350, 50);
            line(350, 50, 350, 100);
            fill(130);
            ellipse(350, 100, 50, 50);
            line(350, 125, 350, 200);
            line(350, 200, 335, 250);
            line(350, 200, 365, 250);
            line(350, 140, 315, 110);
        break;
        case 11:
            line(200, 320, 500, 320);
            line(200, 320, 200, 50);
            line(200, 285, 235, 320);
            line(200, 50, 350, 50);
            line(350, 50, 350, 100);
            fill(130);
            ellipse(350, 100, 50, 50);
            line(350, 125, 350, 200);
            line(350, 200, 335, 250);
            line(350, 200, 365, 250);
            line(350, 140, 315, 110);
            line(350, 140, 385, 110);
        break;
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