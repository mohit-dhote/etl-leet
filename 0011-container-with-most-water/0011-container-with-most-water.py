class Solution:
    def maxArea(self, height: List[int]) -> int:
        left, right = 0, len(height) - 1
        max_water = 0

        while left < right:
            width = right - left
            current_area = min(height[left], height[right]) * width
            max_water = max(max_water, current_area)

            if height[left] < height[right]:
                left += 1
            else:
                right -= 1

        return max_water