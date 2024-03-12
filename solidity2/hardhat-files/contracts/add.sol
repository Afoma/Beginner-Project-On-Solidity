// SPDX-License-Identifier: GPL-30

pragma solidity  >=0.7.0 <0.9.0;

contract AddSum{
    uint sum;

    function addNum(uint x,uint y) public {
        sum = x + y;
    }
    function getSum() public view returns (uint) {
        return sum;
    }
}