# Deploying TokenizeArt Smart Contract using Remix Ethereum

This guide will walk you through deploying the `TokenizeArt` ERC721 contract using Remix and minting your first NFT.

---

## ✅ Prerequisites

- [Remix IDE](https://remix.ethereum.org/)
- A browser wallet (e.g., MetaMask) connected to a testnet (Goerli, Sepolia, etc.)
- Some test ETH (get from a faucet)

---

## 🚀 Deployment Steps

### 1. Open Remix

- Visit: [https://remix.ethereum.org](https://remix.ethereum.org)
- Make sure you're in the **Solidity** environment.

### 2. Create the Contract File

- Create a new file called `TokenizeArt.sol`
- Paste your contract code into this file

### 3. Compile the Contract

* Go to the **Solidity Compiler** tab
* Select version `0.8.20`
* Click **Compile TokenizeArt.sol**

### 4. Deploy the Contract

* Go to the **Deploy & Run Transactions** tab
* Select **Injected Provider - MetaMask** as Environment
* Log in to **MetaMask** and ensure you're connected to a testnet (e.g., Sepolia)
* Select your contract (`TokenizeArt`)
* Click **Deploy**
* Approve the transaction in MetaMask
* Once deployed, the contract address will appear in the **Deployed Contracts** section

### 5. Verify Deployment

* In the **Deployed Contracts** section, expand the (`TokenizeArt`) contract.
* Call the (`tokenCounter`) function to confirm it returns (`0`) (indicating no tokens minted yet).
* Call the (`name`) and (`symbol`) functions to verify they return (`"Tokenize Art"`) and (`"TKA"`), respectively.

---

## 🖼️ Mint the NFT

### 1. Locate `mintNFT` function

* After deployment, scroll down in Remix to the `Deployed Contracts` section
* Find the `mintNFT` function

### 2. Call `mintNFT`

* Enter a token URI (e.g., a URL to a JSON file with NFT metadata)
  Example: `https://ipfs.io/ipfs/Qm.../metadata.json`
* Click **transact**
* Confirm the MetaMask transaction

### 3. View Your Token

* You can now view your minted NFT on testnet explorers or tools like [OpenSea testnet](https://testnets.opensea.io/)

---

## 📝 Notes

* Use IPFS to host your NFT metadata and image files.
* You can test the contract on Remix without paying real ETH by using the JavaScript VM.
