# Let build chain 

    Platform for selling and buying product using Etherium Smart contracts.


Init sample package [ref: https://github.com/trufflesuite/truffle-init-webpack] 
    truffle unbox webpack

## Installation
Test Server [ref :  https://github.com/trufflesuite/ganache-cli] 

    npm install -g ganache-cli
To Run test Server

    ganache-cli
    

Install Truffle globally.

    npm install -g truffle
Download the box. This also takes care of installing the necessary dependencies.

    truffle unbox webpack
Run the development console.
    truffle develop
Compile and migrate the smart contracts. Note inside the development console we don't preface commands with truffle.

    truffle compile
    truffle migrate
Run the webpack server for front-end hot reloading (outside the development console). Smart contract changes must be manually recompiled and migrated.

    // Serves the front-end on http://localhost:8080
    npm run dev
Truffle can run tests written in Solidity or JavaScript against your smart contracts. Note the command varies slightly if you're in or outside of the development console.

    // If inside the development console.
    test

    / If outside the development console..
    truffle test

Commands:
```
  Compile:              truffle compile
  Migrate:              truffle migrate
  Test contracts:       truffle test
  Run linter:           npm run lint
  Run dev server:       npm run dev
  Build for production: npm run build
```

Install Solidity Compiler
	
	npm install -g solc

## Useful links
    Token 

        https://github.com/ConsenSys/Tokens

# blockchain-hackthon
    Build trusted platform using blockchain

### Motive | Build E-commerce platform using BlockChain technology.
    1. Buy using Etherium Smart contracts.
    2. Sell on Platform using Etherium Smart contracts.
  
