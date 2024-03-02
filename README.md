## Farcaster Market Prediction Smart Contracts

**This contract will enable the on-chain market prediction app in a decentralized social way **

The contract are 

* Attest: record an address's price prediction value on-chain
* Compare Price with Oracle
* Rewarding: distribute the rewards to the winers


## Components

* Front-end: run on Vercel + Warpcaster(with Frames)
* Smart Contracts: can run on any EVM Compatible blockchain
* Back-end

## Chainlink Oracle Address 

https://data.chain.link/feeds?categories=Crypto

#### Base
* WBTC/USD: `0xCCADC697c55bbB68dc5bCdf8d3CBe83CdD4E071E`

### Linea
* BTC/USD: `0x7A99092816C8BD5ec8ba229e3a6E6Da1E628E1F9`
* ETH/USD: `0x3c6Cd9Cc7c7a4c2Cf5a82734CD249D7D593354dA`

### Arbitrum
* BTC/USD: `0x6ce185860a4963106506C203335A2910413708e9`
* ETH/USD: `0x639Fe6ab55C921f74e7fac1ee960C0B6293ba612`

## Supera V1 Oracle for Hedera Blockchain

* Pull Contract: `0x41AB2059bAA4b73E9A3f55D30Dff27179e0eA181`
* Storage Contract: `0xD02cc7a670047b6b012556A88e275c685d25e0c9`


## Related Assets Address

* Base WBTC: `0x1ceA84203673764244E05693e42E6Ace62bE9BA5`
* 

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
