// Source : https://leetcode.com/problems/add-two-numbers/
// Author : Ao Zhang
// Date   : 2019-12-06

/***************************************************************************************
 * You are given two non-empty linked lists representing two non-negative integers.
 * The digits are stored in reverse order and each of their nodes contain a single digit.
 * Add the two numbers and return it as a linked list.
 * You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 *
 * Example:
 * Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
 * Output: 7 -> 0 -> 8
 * Explanation: 342 + 465 = 807.
 ***************************************************************************************/

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2 else {
            return l1
        }

        let result = ListNode((l1.val + l2.val) % 10)
        if (l1.val + l2.val) > 9 {
            result.next = addTwoNumbers(addTwoNumbers(l1.next, l2.next), ListNode(1))
        } else {
            result.next = addTwoNumbers(l1.next, l2.next)
        }

        return result
    }

    func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head: ListNode = ListNode(0)
        var tail = head
        var carry = 0, sum = 0
        var first = l1, second = l2

        while first != nil && second != nil {
            sum = carry + first!.val + second!.val
            carry = sum / 10
            sum = sum % 10

            first!.val = sum
            tail.next = first
            tail = first!

            first = first!.next
            second = second!.next

            if first == nil && carry > 0 {
                first = ListNode(carry)
                carry = 0
            } else if second == nil && carry > 0 {
                second = ListNode(carry)
                carry = 0
            }
        }

        if first != nil {
            tail.next = first
        } else if second != nil {
            tail.next = second
        }

        return head.next
    }
}
