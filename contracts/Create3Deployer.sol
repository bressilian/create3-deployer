// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { CREATE3 } from "solady/utils/CREATE3.sol";

contract Create3Deployer {
    /// @notice Deploys a contract using CREATE3
    /// @param salt The salt to use for deployment
    /// @param creationCode The contract creation code
    /// @return deployed The address of the deployed contract
    function deploy(bytes32 salt, bytes calldata creationCode) external payable returns (address) {
        return CREATE3.deploy(salt, creationCode, msg.value);
    }

    /// @notice Predicts the address of a deployed contract
    /// @param salt The salt to use for deployment
    /// @return deployed The address of the contract that will be deployed
    function getDeployed(bytes32 salt) external view returns (address) {
        return CREATE3.getDeployed(salt);
    }
}
