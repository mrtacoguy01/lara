//
//  ContentView.swift
//  lara
//
//  Created by ruter on 23.03.26.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var exploit = KRWExploitManager.shared
    @ObservedObject private var kfs = KRWKFSManager.shared

    var body: some View {
        NavigationStack {
            List {
                Button(exploit.isRunning ? "Running..." : "Run Exploit") {
                    exploit.runExploit()
                }
                .disabled(exploit.isRunning)

                Button("Init KFS") {
                    kfs.initialize()
                }
                .disabled(exploit.isRunning || !exploit.isReady || kfs.isReady)

                Text(exploit.isReady ? "Exploit Ready: Yes" : "Exploit Ready: No")
                Text(kfs.isReady ? "KFS Ready: Yes" : "KFS Ready: No")
                Text(String(format: "kernel_base:  0x%llx", exploit.kernelBase))
                Text(String(format: "kernel_slide: 0x%llx", exploit.kernelSlide))
                
                Button("Clear Logs") {
                    globallogger.clear()
                }
            }
            .navigationTitle("lara")
        }
    }
}
