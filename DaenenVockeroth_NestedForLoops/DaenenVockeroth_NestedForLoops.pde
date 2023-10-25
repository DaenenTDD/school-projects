int gridPasses = 11;

void setup() {
    background(255);
    size(500, 500);
    fill(0);
    noStroke();
    for(int i = 0; i < gridPasses; i++) {
        float y = i % 2;
        for (int k = 0; k < gridPasses; k++) {
            float x = k % 2;
            if (x == 0) {
                rect(i * 50, k * 50, 50, 50);
            }
        }
    }
}

void draw() {

}