//https://leetcode.com/problems/contains-duplicate-iii/submissions/

/* V1 */
var containsNearbyAlmostDuplicate = function(nums, k, t) {
    for (let i = 0; i < (nums.length - 1); i += 1) {
        for (let j = i + 1; j < nums.length; j += 1) {
            if ((Math.abs(nums[i] - nums[j]) <= t)
                && (Math.abs(i - j) <= k)) {
                return true;    
            }
        }
    }
    
    return false;
};

/*


PYTHON TO TEST LATER:

class Solution:
    def containsNearbyAlmostDuplicate(self, nums: List[int], k: int, t: int) -> bool:
	
		#edge case
        if t<0 or k<=0 or not nums:
            return False
        
        bucket={}
        width=(t+1)
        
        for i,ele in enumerate(nums):
            buck_key=(ele) //width
            
            if buck_key in bucket:
                return True
            
            else:
                bucket[buck_key]=ele
                
                if buck_key-1 in bucket and abs(ele-bucket[buck_key-1])<=t:
                    return True
                
                if buck_key+1 in bucket and abs(ele-bucket[buck_key+1])<=t:
                    return True
                
                #del leftmost element
                if i>=k:
                    #if key is not found within that window size
                    del_key=nums[i-k]//width
                    del bucket[del_key]
        return False

*/