// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Board {
    //Number of total notes
    uint256 totalNotes;
    //Event for when a note is added
    event NewNote(address indexed from, uint256 timestamp, string message);

    struct Note {
        address owner; 
        string message; 
        uint256 timestamp; 
    }

    Note[] public notesArray;


    constructor() {
        console.log("Deploying Board Contract");
    }

  
    function postNote(string memory _message) public {
        totalNotes += 1;
        console.log("%s posted w/ message %s", msg.sender, _message);

        notesArray.push(Note(msg.sender, _message, block.timestamp));

        emit NewNote(msg.sender, block.timestamp, _message);
    }

   
    function getTotalWaves() public view returns (uint256) {
        return totalNotes;
    }
}