int gridPasses = 5, currentShowcase = -1;

void setup() {
    size(500, 500);
    fill(0);
}

void draw() {
    switch (currentShowcase) {
        case -1:
        background(255);
        textSize(20);
            text("Select the showcase you would like to view", 70, 130);
        break;
        case 0:
            checkerBoard();
        break;
        case 1:
            lines();
        break;
    }
}

void keyPressed() {
    switch (key) {
        case BACKSPACE:
            currentShowcase = -1;
        break;
        case '1': 
            currentShowcase = 0;
        break;
        case '2':
            currentShowcase = 1;
        break;
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
    stroke(0);
    background(255);
    for(int i = 0; i < 10; i++) {
        float y = i % 2;
        for (int k = 0; k < 10; k++) {
            float x = k % 2;
            if (x == 0 && y == 0) {
                line(i * 50, k * 50, i * 50 + 200, k * 50);
                line(i * 50, k * 50, i * 50, k * 50 + 200);
            }
        }
    }
}