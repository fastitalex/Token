
pragma solidity ^0.5.16;
 
import "hardhat/console.sol"; 
contract MyToken_transfer {

  
    string public name ="Alex";  // 要定義，不然在metamask 無法實現轉帳功能
    string public symbol ="AT";

    mapping(address => uint) public _balanceOf;
    mapping(address => mapping(address => uint)) public allowance;
    uint8 public constant decimals = 18;
    uint _totalSupply = 100000e18;
    
    event   Transfer(address indexed _from, address indexed _to, uint tokens);
 //   event   Approval(address indexed _tokenOwner, address indexed _spender, uint tokens);
    
    constructor() public {
       _balanceOf[msg.sender] = _totalSupply;
    }

    function totalSupply() external view returns (uint){
        return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint){
        return _balanceOf[account];
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

/*
    function transfer(address _to, uint256 _value) external returns(bool success){
        console.log("transfer called");
        require(_balanceOf[msg.sender]>=_value);
        require(_balanceOf[_to] + _value >= _balanceOf[_to]);
        _balanceOf[msg.sender] -= _value;
        _balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
*/

/*
    function approval(address _spender, uint256 _value) public returns (bool success){
        console.log("approval called");
        allowance[msg.sender][_spender] =_value;
        emit Approval (msg.sender, _spender, _value);
        return true;
    }

 
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= allowance[_from][msg.sender]);
        allowance[_from][msg.sender] -= _value;
         _transfer(_from, _to, _value);
      
        return true;
    }

*/
  



}