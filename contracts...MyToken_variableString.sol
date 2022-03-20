pragma solidity ^0.5.16;
 
contract MyToken_variableString {
   
    string public tokenName = "AT";
    bytes32 public company = "AT";
    
    function getTokenName() public view returns(string memory){
        return tokenName;
    } 

    function getCompany() public view returns(bytes32){
        return company;
    }

}   