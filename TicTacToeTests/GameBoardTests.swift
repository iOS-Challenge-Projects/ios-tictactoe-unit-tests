//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by FGT MAC on 4/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
        XCTAssertNil(board[(x: 0, y: 0)])
        XCTAssertNil(board[(x: 1, y: 0)])
        XCTAssertNil(board[(x: 2, y: 0)])
        
        
        XCTAssertNil(board[(x: 0, y: 1)])
        XCTAssertNil(board[(x: 1, y: 1)])
        XCTAssertNil(board[(x: 2, y: 1)])
        
        
        XCTAssertNil(board[(x: 0, y: 2)])
        XCTAssertNil(board[(x: 1, y: 2)])
        XCTAssertNil(board[(x: 2, y: 2)])
     
        for y in 0...2 {
            for x in 0...2{
                XCTAssertNil(board[(x,y)], "⚠️ The entry at( \(x), \(y)) was \(board[(x,y)]!) instead of nil")
            }
        }
    }
    
    
    func testPlacingMarks() {
        var board = GameBoard()
        
        //mark = sign on = position
        
        XCTAssertNoThrow(try! board.place(mark: .o, on : (0,0)))
        XCTAssertTrue(board[(0,0)] == .o)
        
        XCTAssertNoThrow(try! board.place(mark: .x, on : (2,2)))
        XCTAssertTrue(board[(2,2)] == .x)
        
        //Make sure things dont change if we place an o on the same value
        XCTAssertThrowsError(try board.place(mark: .o, on : (2,2)))
        
        //Check if the sign in position (2,2) is an x
        XCTAssertEqual(board[(2,2)], .x)
        
        
        for y in 0...2 {
                 for x in 0...2{
                    if x == 0 && y == 0 { continue }
                    if x == 2 && y == 2 { continue }

                     XCTAssertNil(board[(x,y)], "⚠️ The entry at( \(x), \(y)) was \(board[(x,y)]!) instead of nil")
                 }
             }
        
        //Here we check for error but also check that is the correct error
        //If we place an o on a space which is already in use an error should occur
        XCTAssertThrowsError(try board.place(mark: .o, on : (2,2))) { error in
            XCTAssertEqual(error as? GameBoardError, GameBoardError.invalidSquare)
            }
    }
    
    func testIsFull() {
        var board = GameBoard()
        
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on : (0,0))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on : (0,1))
        XCTAssertFalse(board.isFull)
        
        
        try! board.place(mark: .x, on : (1,0))
        XCTAssertFalse(board.isFull)
        
        
        try! board.place(mark: .x, on : (2,0))
        XCTAssertFalse(board.isFull)
        
        
        try! board.place(mark: .x, on : (0,2))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on : (1,1))
        XCTAssertFalse(board.isFull)
        
        
        try! board.place(mark: .x, on : (2,1))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on : (1,2))
        XCTAssertFalse(board.isFull)
        
        try! board.place(mark: .x, on : (2,2))
        XCTAssertTrue(board.isFull)
        
        
    }

}
