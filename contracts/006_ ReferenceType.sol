// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract ReferenceType {
    uint[8] array1;
    bytes1[6] array2;
    address[101] array3;
    uint[] array4;
    bytes1[] array5;
    address[] array6;
    bytes array7;

    function f() public pure {
        g([uint(1),2,3]);
    }

    function g(uint[3] memory _data) public pure returns(uint[3] memory, uint[] memory) {
        uint[] memory array8 = new uint[](6);
        array8[2] = _data[1];
        return (_data, array8);
    }

    
    struct Student {
        uint256 id;
        uint256 score;
    }

    Student student;

    function initStudent1() external {
        Student storage _student = student;
        _student.id = 134;
        _student.score = 293;
    }

    function initStudent2() external {
        student.id = 3344;
        student.score = 2139334;
    }

    function initStudent3() external {
        student = Student(2222, 555555);
    }

    function initStudent4() external {
        student = Student({id: 33333, score: 444444});
    }
} 