Button showcaseOne, backButton;
int currentShowcase = -1;
boolean shown = false;

void setup() {
    frameRate(-1);
    showcaseOne = new Button(215, 250, 75, 35);
    showcaseOne.setText("Numbers");
    backButton = new Button(225, 450, 50, 35);
    backButton.setText("Back");
    size(500, 500);
}

void draw() {
    switch (currentShowcase) {
        case -1:
            showcaseOne.drawButton();
        break;
        case 0:
            backButton.drawButton();
        break;
    }
}

void mousePressed() {
    if (showcaseOne.mouseOver()) {
        currentShowcase = 0;
        numbers();
    }

    if (backButton.mouseOver()) {
        background(200);
        currentShowcase = -1;
    }
}

void numbers() {
    background(200);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(20);
    int[] nums = {5, 4, 2, 7, 6, 8, 5, 2, 8, 14};
    for (int i = 0; i < nums.length; i++) {
        nums[i] = int(sq(nums[i]));
        nums[i] += floor(random(10));
        text(nums[i], 250, i * 20 + 50);
    }

    for (int i = 1; i < nums.length; i++) {
        int sum = nums[i] += nums[i - 1];
        if (i == nums.length - 1) {
            text(sum, 250, 400);
        }
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