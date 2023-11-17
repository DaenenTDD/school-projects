Button showcaseOne, showcaseTwo, backButton;
int currentShowcase = -1;
String[] images = {
    "https://cdn.discordapp.com/attachments/1081858406459117650/1175137868772036668/image.png?ex=656a236c&is=6557ae6c&hm=ad423c60a4303ab7742039d030141b01bf7a57904feda0953c733a22fc4debf9&",
    "https://cdn.discordapp.com/attachments/1081858406459117650/1175137896777396264/image.png?ex=656a2373&is=6557ae73&hm=d7c6ba1adc3c163d9162a9e823a26423f260b4f585c29ba588922246a6bf5585&",
    "https://cdn.discordapp.com/attachments/1081858406459117650/1175137927349678140/image.png?ex=656a237a&is=6557ae7a&hm=f5f6da3e3c01f87abdba71b122b678b32877274d2a50fe2f9f48e0a0de4b192d&",
    "https://cdn.discordapp.com/attachments/1081858406459117650/1175137963949170698/image.png?ex=656a2383&is=6557ae83&hm=6145bca76c3fb74d74f61f6c0740c4220cae98cf9fa0de52abf091418210d033&",
    "https://cdn.discordapp.com/attachments/1081858406459117650/1175137981657530448/image.png?ex=656a2387&is=6557ae87&hm=ae9c51edaa836ab2ce4e2132854149739f4fdfb14f24d988d880fe93512d1625&",
    "https://cdn.discordapp.com/attachments/1081858406459117650/1175138009075695716/image.png?ex=656a238e&is=6557ae8e&hm=d7f9c77af814ba843b4e360c62e2c93bbca93c6815c27f2d6b6757aee330c336&",
    "https://cdn.discordapp.com/attachments/1081858406459117650/1175138035675967579/image.png?ex=656a2394&is=6557ae94&hm=edaf2920f90141b686a50defcbc61f0aa01dde2552a1eb4bb042ba43fff3cfb4&",
    "https://cdn.discordapp.com/attachments/1081858406459117650/1175138071113637908/image.png?ex=656a239d&is=6557ae9d&hm=69d04eefc353883248fc690481d0c3ee9673b5833a13cd8848b73aa9694cebd7&"
};
int currentTime, lastUpdate = currentTime, imageIndex = 0;
PImage currentImage = loadImage(images[0]);

void setup() {
    frameRate(-1);
    showcaseOne = new Button(215, 250, 75, 35);
    showcaseOne.setText("Numbers");
    showcaseTwo = new Button(215, 295, 75, 35);
    showcaseTwo.setText("Animation");
    backButton = new Button(225, 450, 50, 35);
    backButton.setText("Back");
    size(500, 500);
}

void draw() {
    switch (currentShowcase) {
        case -1:
            showcaseOne.drawButton();
            showcaseTwo.drawButton();
        break;
        case 0:
            backButton.drawButton();
        break;
        case 1:
            animation(100);
            backButton.drawButton();
        break;
    }
    currentTime = millis();
}

void mousePressed() {
    if (showcaseOne.mouseOver()) {
        currentShowcase = 0;
        numbers();
    }

    if (showcaseTwo.mouseOver()) {
        currentShowcase = 1;
    }

    if (backButton.mouseOver()) {
        background(200);
        currentShowcase = -1;
    }
}

void animation(int cooldown) {
    background(200);
    
    if (currentTime - lastUpdate >= cooldown) {
        imageIndex++;
        lastUpdate = currentTime;
        currentImage = loadImage(images[imageIndex]);
    }

    if (imageIndex == images.length - 1) {
        imageIndex = 0;
    }

    image(currentImage, 0, 0);
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