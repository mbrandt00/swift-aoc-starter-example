import Algorithms

struct Day01: AdventDay {
  var data: String

  var entities: [[Int]] {
    data.split(separator: "\n").map {
      $0.split(separator: " ").compactMap { Int($0) }
    }
  }

  // Replace this with your solution for the first part of the day's challenge.
  func part1() -> Int {
    let (list1, list2): ([Int], [Int]) = entities.reduce(into: ([], [])) { result, tuple in
      result.0.append(tuple[0])
      result.1.append(tuple[1])
    }

    return zip(list1.sorted(), list2.sorted())
      .map { abs($0 - $1) }
      .reduce(0, +)
  }

  // Replace this with your solution for the second part of the day's challenge.
  func part2() -> Int {
    let (list1, list2): ([Int], [Int]) = entities.reduce(into: ([], [])) { result, tuple in
      result.0.append(tuple[0])
      result.1.append(tuple[1])
    }

    // Create frequency dictionary for list2
    let list2Frequencies = list2.reduce(into: [:]) { counts, num in
      counts[num, default: 0] += 1
    }

    // Calculate total using the frequency dictionary
    return list1.reduce(0) { total, num in
      total + (num * (list2Frequencies[num] ?? 0))
    }
  }
}
