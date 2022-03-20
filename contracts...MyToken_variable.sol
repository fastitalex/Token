pragma solidity ^0.5.16;
 
contract MyToken_variable {
    
    string public tokenName;
    uint internal balance;
    uint private totalSupply;
    
    constructor() public {
        tokenName = "Alex"; 
        totalSupply = 5000;
        balance = 2000;
    }

}

/*
contract B is MyToken_variable{

    constructor() public {
        balance = 1000;
    }

}
*/