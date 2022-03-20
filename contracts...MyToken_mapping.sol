pragma solidity ^0.5.16;
 
contract MyToken_mapping {
    
    address payable owner;
    mapping (address => uint) public balance;
 
    constructor(uint totalSupply) public { 
        owner = msg.sender;
        balance[owner] = totalSupply;
    }
 
    function transferTo(address to, uint value) public {
        balance[owner] -= value;
        balance[to] += value; 
    }


    function swap() public payable{
        owner.transfer(msg.value);
        uint swapAmount = msg.value *10 / 1 ether;
        balance[owner] -= swapAmount;
        balance[msg.sender] += swapAmount; 
        
    }

}

