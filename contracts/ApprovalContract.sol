pragma solidity ^0.6.4;

contract ApprovalContract {
    address public sender;
    address public receiver;
    address public constant approver = ;

    function deposit(address _receiver) external payable {
        require(msg.value > 0, "Error deposit");
        sender = msg.sender;
        receiver = _receiver;
    }

    function viewApprover() external pure returns(address) {
        return(approver);
    }

    function approve() external {
        require(msg.sender == approver, "Error approve");
        receiver.transfer(address(this).balance);
    }
}