pragma solidity ^0.5.0;

import "hardhat/console.sol";

library SafeMath {

    function add(uint256 a, uint256 b) internal view returns (uint256) {
      uint256 c = a + b;
      console.log("c:", c);
      assert(c >= a);  // check overflow 
      return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a); // check underflow
      return a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a * b;
      assert(a == 0 || c / a == b); // multiplication overflow
      return c;
    }
 
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b > 0); // Solidity automatically throws when dividing by 0
      uint256 c = a / b;
      return c;
    }

}

