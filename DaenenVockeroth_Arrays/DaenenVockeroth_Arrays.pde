void setup() {
    size(500, 500);
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
        nums[i] += nums[i - 1];
        if (i == nums.length - 1) {
            text(nums[i], 250, 400);
        }
    }
}