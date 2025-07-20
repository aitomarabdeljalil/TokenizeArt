## 🖼️ TokenizeArt – On-Chain NFT SVG Generator

### Overview

**TokenizeArt** is an Ethereum smart contract that allows the minting of NFTs with fully on-chain SVG images and metadata. Instead of uploading metadata or artwork to IPFS or external storage, everything — including the artwork (as SVG), name, description, and artist attribute — is generated and stored directly on-chain.

This ensures **immutability, permanence, and decentralization**.

---

### 📦 Contract Details

* **Name**: `TokenizeArt`
* **Symbol**: `TKA`
* **Standard**: ERC-721 (NFT)
* **Language**: Solidity `^0.8.20`
* **Storage**: On-chain metadata + on-chain SVG images
* **Base Contracts**:

  * [`ERC721URIStorage`](https://docs.openzeppelin.com/contracts/4.x/api/token/erc721#ERC721URIStorage): Allows storing custom metadata URIs per token.
  * [`Ownable`](https://docs.openzeppelin.com/contracts/4.x/api/access#Ownable): Grants ownership control (only owner can mint NFTs).

---

### 🔧 Contract Structure

#### 🔢 `tokenCounter`

A `uint256` that keeps track of the number of tokens minted (used as the token ID).

#### 🧱 `Attributes` Struct

```solidity
struct Attributes {
    string trait_type;
    string value;
}
```

Represents a single attribute in the NFT metadata — here used to store the artist's name.

#### 📋 `Metadata` Struct

```solidity
struct Metadata {
    string name;
    string description;
    string svg;
    Attributes attributes;
}
```

Temporarily holds NFT data before generating its final metadata JSON and encoding it.

---

### 🚀 Minting Function

#### `mintNFTOnChain(string _name, string _description, string _svgText, string _artistName)`

* **Access**: `onlyOwner`
* **Purpose**: Creates a new NFT with the given metadata and SVG text stored on-chain.
* **How it works**:

  1. Accepts raw input from the frontend (name, description, text, artist).
  2. Stores it in the contract’s `nftMetadata` struct.
  3. Converts the text to an SVG using `textToSVG()`.
  4. Encodes everything into a base64 JSON URI.
  5. Calls `_mint()` and `_setTokenURI()`.

---

### 🎨 SVG Generator

#### `textToSVG()`

Wraps user-supplied text into a minimal SVG format:

```svg
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 10 10">
  <rect width="100%" height="100%" fill="#ffffff"/>
  <text x="50%" y="50%" ...>YOUR TEXT</text>
</svg>
```

This function creates a **visual representation of the text** that will be rendered by NFT marketplaces like OpenSea or Etherscan.

---

### 📦 Metadata Formatter

#### `formatTokenURI()`

Builds the JSON metadata and wraps it in a base64-encoded data URI:

```json
{
  "name": "Your NFT Name",
  "description": "Your Description",
  "image": "data:image/svg+xml;base64,...",
  "attributes": [
    {
      "trait_type": "Artist",
      "value": "Your Name"
    }
  ]
}
```

Returned as:

```text
data:application/json;base64,<base64-encoded JSON>
```

---

### 📁 Dependencies

This contract relies on:

* [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)

  * `ERC721URIStorage`
  * `Ownable`
  * `Base64` (from OZ utils)

---

### 🔐 Access Control

* Only the **contract owner** can call `mintNFTOnChain`.
* Use `Ownable.transferOwnership(address)` to change ownership if needed.

---

### 🧪 Example Frontend Integration

When calling from your frontend (e.g., via Ethers.js):

```js
await contract.mintNFTOnChain(
  "Sunset Poem",
  "A short text-based artwork encoded as SVG.",
  "The sun sets in golden light.",
  "Alice"
);
```
