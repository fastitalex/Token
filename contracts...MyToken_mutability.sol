pragma solidity ^0.5.16;
 
contract MyToken_mutability {
    
    string public tokenName;
    uint internal balance;
    uint private totalSupply;
    
    constructor() public {
        tokenName = "Alex"; 
        totalSupply = 5000;
        balance = 1000;
    }
    

    function setBalance() public {
        balance = 2000;
    }

    function getBalance() public view returns(uint){
        return balance;
    }

    function getResult(uint x, uint y) internal pure returns(uint){
        return x*y;
    }
    
    function payTo(address payable _to) public payable{
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }


}

