// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract InvestmentFund {
    address tokenContract = 0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174;
    IERC20 token = IERC20(tokenContract);

    uint256 public fundingGoal; // The goal of the project to be raised
    uint256 public currentFunding; // currentFunding of the project
    uint256 public currentBill; // the current Electricity bill for the client

    uint256 public consumption; // The current amount of kWh used
    uint256 public electricity_cost; // The cents per kwh

    uint256 public monthlyInvestorRevenue;

    bool hasEnded; // Whether or not funding / investment has ended
    address safe; // address 1 of infrastructure representative (us)
    address safe2; // address 2 of infrastructure representative (us)

    address tenant; // Person paying electrcity bill

    event NewInvestment(address investor, uint256 amount);
    event WithdrawedInvestment(address investor, uint256 amount);

    mapping(address => uint256) public balances; // how much P2P theyve invested
    mapping(address => uint256) public equity; // how much equity they own due to their balance
    mapping(address => uint256) public withdrawn; // how much has been withdrawn by a user

    uint256 public totalDividends; // Total dividends paid to investors

    constructor(
        uint256 _fundingGoal,
        address _safe,
        address _tenant,
        uint256 _electricity_cost
    ) {
        fundingGoal = _fundingGoal;
        safe = _safe;
        tenant = _tenant;
        electricity_cost = _electricity_cost;
    }

    function contribute(uint256 amount) public {
        // When someone wants to invest in this project
        require(!hasEnded, "The investment period has ended.");
        require(
            amount > 0 && amount < fundingGoal,
            "Investment needs to be greater than 0 / Cannot take whole equity"
        );

        currentFunding += amount;
        balances[msg.sender] += amount;
        equity[msg.sender] = (balances[msg.sender] * 1e18) / fundingGoal;

        token.transferFrom(msg.sender, address(this), amount);
        emit NewInvestment(msg.sender, amount);
    }

    function fundingProgress()
        public
        view
        returns (uint256 _fundingGoal, uint256 _currentFunding)
    {
        _fundingGoal = fundingGoal;
        _currentFunding = currentFunding;
    }

    function withdraw(uint256 amount) public {
        // TODO: change this into trade
        require(
            !hasEnded,
            "Project has undergone building infrastructure, cannot withdraw funds"
        );
        require(
            amount > 0 && amount <= balances[msg.sender],
            "Invalid withdrawal amount."
        );

        balances[msg.sender] -= amount;
        equity[msg.sender] = (balances[msg.sender] / fundingGoal) * 100;
        currentFunding -= amount;
        token.transferFrom(msg.sender, address(this), amount);
    }

    function endContributionPeriod() public {
        require(
            fundingGoal >= currentFunding,
            "The desired amount has not been reached."
        );
        hasEnded = true;
        token.transfer(safe, token.balanceOf(address(this)));
    }

    function setConsumption(uint256 energy_consumed) public {
        require(
            msg.sender == safe || msg.sender == safe2,
            "msg.sender needs to be safe1 or safe2"
        );
        consumption += energy_consumed;
        currentBill = (consumption * electricity_cost);
    }

    // TODO: Elecricity bill
    function payBill(uint256 amount) public {
        require(msg.sender == tenant, "msg.sender needs to be tenant");
        require(hasEnded, "Project is has not finished funding round");
        require(amount == currentBill, "amount needs to equal the currentBill");

        token.transferFrom(msg.sender, address(this), amount);
    }

    // Function to retrieve the balance of an investor
    function getBalance(address user)
        public
        view
        returns (
            uint256 balance,
            uint256 userEquity,
            uint256 pendingDividends,
            uint256 withdrawnDividends
        )
    {
        balance = balances[user];
        userEquity = equity[user];
        withdrawnDividends = withdrawn[user];
        pendingDividends =
            ((userEquity * totalDividends) / 1e18) -
            withdrawnDividends;
    }

    function viewBill()
        public
        view
        returns (
            uint256 energy_consumed,
            uint256 bill,
            uint256 fee,
            uint256 _electricity_cost
        )
    {
        energy_consumed = consumption;
        _electricity_cost = electricity_cost;
        bill = (consumption * electricity_cost);
        fee = bill / 10;
    }

    //TODO: Payout investor
    function payoutInvestor(address user) public {
        require(hasEnded, "Project is has not finished funding round");
        require(
            balances[msg.sender] > 0 &&
                equity[msg.sender] > 0 &&
                user == msg.sender,
            "Caller has not invested in this project"
        );
        uint256 payout = ((equity[msg.sender] * totalDividends) / 1e18) -
            withdrawn[msg.sender];
        withdrawn[msg.sender] += payout;
        token.transfer(user, payout);

    }
}
