pragma solidity ^0.6.4;

contract ApprovalContract {
    address payable public sender;
    address payable public receiver;
    address public constant approver = 0xC5fdf4076b8F3A5357c5E395ab970B5B54098Fef;

    function deposit(address payable _receiver) external payable {
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