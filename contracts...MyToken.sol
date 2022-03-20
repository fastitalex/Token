
pragma solidity ^0.5.16;
 
contract MyToken {


    uint totalSupply;


    constructor(uint initialSupply) public {
        totalSupply = initialSupply; 
    }


    function getTotalSupply() public view returns(uint initialSupply){
        return totalSupply;
    }


}