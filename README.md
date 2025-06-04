# TokinizerArt

This project contains a simple ERC-721 smart contract and a static website to mint NFTs using MetaMask and ethers.js.

## Language Choice

**Solidity** Selected for its:

Native Ethereum Virtual Machine (EVM) compatibility

Mature tooling (Remix, Hardhat, Foundry)

Secure arithmetic operations (built-in overflow checks)

Industry-wide adoption for smart contracts

## 📁 Project Structure

```
  TokenizeArt/
  ├── code/
  │   ├── TokenizeArt.sol                       # ERC721 smart contract for minting NFTs
  │   └── website/
  │       └── index.html                        # Frontend with a graphical interface to connect a wallet and mint NFTs
  ├── deployment/
  │   └── deployment.md                         # Step-by-step guide for deploying the smart contract
  ├── documentation/
  │   └── documentation.md                      # Detailed documentation of the smart contract and App functionality
  └── README.md                                 # This global overview and setup guide
```

---

## 🚀 Getting Started

### Prerequisites
- [Remix IDE](https://remix.ethereum.org) for contract deployment
- [MetaMask](https://metamask.io) browser wallet
- Test ETH (from a faucet for testnets like Sepolia)
- [IPFS](https://ipfs.io) or a server for initial metadata hosting
- A modern browser (e.g., Chrome, Firefox)

### Setup
1. **Clone the Repository**:
   - Clone this repo to your local machine or download the files.
2. **Smart Contract**:
   - See `deployment/deployment.md` for instructions to compile and deploy `code/TokenizeArt.sol` using Remix.
3. **Frontend**:
   - Open `code/website/index.html` in a browser with MetaMask installed.
   - Connect your wallet to a testnet (e.g., Sepolia).

### Deploy
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

See `documentation/documentation.md` for technical details and `deployment/deployment.md` for deployment steps.

---

## ⚠️ Notes
- Test on a testnet (e.g., Sepolia) to avoid real ETH costs.
- Ensure metadata follows the ERC721 standard (see example in `documentation/documentation.md`).
- Security: The contract allows public minting; consider adding a cap or access control for production.
