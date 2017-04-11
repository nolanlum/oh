import Cocoa
import AVFoundation

var meme: AVAudioPlayer?

@available(OSX 10.12.2, *)
class Application: NSApplication, NSTouchBarDelegate {

    override func makeTouchBar() -> NSTouchBar? {
        return touchBar
    }
    
}

extension NSApplication {
    
    @IBAction func PlayMemeSound(_ sender: NSButton) {
        if let soundAsset = NSDataAsset(name: sender.identifier!) {
            do {
                meme = try AVAudioPlayer(data: soundAsset.data)
                meme?.play()
            }
            catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    
}
