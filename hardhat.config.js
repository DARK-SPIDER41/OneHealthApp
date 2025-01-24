// /** @type import('hardhat/config').HardhatUserConfig */
// module.exports = {
//   solidity: "0.8.28",
// };
require("@nomiclabs/hardhat-ethers");
require("dotenv").config(); // To use environment variables

module.exports = {
  solidity: "0.8.0", // Specify the Solidity version
  networks: {
    goerli: {
      url: `https://goerli.infura.io/v3/${process.env.INFURA_PROJECT_ID}`, // Use your Infura Project ID
      accounts: [`0x${process.env.PRIVATE_KEY}`], // Use your wallet private key
    },
  },
};
