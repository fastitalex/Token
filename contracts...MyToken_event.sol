pragma solidity ^0.5.16;
 
contract MyToken_event {

	event Transfer(address from, address to, uint indexed value);
 

	function transferTo(address payable to) payable public{
		to.transfer(msg.value);
		emit Transfer(msg.sender, to, msg.value);
	}
}