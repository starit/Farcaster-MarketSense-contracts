// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
// import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "./interfaces/IERC721Mintable.sol";
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

/** 
 * FCPredictionRewardingContract
 * This contract is to compare the price 
 * Simple contract withouth security and performance enhancement
 */
contract FCPredictionRewardingContract {
    uint256 public number;

    mapping(address => uint256) userOptions;
    mapping(address => bool) predictionChecked;

    uint256 expectedPrice;
    uint256 expireBlock; // cannot attest after this block
    address rewardNFT;
    uint256 rewardIndex;
    address proxy;
    address dataFeedAddress;
    AggregatorV3Interface internal dataFeed;

    event attestPrice(address user, uint256 option);

    constructor(uint256 price, uint256 period, address rewardNFTAddress, address proxyAddress, address dataFeedAddress_) {
        expectedPrice = price;
        expireBlock = block.number + period;
        rewardNFT = rewardNFTAddress;
        proxy = proxyAddress;
        dataFeed = AggregatorV3Interface(
            dataFeedAddress_
        );
    }

    // Make it general
    // Current Option: 1: long 2: short
    function attest(uint256 option) public {
        userOptions[msg.sender] = option;
        predictionChecked[msg.sender] = false;
        emit attestPrice(msg.sender, option);
    }

    function attestByProxy(address user, uint256 option) public {
        // authenticate first
        require(msg.sender == proxy, "non-proxy-address");
        userOptions[user] = option;
        predictionChecked[user] = false;
        emit attestPrice(user, option);
    }

    function compareWithOracle(address user) private view returns (bool) {
        uint256 oraclePrice = getPriceFromOracle();
        uint256 userOption = userOptions[user];
        if (userOption == 1) {
            if (oraclePrice > expectedPrice) 
              return true;
            else
              return false;
        } else {
            if (oraclePrice > expectedPrice) 
              return false;
            else
              return true;
        }
    }

    // Chainlink Oracle Price Feed
    function getPriceFromOracle() public view returns (uint256) {
        // prettier-ignore
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = dataFeed.latestRoundData();
        return uint256(answer);
    }
    

    function awardUser(address user, uint256 tokenIdToMint) public {
        if (predictionChecked[user] == true) {
            revert("user-already-checked");
        }
        if (!compareWithOracle(user)) {
            // if lose
        }
        // if win
        predictionChecked[user] = true;
        IERC721Mintable(rewardNFT).mint(user, tokenIdToMint);
    }
}
