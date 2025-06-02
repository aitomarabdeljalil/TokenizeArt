// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenizeArt is ERC721URIStorage , Ownable {
    uint256 public tokenCounter;
    constructor() ERC721("Tokenize Art", "TKA") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function mintNFT(string memory tokenURI) external returns (uint256) {
        uint256 newItemId = tokenCounter;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter += 1;
        return newItemId;
    }
}