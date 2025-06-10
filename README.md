# DataStorage 合约 - Sepolia 部署指南

这是一个简单的 DataStorage 智能合约，允许用户通过事件或调用数据存储数据。此项目使用 Hardhat 作为开发和部署环境。

## 部署到 Sepolia 测试网

要部署到 Sepolia 测试网，请参考 [DEPLOYMENT_GUIDE.md](./DEPLOYMENT_GUIDE.md) 文件获取详细说明。

### 快速开始

1. 安装依赖
```bash
npm install
```

2. 配置环境变量
创建一个 `.env` 文件，并填入以下内容：
```
INFURA_API_KEY=your_infura_api_key
PRIVATE_KEY=your_wallet_private_key
ETHERSCAN_API_KEY=your_etherscan_api_key
```

3. 编译合约
```bash
npx hardhat compile
```

4. 部署到 Sepolia
```bash
npx hardhat run scripts/deploy.js --network sepolia
```

5. 验证合约 (可选)
```bash
npx hardhat verify --network sepolia DEPLOYED_CONTRACT_ADDRESS
```

## 合约功能

合约提供两种存储数据的方法：

1. `storeDataViaEvent(string memory data)` - 通过发出事件存储数据
2. `sendHexData(bytes memory data)` - 通过调用数据存储二进制数据

## 本地开发

使用以下命令在本地网络上运行和测试：

```bash
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost
```

## graph
1. graph init --skip-git
2. npx graph build
3. 
