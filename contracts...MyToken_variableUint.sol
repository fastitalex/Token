pragma solidity ^0.5.16;
 
contract MyToken_variableUint {
  
    uint internal totalSupply = 100_000_000_000;
    uint8 internal decimals = 18;

    function getOverflow() public pure returns(uint8){
        uint8 result = 255 ;
        return result + 1;
    } 

    function getUnderflow() public pure returns(uint8){
        uint8 result = 0 ;
        return result - 1;
    }

 
}   