
async function main() {

  const Vault = await ethers.getContractFactory("Vault");

  const vault = await Vault.deploy();

  await vault.waitForDeployment();

  console.log("Vault deployed to:", await vault.getAddress());
}

main();
