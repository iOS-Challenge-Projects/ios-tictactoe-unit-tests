//
//  GameAITests.swift
//  TicTacToeTests
//
//  Created by FGT MAC on 4/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameAITests: XCTestCase {

    func testWinCheckingVertical0() {
        
        var board = GameBoard()
        
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (1,0))
        
        try! board.place(mark: .x, on: (0,0))
        try! board.place(mark: .o, on: (1,0))
        
        try! board.place(mark: .x, on: (0,0))
 
        XCTAssertTrue(game(board: board, isWonBy: .x))
        
        XCTAssertFalse(game(board: board, isWonBy: .o))
    }

}
