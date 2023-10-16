protocol CargoManaging {
    func addCargo(item: String)
    func removeCargo(item: String)
    func listCargo() -> [String]
}

protocol CrewManaging {
    func addCrew(member: String)
    func removeCrew(member: String)
    func listCrew() -> [String]
}

protocol Cannons {
    var cannonCount: Int { get }
    func fireCannon(count: Int)
}

class PirateShip: CargoManaging, CrewManaging, Cannons {
    var name: String
    var cannonCount: Int
    private var cargoManager: CargoManaging
    private var crewManager: CrewManaging
    
    init(name: String, cannonCount: Int, cargoManager: CargoManaging, crewManager: CrewManaging) {
        self.name = name
        self.cannonCount = cannonCount
        self.cargoManager = cargoManager
        self.crewManager = crewManager
    }
    
    func addCargo(item: String) {
        cargoManager.addCargo(item: item)
    }
    
    func removeCargo(item: String) {
        cargoManager.removeCargo(item: item)
    }
    
    func listCargo() -> [String] {
        return cargoManager.listCargo()
    }
    
    func addCrew(member: String) {
        crewManager.addCrew(member: member)
    }
    
    func removeCrew(member: String) {
        crewManager.removeCrew(member: member)
    }
    
    func listCrew() -> [String] {
        return crewManager.listCrew()
    }
    
    func fireCannon(count: Int) {
        if count <= cannonCount {
            cannonCount -= count
            print("\(count) cannons fired! Remaining cannons: \(cannonCount)")
        } else {
            print("Not enough cannons to fire!")
        }
    }
}

class CargoManager: CargoManaging {
    private var cargo: [String] = []
    
    func addCargo(item: String) {
        cargo.append(item)
    }
    
    func removeCargo(item: String) {
        if let index = cargo.firstIndex(of: item) {
            cargo.remove(at: index)
        }
    }
    
    func listCargo() -> [String] {
        return cargo
    }
}

class CrewManager: CrewManaging {
    private var crew: [String] = []
    
    func addCrew(member: String) {
        crew.append(member)
    }
    
    func removeCrew(member: String) {
        if let index = crew.firstIndex(of: member) {
            crew.remove(at: index)
        }
    }
    
    func listCrew() -> [String] {
        crew
    }
}

class TreasureMap {
    func hintToTreasure(x: Int, y: Int) {
        print("Follow the path at (\(x), \(y)) to find the treasure!")
    }
}

class SeaAdventure {
    private var adventureType: String
    
    init(adventureType: String) {
        self.adventureType = adventureType
    }
    
    func encounter() {
        print("Encountered a \(adventureType) adventure!")
    }
}

class PirateCode {
    private func discussTerms(term: String) {
        print("Negotiations are started: \(term)")
    }
    
    func peacefulTalks() {
        let negotiationTerms = "Ceasefire agreement"
        discussTerms(term: negotiationTerms)
        print("Peaceful Talks successful! Terms: \(negotiationTerms)")
    }
    
    func crewUprising() {
        let mutinyTerms = "Fair distribution of resources"
        discussTerms(term: mutinyTerms)
        print("Crew Uprising successful! Terms: \(mutinyTerms)")
    }
    
    
}
extension TreasureMap {
    func searchForTreasure() {
        print("Following the map...")
        print("X marks the spot! But... where is the treasuse?")
    }
}

extension PirateShip {
    func searchForTreasure(using treasureMap: TreasureMap) {
        print("\(name) is setting sail to find the treasure!")
        treasureMap.searchForTreasure()
    }
}

let cargoManager = CargoManager()
let crewManager = CrewManager()

let pirateShip = PirateShip(name: "Black Pearl", cannonCount: 10, cargoManager: cargoManager, crewManager: crewManager)

pirateShip.addCargo(item: "Gold")
pirateShip.addCrew(member: "Jack Sparrow")

let treasureMap = TreasureMap()
treasureMap.hintToTreasure(x: 5, y: 10)

pirateShip.searchForTreasure(using: treasureMap)

let pirateCode = PirateCode()
pirateCode.peacefulTalks()

let seaAdventure = SeaAdventure(adventureType: "Sky Pirates' Soar")
seaAdventure.encounter()
