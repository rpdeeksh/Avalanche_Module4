// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";  
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    string public redeem_shop;
    int256 cost;
    string internal error_m = "Only 3 items available in the shop";

    constructor() ERC20("Degen", "DGN") {
        redeem_shop = "You have the following items in your shop which you are able to redeem: 1.Bat, 2.Ball, 3.Stumps";
    }

        function mint(address to, uint256 amount) public onlyOwner {
            _mint(to, amount);
        }

        function redeem(uint256 item_serial) public payable{
        
        if(item_serial > 0 && item_serial < 4){
            revert(error_m);
        }
        require(balanceOf(msg.sender) >= 1001);
        _burn(msg.sender, (item_serial*7) %5  + 999);
        }

        function ReturnCode(string memory _name) public payable  {
    if (keccak256(bytes(_name)) == keccak256(bytes("Bat"))) {
        cost = (1*7) + 999
    } else if (keccak256(bytes(_name)) == keccak256(bytes("Ball"))) {
        cost = (2*7) + 999
    } else if (keccak256(bytes(_name)) == keccak256(bytes("Stumps"))) {
        cost = (3*7) + 999
    } else {
        revert("Item doesn't exist.");
    }
}
}