// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStorage {
    event DataStored(address indexed sender, string data, uint256 timestamp);
    
    function storeDataViaEvent(string memory data) public {
        payable(address(0)).transfer(0);
        emit DataStored(msg.sender, data, block.timestamp);
    }
    
    function sendHexData(bytes memory data) public {
        address payable zeroAddress = payable(address(0));
        (bool success, ) = zeroAddress.call{value: 0}(data);
        require(success, "Transaction failed");
        
        string memory dataString = string(data);
        emit DataStored(msg.sender, dataString, block.timestamp);
    }
}


