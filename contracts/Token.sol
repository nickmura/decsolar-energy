    // SPDX-License-Identifier: MIT    
    pragma solidity ^0.8.18;
    
    import "@openzeppelin/contracts/access/AccessControl.sol";
    import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

    contract P2PToken is AccessControl, ERC20 {
        bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");
        bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

        address stakingContract;
        address mintAddress;


        constructor(address _addr) public ERC20("DEC Energy", "P2P") {
            _mint(_addr, 125 * (10 ** 24));
        }

        function setStakingAddress(address _stakingContract) public {
            require(stakingContract == address(0), "Staking contract has already been defined");
            stakingContract = _stakingContract;
            _setupRole(MINTER_ROLE, stakingContract);

        }

        function mint(address to, uint256 amount) public {
            require(hasRole(MINTER_ROLE, msg.sender), "Caller is not a minter");
            _mint(to, amount);
        }


    }