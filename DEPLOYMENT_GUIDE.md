# 将合约部署到 Sepolia ETH 测试网

本指南将帮助您将 DataStorage 合约部署到 Sepolia 测试网。

## 准备工作

1. 获取 Sepolia 测试网 ETH
   - 访问 [Sepolia Faucet](https://sepoliafaucet.com/) 或 [Alchemy Faucet](https://sepoliafaucet.com/)
   - 输入您的钱包地址获取测试币

2. 获取 Infura API 密钥
   - 注册 [Infura](https://infura.io/) 账户
   - 创建一个新项目并获取 API 密钥

3. 准备您的钱包私钥
   - 导出您的 MetaMask 或其他钱包的私钥
   - **警告**：私钥是敏感信息，请谨慎处理

4. 获取 Etherscan API 密钥（可选，用于验证合约）
   - 注册 [Etherscan](https://etherscan.io/) 账户
   - 在设置中创建 API 密钥

## 设置环境变量

创建一个 `.env` 文件（如果尚未存在），并添加以下内容：

```
INFURA_API_KEY=your_infura_api_key
PRIVATE_KEY=your_wallet_private_key
ETHERSCAN_API_KEY=your_etherscan_api_key
```

将占位符替换为您的实际密钥。

## 部署步骤

1. 编译合约

```bash
npx hardhat compile
```

2. 部署到 Sepolia 测试网

```bash
npx hardhat run scripts/deploy.js --network sepolia
```

3. 验证合约（可选）
   
部署成功后，您将获得合约地址。使用以下命令验证合约：

```bash
npx hardhat verify --network sepolia DEPLOYED_CONTRACT_ADDRESS
```

替换 `DEPLOYED_CONTRACT_ADDRESS` 为实际部署的合约地址。

## 与合约交互

部署后，您可以通过 Etherscan 或使用 Web3 库与合约进行交互。

### 使用 Etherscan
1. 访问 [Sepolia Etherscan](https://sepolia.etherscan.io/)
2. 搜索您的合约地址
3. 在 "Contract" 标签页中，您可以调用合约函数

### 使用代码交互
您可以使用 ethers.js 或 web3.js 库与合约交互。例如：

```javascript
const { ethers } = require("ethers");
const contractABI = require("./artifacts/contracts/DataStorage.sol/DataStorage.json").abi;

async function interact() {
  const provider = new ethers.providers.JsonRpcProvider(`https://sepolia.infura.io/v3/YOUR_INFURA_KEY`);
  const signer = new ethers.Wallet("YOUR_PRIVATE_KEY", provider);
  
  const contract = new ethers.Contract("YOUR_CONTRACT_ADDRESS", contractABI, signer);
  
  // 调用合约方法
  await contract.storeDataViaEvent("Hello, Sepolia!");
}
``` 