pragma solidity ^0.5.16;
 
contract MyToken_function {
    
    string public tokenName;
    uint internal balance;
    uint private totalSupply;
    
    constructor() public {
        tokenName = "Alex"; 
        totalSupply = 5000;
        balance = calBalance(5);
    }

    function getBalance() public view returns(uint){
        return balance;
    }

    function calBalance(uint x) internal view returns(uint){
        return totalSupply / x;
    }

}

