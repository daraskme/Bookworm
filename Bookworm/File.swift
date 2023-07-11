import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let M = input[1]

var fares = [[Int]]()
for _ in 0..<N {
    let fare = readLine()!.split(separator: " ").map { Int($0)! }
    fares.append(fare)
}

let X = Int(readLine()!)!

var stations = [(Int, Int)]()
for _ in 0..<X {
    let station = readLine()!.split(separator: " ").map { Int($0)! }
    stations.append((station[0], station[1]))
}

func calculateFare(startRoute: Int, startStation: Int, goalRoute: Int, goalStation: Int) -> Int {
    var fare = 0
    
    for i in startStation..<M {
        fare += fares[startRoute-1][i]
    }
    
    for i in startRoute..<goalRoute {
        fare += fares[i][M-1] - fares[i][0]
    }
    
    for i in 0..<goalStation {
        fare += fares[goalRoute-1][i]
    }
    
    return fare
}

var totalFare = 0
var currentRoute = 1
var currentStation = 1

for (route, station) in stations {
    totalFare += calculateFare(startRoute: currentRoute, startStation: currentStation, goalRoute: route, goalStation: station)
    currentRoute = route
    currentStation = station
}

print(totalFare)
