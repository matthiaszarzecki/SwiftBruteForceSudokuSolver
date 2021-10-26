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

/// Returns the start-coordinate for the value
/// for the subgrid the coordinate is in.
func getLowerCoordinate(value: Int) -> Int {
    return (value / 3) * 3
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

    let subGridStartX = getLowerCoordinate(value: x)
    let subGridStartY = getLowerCoordinate(value: y)
    let subGridSize = 3

    for x in subGridStartX..<subGridStartX + subGridSize {
        for y in subGridStartY..<subGridStartY + subGridSize {
            if sudokuGrid[x][y] == value {
                return false
            }
        }
    }

    // If we arrive here, the value is valid
    return true
}

sudokuGrid[0][0] = 1

// false
isValidAt(value: 1, x: 0, y: 0)
isValidAt(value: 1, x: 1, y: 0)
isValidAt(value: 1, x: 0, y: 1)
isValidAt(value: 1, x: 1, y: 1)
isValidAt(value: 1, x: 2, y: 2)

// true
isValidAt(value: 1, x: 3, y: 3)
isValidAt(value: 1, x: 1, y: 4)

printGrid()
