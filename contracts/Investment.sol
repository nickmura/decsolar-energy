// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract InvestmentFund {
    address USDContract = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
    IERC20 USDC = IERC20(USDContract);
    uint256 public fundingGoal;
    uint256 public currentFunding;
    
    uint256 public monthlyInvestorRevenue;
    bool hasEnded;
    address safe;
    address tenant;

    event NewInvestment(address investor, uint256 amount);
    event WithdrawedInvestment(address investor, uint256 amount);
    mapping (address => uint256) public balances;

    mapping (address => uint256) public equity;

    constructor(uint256 _fundingGoal, address _safe, address _tenant) public {
       fundingGoal = _fundingGoal;
       safe = _safe;
       tenant = _tenant;
    }

    function contribute(uint256 amount) public payable {
        require(!hasEnded, "The investment period has ended.");
        require(msg.value == amount, "msg.value needs to equal the amount parameter");
        USDC.approve(address(this), amount);
        USDC.transfer(address(this), amount);
        currentFunding += msg.value;
        balances[msg.sender] += msg.value;
        equity[msg.sender] = (balances[msg.sender] / fundingGoal);

        emit NewInvestment(msg.sender, amount);
    }

    function withdraw(uint256 amount) public payable { // TODO: change this into trade 
        require(!hasEnded, "Project has undergone building infrastructure, cannot withdraw funds");
        require(amount > 0 && amount <= balances[msg.sender], "Invalid withdrawal amount.");
        // Subtract the investor's balance from their account balance
        USDC.approve(msg.sender, amount);
        USDC.transfer(msg.sender, amount);

        balances[msg.sender] -= amount;
        // Subtract the investor's balance from the total amount raised
        currentFunding -= amount;

    }

    function endContributionPeriod() public payable {
        require(fundingGoal >= currentFunding, "The desired amount has not been reached.");

        // Define the investment strategy and calculate returns
        USDC.approve(msg.sender, currentFunding);
        USDC.transfer(msg.sender, currentFunding);
        // Distribute the returns to the investors
    
        hasEnded = true;
    }


    // Function to retrieve the balance of an investor
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }    


    // TODO: Elecricity bill
    function payBill() public payable {
        require(hasEnded, "Project is has not finished funding round");
        

    }


    //TODO: Payout investor
    function payoutInvestor() public {
        require(hasEnded, "Project is has not finished funding round");
        require(balances[msg.sender] > 0, "Caller has not invested in this project");

        // What are the terms for paying out 
    }
}