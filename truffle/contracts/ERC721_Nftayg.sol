// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

/**
* @title ERC721 Token (NFTAYG)
* @author Alex YE, Yannick JEN, Gregory BADET
* @notice Implements a basic ERC721 token for create NFT
*/
contract Erc721_Nftayg is ERC721Enumerable, Ownable {

    using SafeMath for uint256;

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    bool public isActive = true;
    
    address payable private _owner;

    uint256 public _maxSupply = 5;

    struct rateBonus {
        uint rateBonus;
    }
    mapping(uint => rateBonus) ratesBonus;  // Stock rateBonus of each NFT and can get it without 


    // CONSTRUCTORS
    constructor() ERC721("AYG NFT", "NFTAYG") {}


   /**@dev The function for mint NFT n°1 : CAPTAIN ALYRA
    * @notice Mint this NFT and staking it on our protocol for reward token $nAYG
    * @notice With this NFT you get can get bonus reward of +10% $nAYG
    * @param owner is the address that is mint the NFT
    */
    function mint1(address owner) payable public returns (uint256)
    {
        uint256 newItemId = _tokenIds.current();

        require(isActive, "Sale is not active" );
        require(newItemId < _maxSupply, "Supply is max");
        require(msg.value == 1000000000000000 wei, "Need to send 0.001 ETH"); //0.001 ETH

        // Json NFT : Captain ALYRA
        string memory mytokenURI = "https://gateway.pinata.cloud/ipfs/QmZ4ZZ2pZV4UkXobHDBvspyWksetJAVU6otbP1b2H7mPCh/captainAlyra.json";

        _mint(owner, newItemId);
        _setTokenURI(newItemId, mytokenURI);
        
        ratesBonus[newItemId].rateBonus = 10;

        _tokenIds.increment();
        return newItemId;
    }


   /**@dev The function for mint NFT n°2 : SUPER ALYRA
    * @notice Mint this NFT and staking it on our protocol for reward token $nAYG
    * @notice With this NFT you get can get bonus reward of +30% $nAYG
    * @param owner is the address that is mint the NFT
    */
    function mint2(address owner) payable public returns (uint256)
    {
        uint256 newItemId = _tokenIds.current();

        require(isActive, "Sale is not active" );
        require(newItemId < _maxSupply, "Supply is max");
        require(msg.value == 2000000000000000 wei, "Need to send 0.002 ETH"); //0.002 ETH

        // Json NFT : Super ALYRA
        string memory mytokenURI = "https://gateway.pinata.cloud/ipfs/QmZ4ZZ2pZV4UkXobHDBvspyWksetJAVU6otbP1b2H7mPCh/superAlyra.json";

        _mint(owner, newItemId);
        _setTokenURI(newItemId, mytokenURI);

        ratesBonus[newItemId].rateBonus = 30;

        _tokenIds.increment();
        return newItemId;
    }


   /**@dev The function for mint NFT n°3 : WONDER ALYRA
    * @notice Mint this NFT and staking it on our protocol for reward token $nAYG
    * @notice With this NFT you get can get bonus reward of +30% $nAYG
    * @param owner is the address that is mint the NFT
    */
    function mint3(address owner) payable public returns (uint256)
    {
        uint256 newItemId = _tokenIds.current();

        require(isActive, "Sale is not active" );
        require(newItemId < _maxSupply, "Supply is max");
        require(msg.value == 3000000000000000 wei, "Need to send 0.003 ETH"); //0.003 ETH

        // Json NFT : Wonder ALYRA
        string memory mytokenURI = "https://gateway.pinata.cloud/ipfs/QmZ4ZZ2pZV4UkXobHDBvspyWksetJAVU6otbP1b2H7mPCh/wonderAlyra.json";

        _mint(owner, newItemId);
        _setTokenURI(newItemId, mytokenURI);

        ratesBonus[newItemId].rateBonus = 50;

        _tokenIds.increment();
        return newItemId;
    }


   /**@dev Return the rateBonus of one NFT
    * @notice Get rateBonus on-chain without requete tokenURI (IPFS/PINATA)
    * @param tokenId is the id of NFT
    */
    function getBoosterById(uint tokenId) external view returns(uint) {
        return ratesBonus[tokenId].rateBonus;
    }



// Ajout de fonctions (setTokenURI) à ERC721 qui ne sont plus disponible dans ERC721.sol depuis 0.8.0

    using Strings for uint256;
    
    // Optional mapping for token URIs
    mapping (uint256 => string) private _tokenURIs;

    // Base URI
    string private _baseURIextended;

    function setBaseURI(string memory baseURI_) external onlyOwner() {
        _baseURIextended = baseURI_;
    }
    
    function _setTokenURI(uint256 tokenId, string memory _tokenURI) internal virtual {
        require(_exists(tokenId), "ERC721Metadata: URI set of nonexistent token");
        _tokenURIs[tokenId] = _tokenURI;
    }
    
    function _baseURI() internal view virtual override returns (string memory) {
        return _baseURIextended;
    }
    
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");

        string memory _tokenURI = _tokenURIs[tokenId];
        string memory base = _baseURI();
        
        // If there is no base URI, return the token URI.
        if (bytes(base).length == 0) {
            return _tokenURI;
        }
        // If both are set, concatenate the baseURI and tokenURI (via abi.encodePacked).
        if (bytes(_tokenURI).length > 0) {
            return string(abi.encodePacked(base, _tokenURI));
        }
        // If there is a baseURI but no tokenURI, concatenate the tokenID to the baseURI.
        return string(abi.encodePacked(base, tokenId.toString()));
    }

//    function mint(
//        address _to,
//        uint256 _tokenId,
//        string memory tokenURI_
//    ) external onlyOwner() {
//        _mint(_to, _tokenId);
//        _setTokenURI(_tokenId, tokenURI_);
//    }


   /**@dev The function for change smartcontract on/off statuts
    * @notice flip status one click
    */
    function flipStatus() public onlyOwner {
        isActive = !isActive;
    }


   /**@dev The function for return maxSupply defined
    * @notice get maxSupply
    */
    function maxSupply() public view returns (uint256){
        return _maxSupply;
    }


   /**@dev The function for withdraw ETH to address
    * @notice withdraw token ETH to address
    */
    function withdraw(address payable recipient) public onlyOwner {
        uint256 balance = address(this).balance;
        recipient.transfer(balance);
    }
}