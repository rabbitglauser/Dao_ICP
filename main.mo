import Nat "mo:base/Nat";

actor DAO {
  // Variables to store proposals and votes
  stable var proposals : [Text] = [];
  stable var votes : [Nat] = [];

  // Function to submit a proposal
  public func submitProposal(proposal: Text): async Bool {
    proposals := Array.append(proposals, [proposal]);
    votes := Array.append(votes, [0]);
    return true;
  };

  // Function to vote on a proposal
  public func voteOnProposal(proposalIndex: Nat): async Bool {
    if (proposalIndex < Array.size(proposals)) {
      votes[proposalIndex] := Nat.add(votes[proposalIndex], 1);
      return true;
    };
    return false;
  };

  // Function to get the list of proposals and votes
  public func getProposals(): async [(Text, Nat)] {
    return Array.map<Nat, (Text, Nat)>(func(i: Nat): (Text, Nat) {
      return (proposals[i], votes[i]);
    }, Array.tabulate<Nat>(Array.size(proposals), func(i: Nat): Nat { i }));
  };
};
