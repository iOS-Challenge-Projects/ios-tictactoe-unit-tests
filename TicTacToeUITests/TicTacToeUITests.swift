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
    
    private var restartButton: XCUIElement {
        return app.staticTexts["Restart"]
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
    
    
    func testRestartingGame() {
        
        let button4 = button(for: 4)
        button4.tap()
        
        //Check if the mark was placed
        XCTAssertEqual(button4.label, "X")
        
        //Check if the mark was placed
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        //Reset the game
        restartButton.tap()
        
        //Make sure the board is clear
        for i in 0...8{
            XCTAssertEqual(button(for: i).label, " ")
        }
    }
    
    //Example of expectations
    func testExample() {
        
        //Example one using a predicate (this is a basic ex)
        let predicate = NSPredicate(format: "exists == true")

        expectation(for: predicate, evaluatedWith: button(for: 0), handler: nil)
        
        //Give the amount of time to wait till it runs the check
        waitForExpectations(timeout: 3, handler: nil)
        
        
        //Example two
        let dataFetchExpectation = expectation(description: "Fetched data from API")
        
        DispatchQueue.global().async {
            if self.button(for: 0).exists{
                dataFetchExpectation.fulfill()
            }
        }
        wait(for: [dataFetchExpectation], timeout: 2)
        
    }
    
    
    //Helper method to create the button extension
    private func button(for Index: Int) -> XCUIElement {
        return app.buttons["button\(Index)"]
    }
}
