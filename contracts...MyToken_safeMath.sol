pragma solidity ^0.5.16;
 
import "./SafeMath.sol";
contract MyToken_safeMath {
    
    using SafeMath for uint;
    address payable owner;
    mapping (address => uint) public balance;
 
    constructor(uint totalSupply) public { 
        owner = msg.sender;
        balance[owner] = totalSupply;
    }
 
    function transferTo(address to, uint value) public {
        require(balance[owner] > value, "not enough balance");
        balance[owner] = balance[owner].sub(value);
        balance[to] = balance[to].add(value); 
    }
 

}

