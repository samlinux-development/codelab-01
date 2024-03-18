import Map "mo:base/HashMap";
import Text "mo:base/Text";
import Result "mo:base/Result";

actor {
  
  //record type
  type Entry = {
    word: Text;
    description: Text;
  };
  
  // mutable
  var db = Map.HashMap<Text, Entry>(0, Text.equal, Text.hash);

  public func addWord(word : Text, description: Text) : async Result.Result<Text, Text>{
    db.put(word, { word = word; description = description; });
    #ok("Word added")
  };

  public query func getWord(word : Text) : async Result.Result<Entry, Text>{
    // immutable
    let entry = db.get(Text.toLowercase(word));
    switch entry {
      case (null) {
        return #err("Word not found");
      };
      case (?entry) {
        return #ok(entry);
      };
    }
  };
};