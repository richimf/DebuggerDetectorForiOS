//
//  ViewController.swift
//  PruebaSig
//
//  Created by Ricardo on 30/05/23.
//

import UIKit
import Darwin

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /**
        When a SIGTRAP signal is raised, it typically indicates that a specific breakpoint or tracing condition has been encountered.
        It is often used by debuggers to pause program execution at a particular point, allowing developers to inspect the program's state, variables, and control flow.
        In addition to breakpoints, SIGTRAP can also be generated manually using the raise function or by using debugger commands.
         */
        
        Darwin.raise(SIGTRAP)
        let debuggerAttached = isDebuggerAttached()
        if debuggerAttached {
            print("Debugger attached.")
        } else {
            print("No debugger detected.")
        }
        
        if BreakpointDetection.breakpointDetected {
           print("Breakpoint detected")
        } else {
            print("Breakpoint not detected")
        }
    }
    
//    func raiseSIGTRAPException() {
//        NSException(name: NSExceptionName("SIGTRAP"), reason: "SIGTRAP signal received.", userInfo: nil).raise()
//    }
}

