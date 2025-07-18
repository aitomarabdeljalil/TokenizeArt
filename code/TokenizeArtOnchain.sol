// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
/// @dev Base64 lib — can be found here: https://github.com/Brechtpd/base64
import "@openzeppelin/contracts/utils/Base64.sol";

contract TokenizeArt is ERC721URIStorage , Ownable {
    uint256 public tokenCounter;

    struct Attributes {
        string trait_type;
        string value;
    }

    struct Metadata {
        string name;
        string description;
        string svg;
        Attributes attributes;
    }

    Metadata nftMetadata;

    constructor() ERC721("Tokenize Art", "TKA") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    
    function mintNFTOnChain(
        string memory _name,
        string memory _description,
        string memory _svgText,
        string memory _artistName
    ) public onlyOwner
    {
        Attributes memory _attr = Attributes({trait_type: "Artist", value: _artistName});
        nftMetadata.name = _name;
        nftMetadata.description = _description;
        nftMetadata.svg = _svgText;
        nftMetadata.attributes = _attr;
        
        uint256 newItemId = tokenCounter;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, formatTokenURI());
        tokenCounter = tokenCounter + 1;
    }

    /// Wraps the input text in basic SVG
    function textToSVG() internal view returns (string memory) {
        return string(
            abi.encodePacked(
                '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10">',
                '<rect width="100%" height="100%" fill="#ffffff"/>',
                '<text x="50%" y="50%" font-family="Arial" font-size="2" fill="#000000" ',
                'text-anchor="middle" dominant-baseline="middle">',
                nftMetadata.svg,
                '</text></svg>'
            )
        );
    }


    function formatTokenURI() internal view returns (string memory) {
        string memory svgBase64 = Base64.encode(bytes(textToSVG()));
        return string(
            abi.encodePacked(
                "data:application/json;base64,",
                Base64.encode(bytes(abi.encodePacked(
                    '{"name":"', nftMetadata.name, '",',
                    '"description":"', nftMetadata.description, '",',
                    '"image":"data:image/svg+xml;base64,', svgBase64, '",',
                    '"attributes":[{"trait_type":"Artist","value":"', nftMetadata.attributes.value, '"}]}'
                )))
            )
        );
    }
    
}