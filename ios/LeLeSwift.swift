//
//  Created by Emanuele Parini
//

import ZIPFoundation

@objc(LeLeSwift)
final class LeLeSwift: CDVPlugin {

    @objc(downloadConfig:)
      func downloadConfig(command: CDVInvokedUrlCommand) {
        let url = command.arguments[0] as? String ?? ""
        
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let folderURL = documentsDirectoryURL
        let fileURL = folderURL.appendingPathComponent("config.zip")
        
        // Unzip
        do {
            try FileManager.default.unzipItem(at: fileURL, to: folderURL.appendingPathComponent("config"))
        } catch {
            print("Creation of ZIP archive failed with error:\(error)")
        }
          
        print("Unzip completed!", fileURL)

        let pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: "success"
        )

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
      }

    @objc(downloadResources:)
      func downloadResources(command: CDVInvokedUrlCommand) {
        let url = command.arguments[0] as? String ?? ""
        
        let documentsDirectoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let folderURL = documentsDirectoryURL.appendingPathComponent(url)
        let fileURL = folderURL.appendingPathComponent(url + ".zip")
        
        // Unzip
        do {
            try FileManager.default.unzipItem(at: fileURL, to: folderURL)
        } catch {
            print("Creation of ZIP archive failed with error:\(error)")
        }
          
        print("Unzip completed!", fileURL)

        let pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: "success"
        )

        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
      }
}
