// Source : https://leetcode.com/problems/longest-substring-without-repeating-characters/
// Author : Ao Zhang
// Date   : 2019-12-07

/***************************************************************************************
 * Given a string, find the length of the longest substring without repeating characters.
 *
 * Example 1:
 * Input: "abcabcbb"
 * Output: 3
 * Explanation: The answer is "abc", with the length of 3.
 *
 * Example 2:
 * Input: "bbbbb"
 * Output: 1
 * Explanation: The answer is "b", with the length of 1.
 *
 * Example 3:
 * Input: "pwwkew"
 * Output: 3
 * Explanation: The answer is "wke", with the length of 3.
 * Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
 ***************************************************************************************/

class Solution {
    func lengthOfLongestSubstring1(_ s: String) -> Int {
        let strArray = Array(s)
        var maxLength = 0, startIndex = 0, char2Position = [Character: Int]()

        for i in 0..<strArray.count {
            let char = strArray[i]
            if let position = char2Position[char] {
                startIndex = max(startIndex, position)
            }

            char2Position[char] = i + 1
            maxLength = max(maxLength, i - startIndex + 1)
        }

        return maxLength
    }

    func lengthOfLongestSubstring2(_ s: String) -> Int {
    }
}
