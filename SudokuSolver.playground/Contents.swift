import UIKit

/// Coordinates:
///
///   :
/// ↑ 0 0
/// y 0 0 ..
///   x →
///
///               :  :
///               0  0
///               0  0
/// sudokuGrid = [0, 0, ...]

var sudokuGrid: [[Int]] = Array(repeating: Array(repeating: 0, count: 9), count: 9)

for x in 0..<9 {
    for y in 0..<9 {
        sudokuGrid[x][y] = 0
    }
}

func printGrid() {
    for y in 0..<9 {
        var line = ""
        for x in 0..<9 {
            line += "\(sudokuGrid[x][8-y]) "
        }
        print(line)
    }
}

func isValidAt(value: Int, x: Int, y: Int) -> Bool {
    // Check if value is contained in top-to-bottom row
    if sudokuGrid[x].contains(value) {
        return false
    }

    // Check if value is contained in left-to-right row
    for index in 0..<9 {
        if sudokuGrid[index][y] == value {
            return false
        }
    }

    // NO - ONLY CHECK THE SUBGRID THE SPECIFIED SLOT IS ON

    // 0 - 0
    // 1 - 0
    // 2 - 0
    // 3 - 3
    // 4 - 3
    // 5 - 3
    // 6 - 6
    // 7 - 6
    // 8 - 6

    // 8 / 3 = 2
    // 2 x (8/3) + 8 % 3


    // Check if value is contained in 3x3 grid
    let subGridValues = [
        (0, 0), (0, 3), (0, 6),
        (3, 0), (3, 3), (3, 6),
        (6, 0), (6, 3), (6, 6),
    ]
    let subGridSize = 3

    for subgrid in subGridValues {
        for x in subgrid.0..<subgrid.0 + subGridSize {
            for y in subgrid.1..<subgrid.1 + subGridSize {
                if sudokuGrid[x][y] == value {
                    return false
                }
            }
        }
    }

    // If we arrive here, the value is valid
    return true
}

sudokuGrid[0][2] = 1

isValidAt(value: 1, x: 0, y: 3)
isValidAt(value: 1, x: 1, y: 2)
isValidAt(value: 1, x: 3, y: 3)

printGrid()
