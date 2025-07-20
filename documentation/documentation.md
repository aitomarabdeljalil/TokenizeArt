# TokenizeArt: Smart Contract Documentation

## Overview
`TokenizeArt` is an Ethereum smart contract that enables the creation and minting of unique non-fungible tokens (NFTs) compliant with the ERC721 standard. It is designed to represent digital art, where each NFT is associated with a unique token URI pointing to metadata (e.g., hosted on IPFS). The contract inherits from OpenZeppelin's `ERC721URIStorage` for NFT functionality and `Ownable` for ownership control, although minting is open to any external caller.

## Contract Details
- **Name**: Tokenize Art
- **Symbol**: TKA
- **Standard**: ERC721 (with URI storage)
- **Solidity Version**: ^0.8.20
- **Dependencies**:
  - `@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol`
  - `@openzeppelin/contracts/access/Ownable.sol`
- **License**: MIT

## Features
- **NFT Minting**: Any user can mint an NFT by providing a token URI, which is stored on-chain.
- **Token Counter**: Tracks the total number of minted NFTs and assigns incremental token IDs.
- **Ownership**: Inherits `Ownable`, allowing the contract owner to perform restricted actions (though no owner-only functions are currently implemented).
- **Metadata Storage**: Uses `ERC721URIStorage` to store token URIs, linking each NFT to its metadata.
- **Bonus**:
  - Store and retrieve metadata and SVG image data on-chain.
  - Graphical interface in `code/website/index.html` for easy minting.

## State Variables
- `tokenCounter` (`uint256`, public): Tracks the total number of minted tokens and provides the next token ID.

## Constructor
- **Parameters**: None
- **Functionality**:
  - Initializes the ERC721 token with the name `"Tokenize Art"` and symbol `"TKA"`.
  - Sets the contract deployer as the owner via `Ownable`.
  - Initializes `tokenCounter` to `0`.

## Functions
### `mintNFT(string memory tokenURI) external returns (uint256)`
- **Purpose**: Mints a new NFT to the caller's address and associates it with the provided token URI.
- **Parameters**:
  - `tokenURI` (`string`): The URI pointing to the NFT's metadata (e.g., a JSON file on IPFS).
- **Returns**: `newItemId` (`uint256`): The token ID of the newly minted NFT.
- **Behavior**:
  - Assigns the current `tokenCounter` value as the token ID.
  - Calls `_mint` to mint the NFT to the caller's address.
  - Calls `_setTokenURI` to store the token URI on-chain.
  - Increments `tokenCounter`.
  - Emits a `Transfer` event from the zero address to the caller.
- **Access**: Public (any external caller can mint).

## Events
- Inherits standard ERC721 events:
  - `Transfer(address indexed from, address indexed to, uint256 indexed tokenId)`: Emitted when an NFT is minted or transferred.
  - `Approval(address indexed owner, address indexed approved, uint256 indexed tokenId)`: Emitted when an NFT is approved for transfer.
  - `ApprovalForAll(address indexed owner, address indexed operator, bool approved)`: Emitted when an operator is approved for all NFTs of an owner.

## Usage
1. **Deploy the Contract**:
   - Deploy using an Ethereum development environment like Remix, Hardhat, or Foundry (see `deployment/deployment.md`).
   - Ensure OpenZeppelin dependencies are available.
2. **Mint NFTs**:
   - Call `mintNFT` with a valid token URI (e.g., `ipfs://<hash>/metadata.json`).
   - The caller receives the NFT, and the token ID is returned.
3. **Verify NFTs**:
   - Use `tokenURI(tokenId)` to retrieve the metadata URI.
   - Use `ownerOf(tokenId)` to verify the NFT owner.
   - Use `tokenCounter` to check the total number of minted NFTs.

## Example Metadata
The token URI should point to a JSON file with the following structure:
```json
{
  "name": "Art 42 Piece",
  "description": "A unique digital artwork.",
  "image": "ipfs://<hash>/image.png",
  "attributes": [
    { "trait_type": "Artist", "value": "YOUR_LOGIN" },
  ]
}
```

## Security Considerations
- **Public Minting**: Anyone can call `mintNFT`, which may lead to unlimited minting. Consider adding a cap or access control for production.
- **Token URI Immutability**: Once set, the token URI cannot be changed. Ensure the URI is correct and hosted on a reliable service (e.g., IPFS).
- **Gas Costs**: Minting and storing URIs on-chain can be gas-intensive. Optimize metadata storage if needed.
- **Ownership**: The `Ownable` contract allows the owner to transfer ownership or renounce it, but no owner-specific functions are currently implemented.

## Bonus Part
- **Graphical Interface**: `code/website/index.html` lets users input data and mint via a browser.

## Future Improvements
- Add a maximum supply limit for NFTs.
- Implement a payment mechanism (e.g., require ETH or an ERC20 token to mint).
- Add batch minting or pausing functionality.
- Include events for tracking minting actions.
- Add a function to allow the owner to update metadata (if mutable NFTs are desired).

## Deployment
- **Testnets**: Deploy on testnets like Sepolia or Goerli for testing.
- **Mainnet**: Deploy on Ethereum mainnet for production, ensuring sufficient gas and secure metadata hosting.
- **Tools**: Use Remix, Hardhat, or Foundry for deployment and testing.
