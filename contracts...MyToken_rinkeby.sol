pragma solidity ^0.5.16;
 
contract MyToken_rinkeby {

    string public name = "Alex";  
    
    string public symbol = "AT";

    uint8 public constant decimals = 18;
   
    uint _totalSupply = 10000e18;

    mapping(address => uint) public _balanceOf;
    mapping(address => mapping(address => uint256)) public _allowance;
    
    event   Transfer(address indexed _from, address indexed _to, uint tokens);
    event   Approval(address indexed _tokenOwner, address indexed _spender, uint tokens); 
    event   Burn(address indexed, uint value);
    
    constructor() public {
        _balanceOf[msg.sender] = _totalSupply;
    }

    function totalSupply() external view returns (uint){
           return _totalSupply;
    }

    function balanceOf(address account) external view returns (uint){
            return _balanceOf[account];
    }

    function transfer(address _to, uint256 _value) public returns(bool success){
        require(_balanceOf[msg.sender] >= _value);
        _balanceOf[msg.sender] -= _value;
        _balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);   
        return true;
    }

    function approval(address _spender, uint256 _value) public returns (bool success){
        _allowance[msg.sender][_spender] =_value;
        emit Approval (msg.sender, _spender, _value);
        return true;
    }
    
    function allowance(address account, address spender) external view returns (uint) {
        return _allowance[account][spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= _allowance[_from][msg.sender]);
        _allowance[_from][msg.sender] -= _value;
 
        _balanceOf[_from] -= _value;
        _balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);  
        return true;
    }

   
    function mintToken(address target, uint256 mintedAmount) public{
        _balanceOf[target] += mintedAmount;
        _totalSupply += mintedAmount;
        emit Transfer(address(0), target, mintedAmount);
       
    }

    function burn(uint256 value) public returns(bool success){
        require(_balanceOf[msg.sender] >= value);
        _balanceOf[msg.sender] -= value;
        _totalSupply -= value;
        emit Burn(msg.sender, value);
        emit Transfer(msg.sender, address(0), value);
        return true;
    }



}