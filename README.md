# Beginner-Project-On-Solidity
Beginner project on Solidity
In the first line, the comment `// SPDX-License-Identifier: MIT` indicates the license under which the code is distributed which is MIT. 
The second line specifies the compiler version that should be used to compile the smart contract.
These two lines above are compulsory for the smart contract to compile.
In this tutorial, we will understand
- Ether payments
- Modifiers
- Visibility
- Events
- Enuums
To better understand a smart contract, I would have to see the smart contract as a box that contains many players:
## `contract`
The `contract` contains all the players in a smart contract. If there are no errors, the smart contract will compile and be executed.
## `address` 
First of all, the `address` is a state variable because it is declared in a contract but outside of a function. Just like we have global variables that are declared outside of a function.
represents the owner's address to whom payment is made on the blockchain. 
The `address` is declared `address payable public owner`. We can save the owner's address like this by assigning or hardcoding it like this `address payable public owner = Ox...`.
However, it's best to make it dynamic, so it is initialised by creating a constructor function.
## constructor function

