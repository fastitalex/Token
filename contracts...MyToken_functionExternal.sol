pragma solidity ^0.5.16;
 
contract MyToken_functionExternal {
    
    string public tokenName;
    uint internal balance;
    uint private totalSupply;
    
    constructor() public {
        tokenName = "Alex"; 
        totalSupply = 5000;
    //    balance = this.calBalance(5);
    }

    function pubBalance(uint[2] memory a) public pure returns(uint){
        return a[0];
    }

    function extBalance(uint[2] calldata x) external pure returns(uint){
        return x[0];
    }

}

