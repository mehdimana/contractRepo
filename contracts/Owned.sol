pragma solidity ^0.4.21;

contract Owned {
    address internal owner;
    
    event LogOwnerChange(address sender, address owner, address newOwner);
    
    /**
     * contruct this contract and remeber owner 
     */
    function Owned() 
            public 
    {
        require(msg.sender != address(0));
        owner = msg.sender;
    }
    
    modifier accessibleByOwnerOnly 
    {
        require(owner == msg.sender);
        _;
    }
    
    /**
     * @return owner of the contract
     */
    function getOwner() 
            public 
            view 
            returns(address ownerAddress) 
    {
        return owner;
    }
    
    /**
     * change the owner of the contract
     * only available to actual owne
     * @return true if call successful
     */
    function setOwner(address newOwner) 
            public 
            accessibleByOwnerOnly 
            returns(bool success)
    {
        assert(newOwner != address(0));
        emit LogOwnerChange(msg.sender, owner, newOwner);
        owner = newOwner;
        return true;
    }
}
