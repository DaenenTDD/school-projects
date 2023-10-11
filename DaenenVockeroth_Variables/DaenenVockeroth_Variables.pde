String storedNumber = "";

// Instantiate the room objects
Room myRoom = new Room(50, 50, 20, false);
Room myRoom2 = new Room(50, 150, 20, true);

// Setup size and unlimited framerate
void setup() {
    frameRate(-1);
    size(500, 650);
}

// Set colors and render values and results
void draw() {
    background(255);
    fill(0);
    myRoom.renderValues();
    myRoom2.renderValues();
    fill(0);
    myRoom.renderResult();
    myRoom2.renderResult();

    // Create a table
    fill(0, 0, 0, 0);
    rect(100, 300, 270, 200);
    line(235, 300, 235, 500);
    line(100, 350, 370, 350);
    line(100, 400, 370, 400);
    line(100, 450, 370, 450);
}

// keyPressed event to set the current number to a string containing all numbers pressed
// Also making sure only numbers are accepted and set the number to zero when backspace is pressed
void keyPressed() {
    if (key >= 48 && key <= 57) {
        storedNumber += key;
        myRoom2.setValue(storedNumber);
    } else if (key == BACKSPACE) {
        storedNumber = "0";
        myRoom2.setValue(storedNumber);
    }      
}

// Create room class
class Room {
    // Define default values
    float defaultLength = random(0, 50), defaultWidth = random(0, 50), defaultHeight = random(0, 50);
    // Set class vars
    float _xPos, _yPos, _fontSize, _length = 0, _width = 0, _height = 0;
    boolean _userMode;
    int _activeLine = -1;

    // Accept and set paramaters
    Room(int xPos, int yPos, float fontSize, boolean userMode) {
        _xPos = xPos;
        _yPos = yPos;
        _fontSize = fontSize;
        _userMode = userMode;

        // Check if we are in user mode. If not, set values to default
        if (!userMode) {
            _length = defaultLength;
            _height = defaultHeight;
            _width = defaultWidth;
        }
    }

        // Setup rendering for the values
        void renderValues() {
            textSize(_fontSize);
            if (_activeLine == 0) { fill(0, 200, 40); } else { fill(0); }
            text(str(_length), _xPos + 3, _yPos);
            if (_activeLine == 1) { fill(0, 200, 40); } else { fill(0); }
            text(str(_width), _xPos + 3, _yPos + 30);
            if (_activeLine == 2) { fill(0, 200, 40); } else { fill(0); }
            text(str(_height), _xPos + 3, _yPos + 60);

            // Add boxes around usermode values to differentiate and show that input is allowed.
            if (_userMode) {
                fill(0, 0, 0, 0);
                rect(_xPos + 1, _yPos - 20, 100, 90);
                line(_xPos, _yPos + 8, _xPos + 102, _yPos + 8);
                line(_xPos, _yPos + 38, _xPos + 102, _yPos + 38);

                // Ugly but working nested if statements to check if the mouse is inside each box when clicked
                // Check if the line is changed and set the number to 0 so the number does not continue from the last box
                if (mouseX >= 51 && mouseX <= 151) {
                    if (mouseY >= 129 && mouseY <= 157 && mousePressed) {
                        if (_activeLine == 0) return;
                        storedNumber = "0";
                        _activeLine = 0;
                    } else if (mouseY > 158 && mouseY < 185 && mousePressed) {
                        if (_activeLine == 1) return;
                        storedNumber = "0";
                        _activeLine = 1;
                    } else if (mouseY > 186 && mouseY < 220 && mousePressed) {
                        if (_activeLine == 2) return;
                        storedNumber = "0";
                        _activeLine = 2;
                    } else if (mousePressed) {
                        _activeLine = -1;
                    }
                }
                else if (mousePressed) {
                    _activeLine = -1;
                }
            }
        }

        // Method for setting the value of the variable assigned to each box
        void setValue(String value) {
           switch (_activeLine) {
            case -1:
                return;
            case 0:
                _length = float(value);
            break;
            case 1:
                _width = float(value);
            break;
            case 2:
                _height = float(value);
            break;
           }
        }

        // Render result
        void renderResult() {
            float result = _length * _width * _height;
            text(result, _xPos + 150, _yPos +32);
        }
}
