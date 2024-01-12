// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract SimpleStorage {
    // not specifying a value for the uint variable, defaults to 0
    // adding 'public' in succession to uint displays the field as a button which retrieves/displays the latest value of the variable
    uint favouriteNumber;

    // function to store number into the variable
    // this funciton generates a transaction hash since it is changing the value to be stored in the blockchain
    function storeNumber(uint _favouriteNumber) public virtual {
        favouriteNumber = _favouriteNumber;
    }

    // function to retrieve and display value of the variable
    // this function does not generate a transaction hash since it is not changing anything - just retrieving data
    function retrieveNumber() public view returns (uint) {
        return favouriteNumber;
    }

    // performs a standalone function which does not involve storing OR retrieving anything from the blockchain
    // this function does not generate a transaction hash since it is not changing anything - just retrieving data
    function pureFunction() public pure returns (uint) {
        return 50 + 100;
    }

    // creates a map of key-value pair and retrieves data based on the key field
    // data is inserted in the addPerson function below
    mapping(string => uint) public nameToNumber;

    struct People {
        uint pfavouriteNumber;
        string pname;
    }

    // initializing 'People' struct as an Array and retrieval based on index number
    People[] public peopleByIndexNo;

    // this function allows user the store values in the Array
    function addPerson(string memory _name, uint _favouriteNumber) public {
        peopleByIndexNo.push(People(_favouriteNumber, _name));
        nameToNumber[_name] = _favouriteNumber;
    }
}
