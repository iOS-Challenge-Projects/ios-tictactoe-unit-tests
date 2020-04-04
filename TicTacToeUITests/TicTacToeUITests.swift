//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by FGT MAC on 4/4/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class TicTacToeUITests: XCTestCase {
    
    private var app:  XCUIApplication {
        return  XCUIApplication()
    }
    
    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.Label"]
    }
    
    
    override func setUp() {
        //Stop if a test fails
        continueAfterFailure = false
        
        //Lanch app
        app.launch()
    }

    func testWinCheckingVertical1()  {
    
        let button0 = button(for: 0)
        let button1 = button(for: 1)
        let button2 = button(for: 2)
        let button3 = button(for: 3)
        let button4 = button(for: 4)
        let button5 = button(for: 5)
        let button6 = button(for: 6)
//        let button7 = button(for: 7)
//        let button8 = button(for: 8)
        
        button0.tap()
        XCTAssertEqual(button0.label, "X")
        //Check if the label shows the correct turn
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        button1.tap()
        XCTAssertEqual(button1.label, "O")
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        button2.tap()
        XCTAssertEqual(button2.label, "X")
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        button3.tap()
        XCTAssertEqual(button3.label, "O")
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        button4.tap()
        XCTAssertEqual(button4.label, "X")
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        button5.tap()
        XCTAssertEqual(button5.label, "O")
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        button6.tap()
        XCTAssertEqual(button6.label, "X")
        XCTAssertEqual(turnLabel.label, "Player X won!")
    }
    
    
    //Helper method to create the button extension
    private func button(for Index: Int) -> XCUIElement {
        return app.buttons["button\(Index)"]
    }
}
