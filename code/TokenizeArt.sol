// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title TokenizeArt
 * @dev This contract allows the owner and users to mint unique ERC721 NFTs representing digital art.
 *      Each NFT is associated with a unique token URI pointing to the metadata of the art.
 *
 * Inherits from:
 * - ERC721URIStorage: Provides ERC721 NFT functionality with storage-based token URI management.
 * - Ownable: Provides ownership control, although minting is open to any external caller.
 *
 * State Variables:
 * - tokenCounter: A counter to keep track of the total number of minted tokens and assign incremental token IDs.
 *
 * Constructor:
 * - Sets the token name to "Tokenize Art" and the symbol to "TKA".
 * - Initializes the tokenCounter to zero.
 *
 * Functions:
 * - mintNFT(string memory tokenURI) external returns (uint256):
 *      Mints a new NFT to the caller's address.
 *      Assigns a new token ID based on the current tokenCounter.
 *      Sets the token URI to the provided metadata URI.
 *      Increments the tokenCounter.
 *      Returns the new token ID.
 */

contract TokenizeArt is ERC721URIStorage , Ownable {
    uint256 public tokenCounter;

    /**
     * @dev Initializes the ERC721 token with name and symbol and sets the owner.
     */
    constructor() ERC721("Tokenize Art", "TKA") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    /**
     * @notice Mint a new NFT with the specified token URI.
     * @param tokenURI The metadata URI pointing to the JSON describing the NFT.
     * @return newItemId The token ID of the newly minted NFT.
     *
     * Emits a Transfer event from the zero address to the caller.
     */
    function mintNFT(string memory tokenURI) external returns (uint256) {
        uint256 newItemId = tokenCounter;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        tokenCounter += 1;
        return newItemId;
    }
}