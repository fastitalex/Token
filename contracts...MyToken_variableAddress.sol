pragma solidity ^0.5.16;
 
contract MyToken_variableAddress {
  
    address payable owner;

    constructor() public {
        owner = msg.sender;
    }

    function getOwnerBalance() public view returns(uint){
        return owner.balance;
    } 

    function getOwnerAdress() public view returns(address){
        return owner;
    }

    function transerEth() public payable returns(bool){      
        owner.transfer(msg.value);
        return true;
    }
 
}   