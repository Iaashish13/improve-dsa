/* 
Given an array of integers and a number k, find the maximum sum of a subarray of size k. 

Examples: 

Input  : arr[] = {100, 200, 300, 400},  k = 2
Output : 700
*/

import 'dart:math';

int findMaximumSum(List<int> arr, int k) {
  int n = arr.length;

  // Calculate the sum of the first k elements
  int maxSum = 0;
  for (int i = 0; i < k; i++) {
    maxSum += arr[i];
  }

  int currentSum = maxSum;

  /*
  How sliding window is being used?
  Let us suppose at first ouer k is 3.
  1. From above for loop we calculate the value of first 3 elements in array.
  As in example our k value is 3 right and
  array's index start from 0 we are able to calcualte the sum of first 3 elements..
  2. Then we store it in current sum variable.
  3. In second for loop we are starting form the value = k. Which becomes fourth element for array right?
  4. Now how to calucate that here comes sliding window algorith.
  See in below example:
   At first our firt Sum = 100+200+300=600;
   Second one is 200+300+400 = 900
   Third one is 300+400+500= 1200
   What is happening here let's look into it.
   We are calculating the value of 200 +300(in first and second step) which we have calcuated before. 
   To avoid this sliding algorithm comes in.
   Let's identify
   Our firstSum = 100+200+300 =600
   Second sum is = 200+300 + add One Index - Remove One Index right
   Basically itMeans = firstSum + array's[comingIndex]- arrays's[comingIndex - value of k]
   arrays's[comingIndex - value of k]== This elements first element suppose our index =4 and k = 3. Then it value is 1. right and arrays'[1] is second element.

   This is how it is done. And we calculate the max sum and min sum using sliding window algorithm.

   */
  for (int i = k; i < n; i++) {
    currentSum = currentSum + arr[i] - arr[i - k];
    maxSum = max(maxSum, currentSum);
  }

  return maxSum;
}

void main() {
  List<int> arr = [100, 200, 300, 400, 500];
  int k = 3;

  int answer = findMaximumSum(arr, k);
  print(answer); // Output: 700
}
