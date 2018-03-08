//
//  JSONHelperFunctions.swift
//  PrettyGoodPokedex
//
//  Created by Kevin Tan on 1/28/18.
//  Copyright © 2018 ACM Hack. All rights reserved.
//

import Foundation

// This method opens the file "pokedex.json" and reads the data as binary data (NSData) first.
// In the "do" block, it converts the raw binary data into a JSON array object. A JSON object is
// of type "Any", so an array of "Any" is returned ("[Any]"). If there is an error in the parsing,
// the error is recognized in the "catch" block, and the error message is printed out.
// Note: see pokedex.json to see what JSON syntax looks like. JSON is just a way to represent something
// in plain text data.
fileprivate func getJSON() -> [Any] {
    if let filePath = Bundle.main.path(forResource:"peopleIndex", ofType:"json") {
        if let data = NSData(contentsOfFile: filePath) {
            do {
                let json = try JSONSerialization.jsonObject(with: data as Data, options: []) as! [String:Any]
                return json["people"] as! [Any]
            } catch let error as NSError {
                print("Error occured while loading json file")
                print(error.description)
                return []
            }
        }
    }
    return []
}

// This method gets a JSON array of pokemon data and converts each JSON object
// into an actual Pokemon object as defined in Pokemon.swift.
func getPeople() -> [People] {
    
    let data = getJSON()
    var peopleArray: [People] = []
    
    for object in data {
        
        var people = object as! Dictionary<String, Any>
        
        let name = people["name"] as! String
        let place = people["place"] as! String
        let score = people["score"] as! String
        
        let newPeople = People(name: name,place: place, score: score)
        peopleArray.append(newPeople)
        
    }
    
    return peopleArray
    
}

