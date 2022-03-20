pragma solidity ^0.5.16;
import "hardhat/console.sol"; 
contract owned{
        address public owner;

        constructor() public  {
            owner = msg.sender;
        }

        modifier onlyOwner {
            require(msg.sender == owner);
            _;
        }

        function transferOwnership(address newOwner) onlyOwner public{
            owner = newOwner;
        }
    }


contract MyTokenComplete is owned{
    string public name;
    string public symbol;
    uint8 public decimals = 18;
    uint public totalSupply = 100000e18;
 
    mapping(address => uint256) public _balanceOf;
    mapping(address => mapping(address => uint256)) public allowence;

    event   Transfer(address indexed _from, address indexed _to, uint tokens);
    event   Approval(address indexed _tokenOwner, address indexed _spender, uint tokens);
    event   Burn(address indexed _from, uint value);

    constructor(string memory tokenName, string memory tokenSymbol) public {
//        totalSupply = initailSupply;
        _balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
    }

    function _transfer(address _from, address _to, uint _value) internal {
        require(_balanceOf[msg.sender]>=_value);
        require(_balanceOf[_to] + _value >= _balanceOf[_to]);
        _balanceOf[msg.sender] -= _value;
        _balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
       
    }

    function transfer(address _to, uint256 _value) public returns(bool success){
        _transfer(msg.sender, _to, _value);
        console.log("transfer called");
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= allowence[_from][msg.sender]);
        allowence[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        console.log("transferFrom called");
        return true;
    }

    function balanceOf(address account) external view returns (uint){
        console.log("balanceOf called");
       return _balanceOf[account];
    }

    function approval(address _spender, uint256 _value) public returns (bool success){
         console.log("approval called");
        allowence[msg.sender][_spender] =_value;
        emit Approval (msg.sender, _spender, _value);
        return true;
    }

   

    function mintToken(address target, uint256 mintedAmount) onlyOwner public{
        _balanceOf[target] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(address(0), target, mintedAmount);
       
    }


    function burn(uint256 _value) onlyOwner public returns(bool success){
        require(_balanceOf[msg.sender] >= _value);
        _balanceOf[msg.sender] -= _value;
        totalSupply -= _value;
        emit Burn(msg.sender, _value);
        return true;
    }

}

