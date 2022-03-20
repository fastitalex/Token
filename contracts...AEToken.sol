pragma solidity ^0.5.16;

library SafeMath {

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);  // check overflow 
      return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a); // check underflow
      return a - b;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a * b;
      assert(a == 0 || c / a == b); // multiplication overflow
      return c;
    }
 
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b > 0); // Solidity automatically throws when dividing by 0
      uint256 c = a / b;
      return c;
    }

}

contract AEToken {
    using SafeMath for uint;

    string public name = "Alex Ecommerce";
    string public symbol = "AET";
    uint8 public decimals = 18;
    uint public totalSupply;
 
    // 發行總量上限 1億
    uint public capped = 100_000_000e18;
   
     // 已鑄幣總量
    uint public totalMinted;

    // 燒幣暫存區
    address public burnBuffer;

    address public owner;

    mapping(address => uint256) public _balanceOf;
    mapping(address => mapping(address => uint256)) public allowence;

    event   Transfer(address indexed _from, address indexed _to, uint tokens);
    event   Approval(address indexed _tokenOwner, address indexed _spender, uint tokens);
    event   Burn(address indexed _from, uint value);

    constructor(address _burnBuffer ) public {
        owner = msg.sender;
        _balanceOf[owner] = capped / 10;    // 公司持有10%的總量
        totalSupply = totalSupply.add(capped /10); 
        burnBuffer = _burnBuffer;  // 設定燒幣暫存區的地址
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
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
        require(_value <= allowence[_from][msg.sender]);
        allowence[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }

    function balanceOf(address account) external view returns (uint){
       return _balanceOf[account];
    }

    function approval(address _spender, uint256 _value) public returns (bool success){
        allowence[msg.sender][_spender] =_value;
        emit Approval (msg.sender, _spender, _value);
        return true;
    }

   

    function mintToken(address target, uint256 mintedAmount) public{
        require(msg.sender == owner);
        require(totalMinted < capped / 10 * 9);  // 已鑄幣總量不能大於9千萬個
        totalMinted = totalMinted.add(mintedAmount);

        _balanceOf[target] = _balanceOf[target].add(mintedAmount);
        totalSupply = totalSupply.add(mintedAmount);
        emit Transfer(address(0), target, mintedAmount);
       
    }


    function burn(uint256 _value) public returns(bool success){
        require(msg.sender == owner); 
        require(_balanceOf[burnBuffer] >= _value);  // 燒毀的數量需小於燒幣暫存區
       
        _balanceOf[burnBuffer] = _balanceOf[burnBuffer].sub(_value);
        totalSupply = totalSupply.sub(_value);
        
        emit Burn(msg.sender, _value);
        emit Transfer(burnBuffer, address(0), _value);
        return true;
    }

}

