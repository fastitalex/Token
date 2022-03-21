pragma solidity ^0.5.16;
 
contract MyToken_errorHanle {
    
    address payable owner;
    mapping (address => uint) public balance;
 
    constructor(uint totalSupply) public { 
        owner = msg.sender;
        balance[owner] = totalSupply;
    }
 
    function transferTo(address to, uint value) public {
        require(balance[owner] > value, "not enough balance");
        balance[owner] -= value;
        balance[to] += value; 
    }


}

