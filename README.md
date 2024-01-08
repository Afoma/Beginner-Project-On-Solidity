# Beginner-Project-On-Solidity
Beginner project on Solidity
In the first line, the comment `// SPDX-License-Identifier: MIT` indicates the license under which the code is distributed, which is MIT. 
The second line specifies the compiler version that should be used to compile the smart contract.
These two lines above are compulsory for the smart contract to compile.
In this tutorial, we will understand
- Ether payments
- Modifiers
- Visibility
- Events
- Enums
To better understand a smart contract, I would have to see the smart contract as a box that contains many players:
## `contract`
The `contract` contains all the players in a smart contract. The smart contract will compile and be executed if there are no errors. 
## `address` 
First, the `address` is a state variable because it is declared in a contract but outside of a function just like we have global variables that are declared outside of a function.
represents the owner's address to whom payment is made on the blockchain. 
The `address` is declared `address payable public owner`. We can save the owner's address like this by assigning or hardcoding it like this `address payable public owner = Ox...`.
However, it's best to make it dynamic, so it is initialised by creating a constructor function.
## constructor function
A few things to know about a constructor function (according to chat gpt):
- it is a special function that is executed only once when a contract is deployed to the Ethereum blockchain
- it is used to initialise a state variable or the initial state of a smart contract
- it does not have a return type, has the same name as the contract, and cannot be called explicitly like a regular function
- the constructor can use modifiers to enforce conditions during deployment, ensuring that the contract is deployed in a secure and valid state
## enums
`enum` is a data structure in Solidity that is used to represent a collection of options that will never change. To understand `enum` better, picture is as a sign that displays options for you to select from. Example a green button on which is inscribed "to be" and a red button on which is inscribed "not to be". `enum` is perfect for keeping track of statuses or states. Hotel room occupancy are perfect examples to demonstrate how `enum` works because they are either "vacant" or "occupied".
## function
Understand a function as a robot or a button which is made of so many commands which executes its role(s) when it is called or pressed.

