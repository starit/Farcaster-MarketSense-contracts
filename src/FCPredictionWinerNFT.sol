// contracts/GameItem.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract FCPWinerNFT is ERC721URIStorage {
    uint256 private _nextTokenId;
    address owner;

    constructor(address ownerAddress) ERC721("FCPredictionWiner", "FCWiner") {
        owner = ownerAddress;
    }

    function mint(address to, uint256 tokenId) external {
        require(msg.sender == owner, "no-permission");
        _mint(to, tokenId);
    }
}