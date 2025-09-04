// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract DataStorage {
    function fCallData(uint[] calldata _x) public pure returns(uint[] calldata) {
        // errror
        // _x[0] = 1; 
        return (_x);
    }

    uint[] xxx = [1,2,3];

    function fStorage() public {
        uint[] storage xStorage = xxx;
        xStorage[0] = 100;
    }

    uint public x= 1;
    uint public y = 2;
    string public z;

    function foo() external {
        x = 5;
        y = 6;
        z = "0xAA";
    }

    function bar() external pure returns(uint) {
        uint xx = 1;
        uint yy = 2;
        uint zz = xx + yy;
        return (zz);
    }

    function global() external view returns(address, uint, bytes memory) {
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return (sender, blockNum, data);
    }

    function weiUnit() external pure returns(uint) {
        assert(1 wei == 1e0);
        assert(1 wei == 1);
        return 1 wei;
    }

    function gweiUnit() external pure returns(uint) {
        assert(1 gwei == 1e9);
        assert(1 gwei == 1000000000);
        return 1 gwei;
    }

    function etherUnit() external pure returns(uint, uint) {
        assert(1 ether == 1e18);
        uint xyz = 123;
        assert(1 ether == 1000000000000000000);
        return (1 ether, xyz);
    }
}
