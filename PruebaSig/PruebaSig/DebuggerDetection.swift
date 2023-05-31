//
//  Detector.swift
//  PruebaSig
//
//  Created by Ricardo on 30/05/23.
//

import Foundation

class BreakpointDetection {
    static var breakpointDetected = false

    // Check if breakpoints are detected
    static func checkForBreakpoints() {
        let isDebuggerAttached = isDebuggerPresent()

        if isDebuggerAttached {
            print("Debugger attached.")
            breakpointDetected = true
        } else {
            print("No debugger or breakpoints detected.")
        }
    }

    // Check if a debugger is attached
    // sysctl system call to retrieve information about the current process and checks if the P_TRACED flag is set.
    private static func isDebuggerPresent() -> Bool {
        var info = kinfo_proc()
        var mib : [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        var size = MemoryLayout.stride(ofValue: info)
        
        let sysctlResult = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
        guard sysctlResult == 0 else {
            return false
        }

        return (info.kp_proc.p_flag & P_TRACED) != 0
    }
}
