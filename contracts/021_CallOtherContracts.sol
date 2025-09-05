// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract OtherContract {
    uint256 private _x = 0;
    event Log(uint amount, uint gas);

    function getBalance() view public returns(uint) {
        return address(this).balance;
    }

    function setX(uint256 x) external payable {
        _x = x;
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns(uint x) {
        x = _x;
    }
}

contract callContract {
    // input contract address
    function callSetX(address _Address, uint256 x)  external {
        OtherContract(_Address).setX(x);
    }

    // input contract variable
    function callGetX(OtherContract _Address) external view returns(uint x) {
        x = _Address.getX();
    }

    // create contract variable
    function callGetX2(address _Address) external view returns(uint x) {
        OtherContract oc = OtherContract(_Address);
        x = oc.getX();
    }

    // call contract and transfer
    function setXTransferETH(address otherContract, uint256 x) payable external {
        OtherContract(otherContract).setX{value: msg.value}(x);
    }
}