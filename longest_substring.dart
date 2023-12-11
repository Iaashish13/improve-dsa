/* 
Given a string s, find the length of the longest 
substring
 without repeating characters.

 

Example 1:

Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
Example 2:

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
Example 3:

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 

Constraints:

0 <= s.length <= 5 * 104
s consists of English letters, digits, symbols and spaces.

*/

void main() {
  String input = "abacef ba";
  // lengthOfLongestSubstring(input);
  var test = [1, 2, 3, 3, 5, 6, 3, 2, 1];
  final value = Map.fromIterable(test);
  print(value);
  final duplicatedList = test.expand((element) => [element, element].toList());
  print(duplicatedList);
}

int lengthOfLongestSubstring(String s) {
  Map<String, int> seen = {};
  int begin = 0, end = 0;
  int len = 0;
  String ans = "";

  while (end < s.length) {
    String current = s[end];

    if (seen.containsKey(current) && seen[current]! >= begin) {
      begin = seen[current]! + 1;
    } else {
      seen[current] = end;

      end++;
    }

    if (end - begin > len) {
      len = end - begin;
      ans = s.substring(begin, end);
    }
  }

  print("Length of the longest substring without repeating characters: $len");
  print("The actual substring: $ans");
  return len;
}
