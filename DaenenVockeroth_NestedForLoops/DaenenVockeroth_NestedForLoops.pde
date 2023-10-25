void setup() {
    background(255);
    size(500, 500);
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

void draw() {

}