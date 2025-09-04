// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import "hardhat/console.sol"; 

contract Yeye {
    event Log(string msg);

    function hip() public virtual {
        emit Log("Yeye");
    }

    function pop() public virtual {
        emit Log("Yeye");
    }


    function yeye() public virtual {
        emit Log("Yeye");
    }
}

contract Baba is Yeye {
    function hip() public virtual override {
        emit Log("Baba");
    }

    function pop() public virtual override {
        emit Log("Baba");
    }

    function baba() public virtual {
        emit Log("Baba");
    }

    function callParent() public {
        Yeye.pop();
    }
}

contract Erzi is Yeye, Baba {
    function hip() public override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function pop() public override(Yeye, Baba) {
        emit Log("Erzi");
    }

    function erzi() public  {
        emit Log("Erzi");
    }

    function callParent2() public {
        super.pop();
    }
}

contract Base1 {
    modifier exactDividedBy2And3(uint _a) virtual {
        console.log("111111, " , _a);
        require(_a % 2 == 0 && _a % 3 == 0);
        console.log("222222, " , _a);
        _;
    }
}

contract Identifier is Base1 {
    // modifier exactDividedBy2And3(uint _a) override {
    //     _;
    //     console.log("4444, " , _a);
    //     require(_a % 2 == 0 && _a % 3 == 0);
    //     console.log("55555, " , _a);
    // }
    function getExactDividedBy2And3(uint _dividend) public exactDividedBy2And3(_dividend) pure returns(uint, uint) {
        console.log("3333333");
        return getExactDividedBy2And3WithoutModifier(_dividend);
    }

    function getExactDividedBy2And3WithoutModifier(uint _dividend) public pure returns(uint, uint) {
        uint div2 = _dividend / 2;
        uint div3 = _dividend / 3;
        return (div2, div3);
    }
}

contract A {
    uint public a;
    constructor(uint _a) {
        a = _a;
    }
}

contract C is A(2) {
    function getAValue() public view  {
        console.log("contract C", a);
    }
}

contract D is A {
    constructor(uint _d) A(_d * _d) {
        
    }

    function getAValue() public view  {
        console.log("contract D", a);
    }
}

contract God {
    event Log(string message);

    function foo() public virtual {
        emit Log("God.foo called");
    }

    function bar() public virtual {
        emit Log("God.bar called");
    }
}

contract Adam is God {
    function foo() public virtual override {
        emit Log("Adam.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Adam.bar called");
        console.log('Adam.bar called');
        // super.bar();
    }
}

contract Eve is God {
    function foo() public virtual override {
        emit Log("Eve.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Eve.bar called");
        super.bar();
    }
}

contract people is Adam, Eve {
    function foo() public override(Adam, Eve) {
        super.foo();
    }

    function bar() public override(Adam, Eve) {
        super.bar();
    }
}