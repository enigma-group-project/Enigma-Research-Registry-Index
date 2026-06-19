// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
/// @title IssuerRegistry — Slice 1 (Publisher Registration)  [STUDENT TEMPLATE]
contract IssuerRegistry is Ownable {
    mapping(address => bool) public isPublisher;
    event CuratorTransferred(address indexed from, address indexed to);
    event PublisherRegistered(address indexed publisher, address indexed by);
    event PublisherDeregistered(address indexed publisher, address indexed by);
    error NotCurator(); error ZeroAddress();
    modifier onlyCurator() { if (msg.sender != owner()) revert NotCurator(); _; }
    constructor() Ownable(msg.sender) { emit CuratorTransferred(address(0), msg.sender); }
    function curator() external view returns (address) { return owner(); }
    function registerPublisher(address account) external onlyCurator { revert("TODO(member1): implement registerPublisher"); }
    function deregisterPublisher(address account) external onlyCurator { revert("TODO(member1): implement deregisterPublisher"); }
    function transferCurator(address newAdmin) external onlyCurator { revert("TODO(member1): implement transferCurator"); }
}
