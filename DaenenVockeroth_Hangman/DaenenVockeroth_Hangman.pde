PFont monospace;

void setup() {
    monospace = createFont("cour.ttf", 20);
    frameRate(-1);
    size(750, 900);
    background(130);
    line(0, 450, 750, 450);
    printChars();
}

// Loop through and display each letter using the ASCII key.
void printChars() {
    textFont(monospace, 40);
    for (int i = 65; i < 91; i++) {
        text(char(i), i * 23 - 1420, 650);
    }
}