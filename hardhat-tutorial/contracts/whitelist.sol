//  SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;


contract Whitelist {

    // maximum number of whitelist
   uint8 public maxWhitelistedAddresses;

    //map whitelisted address to a boolean. set bpplean to true to keep track of whitelisted addresses 
   mapping(address => bool) public whitelistedAddresses;

    // set maximum number of whitelist by users once deployed
   constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
   }


    // keeps tract of total number of whitelists
   uint8 public numAddressesWhitelisted;


    // we can write a modifier instead of too many require in our function
    // modifier validateAddress() {
    //     require(!whitelistedAddresses[msg.sender], 'you are already whitelisted');
    //     _;
    // }

    // modifier validateNumbersOfWhitelist() {
    //      require(numAddressesWhitelisted < maxWhitelistedAddresses, 'Maximum number of whitelisted addresses reached');
    //     _;
    // }


    // function to add address to whitelist
   function whitelistAddress() public {
    // check if addresses is already whitelisted, else throw an error
    require(!whitelistedAddresses[msg.sender], 'you are already whitelisted');

    // check if max number of whitelisted has been reached
    require(numAddressesWhitelisted < maxWhitelistedAddresses, 'Maximum number of whitelisted addresses reached');
    

    // set address to through
    whitelistedAddresses[msg.sender] = true;

    // increment number of whitelist
    numAddressesWhitelisted += 1;



   }
}