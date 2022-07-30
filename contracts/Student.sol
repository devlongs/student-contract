//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract DB {
    address owner;
    struct Student {
        string name;
        uint256 age;
        uint256[] score;
    }

    // array of students
    Student[] public studentsArray;

    // mapping()
    mapping(address => Student) public student;

    constructor() {
        owner = msg.sender;
    }

    // register a student
    function InitRec(
        string memory _name,
        uint256 _age,
        uint256 _score
    ) public {
        require(owner == msg.sender, "You are not the owner");
        Student storage stut = student[msg.sender];
        stut.name = _name;
        stut.age = _age;
        stut.score.push(_score);
    }

    // returns the data one a particular student
    // function getStudent(_address) public view returns(Student){
    //     return student[_address];
    // }

    // returns the array of student info
    function getAllStudents() public view returns (Student[] memory) {
        return studentsArray;
    }
}
