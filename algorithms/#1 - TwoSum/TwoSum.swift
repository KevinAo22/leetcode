// Source : https://leetcode.com/problems/two-sum/
// Author : Ao Zhang
// Date   : 2019-12-05

/***************************************************************************************
 * Given an array of integers, return indices of the two numbers such that they add up to a specific target.
 * You may assume that each input would have exactly one solution, and you may not use the same element twice.
 *
 * Example:
 * Given nums = [2, 7, 11, 15], target = 9,
 *
 * Because nums[0] + nums[1] = 2 + 7 = 9,
 * return [0, 1].
 ***************************************************************************************/

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dic = [Int: Int]()

        for i in 0..<nums.count {
            let matchValue = target - nums[i]
            if let matchIndex = dic[matchValue] {
                return [matchIndex, i]
            } else {
                dic[nums[i]] = i
            }
        }

        fatalError("No valid outputs")
    }
}
