pragma solidity ^0.5.16;
 
contract MyToken_inheritance {
    
    string public tokenName;
    uint internal balance;
    uint private totalSupply;
    
    constructor() public {
        tokenName = "Alex"; 
        totalSupply = 5000;
        balance = 2000;
    }

    function getTotalSupply() public view returns(uint);

}

contract B is MyToken_inheritance{

    uint totalSupply;
    constructor() public{
       
        tokenName = "Blex";
        balance = 1000;
        totalSupply = 2000;
    }

    function getTotalSupply() public view returns(uint){
        return totalSupply;
    }

}