// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

    // Inheritance
    // Factories
    // Interaction

contract Ownable{
    address owner;
    modifier onlyOwner(){
        require(msg.sender == owner, "must be owner");
        _;
    }
    constructor(){
        owner= msg.sender;
    }
}
contract SecretVault {
    string secret;
    constructor(string memory _secret) {
        secret= _secret;
    }
    function getSecret() public view returns(string memory){
        return secret;
    }
}
contract MySmartContract is Ownable{
    address secretVault;
    constructor(string memory _secret) { //local variable that is passed in as an argument when the function is called
        super;
        SecretVault secretVaultContract  = new SecretVault(_secret);
        secretVault = address(secretVaultContract); 
    }
    function getSecret() public view onlyOwner returns(string memory){
        return SecretVault(secretVault).getSecret();
    }
}