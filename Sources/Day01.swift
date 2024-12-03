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
  func part2() -> Any {
    // Sum the maximum entries in each set of data
    entities.map { $0.max() ?? 0 }.reduce(0, +)
  }
}
