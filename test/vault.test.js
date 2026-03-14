
const { expect } = require("chai");

describe("Vault", function () {

  let vault;
  let owner;

  beforeEach(async function () {

    const Vault = await ethers.getContractFactory("Vault");

    vault = await Vault.deploy();

    [owner] = await ethers.getSigners();
  });

  it("should deposit ETH", async function () {

    await vault.deposit({value: ethers.parseEther("1")});

    const user = await vault.users(owner.address);

    expect(user.shares).to.equal(ethers.parseEther("1"));
  });

});
