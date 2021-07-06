enum Direction {
  UP,
  DOWN,
  LEFT,
  RIGHT
}

Map<Direction, List> possiblesDirections = {
  Direction.UP: [Direction.DOWN, Direction.LEFT, Direction.RIGHT],
  Direction.DOWN: [Direction.UP, Direction.LEFT, Direction.RIGHT],
  Direction.LEFT: [Direction.UP, Direction.DOWN, Direction.RIGHT],
  Direction.RIGHT: [Direction.UP, Direction.DOWN, Direction.LEFT],
};