import AudioToolbox
import Testing
@testable import FineTune

@Suite("Core Audio idle sleep participation", .serialized)
struct AudioIdleSleepTests {
    @Test("Sets and restores kAudioHardwarePropertySleepingIsAllowed")
    func sleepingAllowedProperty() throws {
        var address = AudioObjectPropertyAddress(
            mSelector: kAudioHardwarePropertySleepingIsAllowed,
            mScope: kAudioObjectPropertyScopeGlobal,
            mElement: kAudioObjectPropertyElementMain
        )
        var original = UInt32(0)
        var size = UInt32(MemoryLayout<UInt32>.size)
        let readStatus = AudioObjectGetPropertyData(
            AudioObjectID(kAudioObjectSystemObject),
            &address,
            0,
            nil,
            &size,
            &original
        )
        try #require(readStatus == noErr)
        defer {
            try? AudioObjectID.setSleepingAllowedDuringAudioIO(original != 0)
        }

        try AudioObjectID.setSleepingAllowedDuringAudioIO(true)

        var updated = UInt32(0)
        size = UInt32(MemoryLayout<UInt32>.size)
        let updatedStatus = AudioObjectGetPropertyData(
            AudioObjectID(kAudioObjectSystemObject),
            &address,
            0,
            nil,
            &size,
            &updated
        )
        try #require(updatedStatus == noErr)
        #expect(updated == 1)
    }
}
