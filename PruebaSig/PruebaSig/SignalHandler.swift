//
//  SignalHandler.swift
//  PruebaSig
//
//  Created by Ricardo on 30/05/23.
//

import Foundation

func isDebuggerAttached() -> Bool {
    var info = kinfo_proc()
    var mib: [Int32] = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
    var size = MemoryLayout.stride(ofValue: info)

    let sysctlResult = sysctl(&mib, UInt32(mib.count), &info, &size, nil, 0)
    guard sysctlResult == 0 else {
        return false
    }

    return (info.kp_proc.p_flag & P_TRACED) != 0
}
