// SPDX License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom{
    enum Statuses{
        Vacant,
        Occupied
    }
    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);
    // the event is defined here
    // this tells the address of the person that booked the hotel room and the amount paid.

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant{
        require (currentStatus == Statuses.Vacant, "Currently occupied");
        _;
    }

    modifier costs{
        require (msg.value >= 2 ether,"Not enough ether provided");
        _;
    }
    function book() public payable onlyWhileVacant costs{
       // owner.transfer(msg.value);
        (bool sent, ) = owner.call{value:msg.value}((""));
        // (status of the transaction, ie, check if transfer was successful, ) 
        //= {value passed in} (("what is to be sent in"));
        require (sent); //this line requires the funds transfer to the user was successful before
        //the event gets emitted. This keeps you from sending to the wrong place.
        currentStatus = Statuses.Occupied; //Use '=' for assignment, not '=='


        emit Occupy(msg.sender, msg.value);
        // the event is called here
        // this will tell us anytime someone booked a room like this or
        // see an entire log of bookings that take place
    }
}

    //Ether payments
    //Modifiers
    //Visibility
    //Events
    //Enums

}