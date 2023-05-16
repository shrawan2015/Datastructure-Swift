import UIKit

/*
 Power Set: Print all the possible subsequences of the String

 Problem Statement: Given a string, find all the possible subsequences of the string.


 Example 1:
 Input: str = "abc"
 Output: a ab abc ac b bc c
 Explanation: Printing all the 7 subsequence for the string "abc".

 Example 2:
 Input: str = "aa"
 Output: a a aa
 Explanation: Printing all the 3 subsequences for the string "aa"

 
 
 Using recursion(Backtracking)
 Time Complexity: O(2^n)
 Space Complexity: O(n), recursion stack.
 */


func subsequences(_ index:Int, str:String,_ ans: inout String){
    if(index == str.count){
        print("subsequences",ans)
        return
    }
    //Picking
    let strArray = Array(str)
    ans = ans + String(strArray[index])
    subsequences(index + 1, str: str, &ans)
    //poping out while backtracking
    ans.removeLast()
    
    //Not Pick
    subsequences(index + 1, str: str, &ans)
}

var ans = ""
subsequences(0, str: "abc", &ans)


/*------------------------------END------------------------------------------*/


/*
 
 2.
 
 Combination Sum – 1

 Problem Statement: Given an array of distinct integers and a target, you have to return the list of all unique combinations where the chosen numbers sum to target. You may return the combinations in any order.
 
 The same number may be chosen from the given array an unlimited number of times. Two combinations are unique if the frequency of at least one of the chosen numbers is different.

 It is guaranteed that the number of unique combinations that sum up to target is less than 150 combinations for the given input.


 Example 1:

 Input: array = [2,3,6,7], target = 7

 Output: [[2,2,3],[7]]

 Explanation: 2 and 3 are candidates, and 2 + 2 + 3 = 7. Note that 2 can be used multiple times.
              7 is a candidate, and 7 = 7.
              These are the only two combinations.


 Example 2:

 Input: array = [2], target = 1

 Output: []

 Explaination: No combination is possible.
 
 Using recursion(Backtracking)
 Time Complexity: O(2^t * k) where t is the target, k is the average length

 Space Complexity: O(k*x), k is the average length and x is the no. of combinations
 */


func combinationSum(_ index:Int ,_ target:Int,_ ds:inout [Int] ,_ arr:[Int],_ ans: inout [[Int]] ){
    
    if(index == arr.count){
        if(target == 0){
            ans.append(ds)
            print(ds)
        }
        return
    }
    
    // pick up the element
    if(arr[index] <= target){
        ds.append(arr[index])
        combinationSum(index, target - arr[index], &ds, arr, &ans)
        ds.removeLast()
    }
    
    combinationSum(index + 1,target, &ds, arr, &ans)
    
}

var target = 8
var ds = [Int]()
var arr = [2,8]
var targetSumArray = [[Int]]()

combinationSum(0, target, &ds, arr, &targetSumArray)
print("combinationSum", ans)

/*------------------------------END------------------------------------------*/


/*
 
 3.
 
 Combination Sum II – Find all unique combinations

 Problem Statement: Given a collection of candidate numbers (candidates) and a target number (target), find all unique combinations in candidates where the candidate numbers sum to target. Each number in candidates may only be used once in the combination.


 Note: The solution set must not contain duplicate combinations.




 Example 1:

 Input: candidates = [10,1,2,7,6,1,5], target = 8

 Output:
 [
 [1,1,6],
 [1,2,5],
 [1,7],
 [2,6]]


 Explanation: These are the unique combinations whose sum is equal to target.
  
 Example 2:

 Input: candidates = [2,5,2,1,2], target = 5

 Output: [[1,2,2],[5]]

 Explanation: These are the unique combinations whose sum is equal to target.
 
 Using recursion(Backtracking)
 Time Complexity: O(2^t * k) where t is the target, k is the average length

 Space Complexity: O(k*x), k is the average length and x is the no. of combinations
 */
