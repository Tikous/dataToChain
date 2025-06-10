// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataStorage {
    // Event to emit when data is stored via event
    event DataStored(address indexed sender, string data, uint256 timestamp);
    
    // Function to store data using an event
    function storeDataViaEvent(string memory data) public {
        // Transfer 0 ETH to zero address
        payable(address(0)).transfer(0);
        
        // Emit event with data
        emit DataStored(msg.sender, data, block.timestamp);
    }
    
    // Function to store data using calldata
    function sendHexData(bytes memory data) public {
        // Transfer 0 ETH to zero address with data in calldata
        address payable zeroAddress = payable(address(0));
        
        // solhint-disable-next-line avoid-low-level-calls
        (bool success, ) = zeroAddress.call{value: 0}(data);
        require(success, "Transaction failed");
    }
}


