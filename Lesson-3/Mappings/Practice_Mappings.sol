// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Practice: combine mappings with structs, nested mappings, and basic access control
contract Contract {
    struct Student {
        string name;
        uint256 score;
        bool enrolled;
    }

    address public teacher;

    mapping(address => Student) public students;
    // nested mapping: student => subject => grade
    mapping(address => mapping(string => uint256)) public grades;

    event StudentEnrolled(address indexed student, string name);
    event GradeAssigned(address indexed student, string subject, uint256 grade);

    constructor() {
        teacher = msg.sender;
    }

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Not the teacher");
        _;
    }

    function enroll(string calldata name) external {
        require(!students[msg.sender].enrolled, "Already enrolled");
        students[msg.sender] = Student({ name: name, score: 0, enrolled: true });
        emit StudentEnrolled(msg.sender, name);
    }

    function assignGrade(address student, string calldata subject, uint256 grade)
        external
        onlyTeacher
    {
        require(students[student].enrolled, "Student not enrolled");
        require(grade <= 100, "Grade must be 0-100");
        grades[student][subject] = grade;
        emit GradeAssigned(student, subject, grade);
    }

    function getGrade(address student, string calldata subject)
        external
        view
        returns (uint256)
    {
        return grades[student][subject];
    }

    function isEnrolled(address student) external view returns (bool) {
        return students[student].enrolled;
    }
}
