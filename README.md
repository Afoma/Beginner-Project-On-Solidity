# Beginner-Project-On-Solidity

Note that Solidity is primarily designed for writing smart contracts on the Ethereum blockchain and, hence, does not handle transactions of other cryptocurrencies directly.

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
First, the `address` is a state variable because it is declared in a contract but outside of a function, just like we have global variables that are declared outside of a function.
represents the owner's address to whom payment is made on the blockchain. 
The `address` is declared `address payable public owner`. This declaration has two important keywords: `payable` and `public`. `payable` means that the `address` can handle ether transactions. Here is a brief explanation to learn more about `address`. 
According to chat GPT,  When it comes to addresses, there are two primary types: address and address payable. The choice between these two types relates to how the contract handles Ether transactions.
1. `address` Type:
- Used for storing addresses and generally used for contracts that don't involve Ether transactions.
- Doesn't have Ether transfer methods like transfer or send.
- Cannot directly send Ether to an address variable.
![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/84f3779f-9511-48f1-b9d6-45e0203180a9)
2. `address payable` Type:
- Specifically designed for handling Ether transactions.
- Includes additional functions like transfer and send for sending Ether to other addresses.
- Necessary when you want to send Ether from one contract to another or an externally owned account.
![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/0711fbfa-a049-4859-96fe-052445784e4f)
Now, regarding the dynamic nature of variables, it's essential to clarify that in Solidity, the size of storage variables (like address) is known at compile time, and these variables are not dynamically resizable in the same way arrays are.
However, if you are dealing with an array of addresses or a dynamic list of addresses, you might use a dynamic data structure like a dynamic array (e.g., address[]) or a mapping.
Here's an example of using a dynamic array of addresses:
![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/2b62053f-894b-4770-a59e-effba1f48f36)

We can save the owner's address by assigning or hardcoding it like this `address payable public owner = Ox...`.
However, it's best to make it dynamic, so it is initialised by creating a constructor function.
## constructor function
A few things to know about a constructor function (according to chat gpt):
- it is a special function that is executed only once when a contract is deployed to the Ethereum blockchain
- it is used to initialise a state variable or the initial state of a smart contract
- it does not have a return type, has the same name as the contract, and cannot be called explicitly like a regular function
- the constructor can use modifiers to enforce conditions during deployment, ensuring that the contract is deployed in a secure and valid state
## enums
`enum` is a data structure in Solidity that represents a collection of options that will never change. To understand `enum` better, picture it as a sign that displays options for you to select from. For example, a green button on which is inscribed "to be" and a red button on which is inscribed "not to be". `enum` is perfect for keeping track of statuses or states. Hotel room occupancy is a perfect example to demonstrate how `enum` works because they are either "vacant" or "occupied".
## function
Understand a function as a robot or a button which is made of so many commands which execute its role(s) when it is called or pressed. 

