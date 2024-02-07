Before this file, we only discussed a smart contract that doesn't interact with other smart contracts. It rather just understands only the code inside of its own.

We will be talking about
- Inheritance
- Factories
- Interaction

We first of all create a smart contract that stores a state variable called a secret, stores it on-chain and only allows a certain person to read the secret.

## Inheritance

Inheritance is a way of enabling a smart contract to possess the behaviour, logic, and data of another smart contract.
By adding the keyword `is`, any smart contract in possession of that keyword can inherit the properties of another smart contract. To be able to inherit, add ` is` + `the name of the smart contract you want to inherit`.  For example: `is Ownable`. You can have a parent smart contract and a child smart contract and the child contract inherits from the parent contract.

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/77b102ce-9fb9-45a7-9cff-d15378769f5d)

`MySmartContract` inherits what is in `Ownable`. `Ownable` is the parent smart contract and `MySmartContract` is the child smart contract. To handle inheritance where constructors are involved, the secret keys and address wouldn't be added to the parent contract's constructor, and in the child contract's constructor, you would add the keyword `super` to call the constructor in the other smart contract. For example:

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/5051a892-f72e-4f91-9602-3b81a6f52cb6)

### How to interact with other smart contracts inside of a smart contract and how to deploy a new smart contract from a single smart contract

A factory is a smart contract that creates other smart contracts.

#### How to create a new smart contract inside of a smart contract

We would move the logic for creating the `secret` into the new smart contract we just created above `MySmartContract`.  We would call it `SecretVault` and it would serve as a place where we keep or save our secrets, then to create a new smart contract in our already existing smart contract, we would remove `secret= _secret;` and do this just above the `super` keyword.

`SecretVault _secretVault = new SecretVault(_secret);`    

#### A breakdown of the meaning of the code

##### `SecretVault`

This is the original smart contract. It is the parent contract. This just stands in as a type (just like unit, string, address, etc)

##### `_secretVault`

`secretVault` is a variable of `SecretVault`.

##### `=`

`=` assigns the new contract to the `SecretVault` contract.

##### `new`

It commands the creation of a new contract.

##### `SecretVault`

This is the new contract that is created in the child contract.

##### `(_secret)`

This is passed as an argument since the parent contract's constructor has it as an argument.

Now that we have created the new smart contract within our smart contract, we will create a new SecretVault address for reuse. We create it in MySmartContract. 
