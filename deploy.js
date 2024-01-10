const { ethers, JsonRpcProvider } = require("ethers");
const fs = require("fs-extra");

async function main() {
  // http://127.0.0.1:7545  - ganache endpoint
  const provider = new JsonRpcProvider("http://127.0.0.1:7545");
  const wallet = new ethers.Wallet(
    "0xc7b963fd9f4a8185cfe75d233e3bee25617c94f19af057dddb81a355a68b503a",
    provider
  );
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf8");
  const binary = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage.bin",
    "utf8"
  );

  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);

  console.log("Deploying, please wait...");
  const contract = await contractFactory.deploy();
  console.log(contract);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
