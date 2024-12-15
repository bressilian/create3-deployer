// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { CREATE3 } from "solady/src/utils/CREATE3.sol"; // Import CREATE3 utility
import { ICreate3Deployer } from "./ICreate3Deployer.sol"; // Import interface for Create3Deployer

/// @title Create3Deployer Contract
/// @notice This contract allows deploying contracts using CREATE3 and retrieving deployed contracts by salt.
contract Create3Deployer is ICreate3Deployer {
    
    /// @inheritdoc ICreate3Deployer
    /// @notice Deploys a contract using CREATE3 with a given salt and creation code.
    /// @param salt The unique salt value used to calculate the contract address.
    /// @param creationCode The bytecode for the contract to be deployed.
    /// @return deployedAddress The address of the deployed contract.
    function deploy(bytes32 salt, bytes calldata creationCode) external payable returns (address deployedAddress) {
        // Deploy contract and return the deployed address
        deployedAddress = CREATE3.deploy(salt, creationCode, msg.value);
    }

    /// @inheritdoc ICreate3Deployer
    /// @notice Retrieves the address of a contract deployed using CREATE3 by its salt.
    /// @param salt The unique salt value used to calculate the contract address.
    /// @return deployedAddress The address of the deployed contract.
    function getDeployed(bytes32 salt) external view returns (address deployedAddress) {
        // Return the address of the deployed contract from CREATE3
        deployedAddress = CREATE3.getDeployed(salt);
    }
}
