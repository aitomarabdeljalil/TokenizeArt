# NFT Minter DApp

This project contains a simple ERC-721 smart contract and a static website to mint NFTs using MetaMask and ethers.js.

## 📁 Files

- `MyNFT.sol`: ERC721 smart contract (deployed via Remix)
- `index.html`: Frontend to connect wallet and mint NFTs
- `README.md`: Setup instructions

---

## 🚀 Deploy the Smart Contract

1. Open [Remix IDE](https://remix.ethereum.org)
2. Create a new file: `MyNFT.sol`
3. Paste the contents of the contract
4. In the "Solidity Compiler" tab:
   - Set compiler version to `0.8.24` (or compatible with your version)
   - Click **Compile MyNFT.sol**
5. In the "Deploy & Run" tab:
   - Set environment to **Injected Web3** (to use MetaMask)
   - Deploy the contract

📌 Copy the deployed contract address and ABI (from the "Deployed Contracts" tab).

---

## 🖼️ Upload Metadata

Each NFT needs a **token URI**, which is a link to a JSON file describing the NFT (image, name, description).

### Example JSON metadata (upload to IPFS or server):

```json
{
  "name": "My First NFT",
  "description": "This is my first NFT!",
  "image": "https://your-image-link.com/image.png"
}
