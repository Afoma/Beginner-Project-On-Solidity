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
First, the `address` is a state variable because it is declared in a contract but outside of a function, just like global variables are declared outside of a function.
It represents the owner's address to whom payment is made on the blockchain. 
The `address` is declared `address payable public owner`. This declaration has two notable keywords: `payable` and `public`. `payable` means that the `address` can handle ether transactions. `public` means that Here are two primary uses of the public keyword in Solidity: 1. When applied to a state variable, the `public` keyword automatically generates a getter function with the same name as the variable. This getter function allows external contracts to retrieve the current value of the variable. Here is a brief explanation to learn more about `address`. 2. When applied to a function, the `public` keyword specifies that the function can be called from outside the contract. It essentially makes the function externally accessible.
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
A few things to know about a constructor function (according to chat GPT):
- it is a special function that is executed only once when a contract is deployed to the Ethereum blockchain. This ensures that the setup tasks are performed only at the contract's creation.
- it is used to initialise a state variable or the initial state of a smart contract. It sets the initial values of state variables, configures the contract, and ensures the contract is in a proper initial state.
- it does not have a return type, has the same name as the contract, and cannot be called explicitly like a regular function.
- 
![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/a4c9bae0-99c7-484e-97e1-5a0895903b18)

- the constructor can use modifiers to enforce conditions during deployment, ensuring that the contract is deployed in a secure and valid state.
- 
![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/b4777959-d183-4887-aec7-d5f623ae10b0)

Since the constructor sets the initial state of the contract, it is understandable why the initial state of the `HoteRoom` contract is set to be `Vacant`.

You might be wondering what `msg.sender` does, Chat GPT: In Solidity, `msg.sender` is a globally available variable that represents the address of the account (or contract) that is currently calling or executing a function. It provides a way to identify and verify the sender of the transaction. Here's a breakdown of its usage:

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/c4792305-98ee-4c19-8d9f-bc9416991df4)

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/aa9c44b4-bd74-431d-b574-5ad23bec815d)

In the constructor, msg.sender is used to set the owner variable to the address that deploys (creates) the contract. This is a common pattern to identify the creator of the contract as its owner.

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/c71149c4-11eb-4a07-9823-070fd5cf92f5)

In the checkOwner function, msg.sender is used to check if the caller of the function is the same as the owner. The function returns true if the caller is the owner and false otherwise.

msg.sender is frequently used for access control and authentication in smart contracts. By comparing msg.sender to predefined addresses or roles, you can restrict certain functions to specific individuals or contracts. It's important to note that msg.sender represents the address initiating the transaction, and it can be different from the originating external user or contract. If a contract A calls a function in contract B, then in that function, msg.sender in contract B will be the address of contract A, not the external user who triggered the initial transaction.
msg.sender is frequently used for access control and authentication in smart contracts. By comparing msg.sender to predefined addresses or roles, you can restrict certain functions to specific individuals or contracts. It's important to note that msg.sender represents the address initiating the transaction, and it can be different from the originating external user or contract. If contract A calls a function in contract B, then in that function, msg.sender in contract B will be the address of contract A, not the external user who triggered the initial transaction.
## enums
`enum` is a data structure in Solidity that represents a collection of options that will never change. To understand `enum` better, picture it as a sign that displays options for you to select from. For example, a green button inscribed "to be" and a red button inscribed "not to be". `enum` is perfect for keeping track of statuses or states. Hotel room occupancy is a perfect example of how `enum` works because they are either "vacant" or "occupied".

According to chat GPT, Enums are a data type in Solidity that allows you to create a user-defined set of named values.
Here's the basic syntax for declaring an enum in Solidity:

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/694a0764-eb3a-4551-8e0f-7d50b2dfe340)

In this example:
- the `enum` keyword is used to declare the enumeration type called Statuses.
- inside the enumeration, you define a set of named values (Pending, Approved, and Rejected in this case).

Here's how you might use an enum in a function:

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/a0f75755-8a88-4c72-af5c-eab6937568b6)

Enums are often used in contracts to improve code readability, make the code more self-documenting, and reduce the risk of errors by restricting variables to a specific set of values. They are especially useful when a variable represents a state or status that can only be in a certain number of predefined states.

Do you know why `currentStatus` was created and what it does?

chat GPT explains it as a state variable of the `Statuses` enumeration type. The purpose of this variable is to keep track of the current status of the hotel room, which can be either "Vacant" or "Occupied." Let's break down the code: 

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/b2b47448-42a5-4e30-8845-0c94e3299475)

Here's a brief explanation:

1. Enum Declaration (enum Statuses {Vacant, Occupied}):
- The enum keyword is used to declare an enumeration type called Statuses.
- Inside the enumeration, two possible values are defined: Vacant and Occupied.
- Enums are used to create a set of named integer constants, providing a way to represent a set of discrete values.
2. State Variable (Statuses public currentStatus):
- currentStatus is a state variable of type Statuses, meaning it can hold one of the values defined in the Statuses enumeration.
- The public visibility modifier allows external contracts to read the value of currentStatus.

In the context of a hotel room, the currentStatus variable helps track whether the room is vacant or occupied. This could be useful for various purposes, such as:
- Booking Management: The contract could have functions that allow users to book a room. When a room is booked, `currentStatus` could be set to "Occupied," and when a booking is cancelled and the guest checks out, it could be set back to "Vacant."
- Access Control: The status could be used to control access to the room. For example, certain operations might only be allowed when the room is vacant.
- User Interface: The contract could expose the `currentStatus` through functions that provide information about the room's availability. This information can be used in a user interface or by other smart contracts.
In summary, `currentStatus` is a state variable used to represent the current status of a hotel room in terms of whether it is vacant or occupied. The `enum` helps ensure that the status is restricted to a predefined set of values.

## function
Understand a function as a robot or a button which executes given commands when it is called or pressed. 

![image](https://github.com/Afoma/Beginner-Project-On-Solidity/assets/48632890/431519b9-7f0f-4d76-82a7-0c6a58cf7f0d)

What happens in `function book` is that for it to run, two demands must be met: 1. the current status of the hotel room must be vacant or an error message of "Currently occupied" will be displayed. 2. the amount of ether to be paid must be greater than or equal to 2 ether or it will display an error message of "Not enough ether provided". If these two requirements are met, an amount will be transferred to the owner's address and the status of the hotel room will change from vacant to occupied.
