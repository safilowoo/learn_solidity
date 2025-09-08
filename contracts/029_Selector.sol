// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.7 <0.9.0;

contract DemoContract {}

contract Selector {
    event Log(bytes data);
    event SelectorEvent(bytes4 selector);

    function mint(address to) external {
        emit Log(msg.data);
    }

    function mintSelector() external pure returns (bytes4  mSelector) {
        mSelector =  bytes4(keccak256("mint(address)"));
    }
    
    function elementaryParamSelector(uint256 param1, bool param2) external returns(bytes4 selectorWithElementaryParam) {
        emit SelectorEvent(this.elementaryParamSelector.selector);
        return bytes4(keccak256("elementaryParamSelector(uint256,bool)"));
    }

    function fixedSizeParamSelector(uint256[3] memory param1) external returns(bytes4 selectorWithFixedSizeParam) {
        emit SelectorEvent(this.fixedSizeParamSelector.selector);
        return bytes4(keccak256("fixedSizeParamSelector(uint256[3])"));
    }

    function nonFixedSizeParamSelector(uint256[] memory param1, string memory param2) external returns(bytes4 selectorWithNonFixedSizeParam) {
        emit SelectorEvent(this.nonFixedSizeParamSelector.selector);
        return bytes4(keccak256("nonFixedSizeParamSelector(uint256[), string"));
    }

    struct User {
        uint256 id;
        bytes name;
    }

    enum School {
        SCHOOL1,
        SCHOOL2,
        SCHOOL3
    }

    function mappingParamSelector(DemoContract demo, User memory user, uint256[] memory count, School mySchool) external returns(bytes4 selectorWithMappingParam) {
        emit SelectorEvent(this.mappingParamSelector.selector);
        return bytes4(keccak256("mappingParamSelector(address, (uint256, bytes), uint256[], uint8)"));
    }

    function callWithSignature() external {
        (bool success1, bytes memory data) = address(this).call(abi.encodeWithSelector(0x3ec37834, 1, 0));
    }
}