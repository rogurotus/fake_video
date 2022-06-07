

int32_t AudioDeviceModuleImpl::CreatePlatformSpecificObjects()
{
    WEBRTC_TRACE(kTraceInfo, kTraceAudioDevice, _id, "%s", __FUNCTION__);
    AudioDeviceGeneric* ptrAudioDevice(NULL);
    AudioDeviceUtility* ptrAudioDeviceUtility(NULL);
    // Create the *Linux* implementation of the Audio Device
    //
    if ((audioLayer == kLinuxPulseAudio) || (audioLayer == kPlatformDefaultAudio))
    {
        WEBRTC_TRACE(kTraceInfo, kTraceAudioDevice, _id, "attempting to use the Linux PulseAudio APIs...");
        // create *Linux PulseAudio* implementation
        AudioDeviceLinuxPulse* pulseDevice = new AudioDeviceLinuxPulse(Id());
        if (pulseDevice->Init() != -1)
        {
            ptrAudioDevice = pulseDevice;
            WEBRTC_TRACE(kTraceInfo, kTraceAudioDevice, _id, "Linux PulseAudio APIs will be utilized");
        }
        else
        {
            delete pulseDevice;
#if defined(LINUX_ALSA)
            // create *Linux ALSA Audio* implementation
            ptrAudioDevice = new AudioDeviceLinuxALSA(Id());
            if (ptrAudioDevice != NULL)
            {
                // Pulse Audio was not supported => revert to ALSA instead
                _platformAudioLayer = kLinuxAlsaAudio;  // modify the state set at construction
                WEBRTC_TRACE(kTraceWarning, kTraceAudioDevice, _id, "Linux PulseAudio is *not* supported => ALSA APIs will be utilized instead");
            }
#endif
#if defined(LINUX_PULSE)
        }
#endif
    }
    else if (audioLayer == kLinuxAlsaAudio)
    {
#if defined(LINUX_ALSA)
        // create *Linux ALSA Audio* implementation
        ptrAudioDevice = new AudioDeviceLinuxALSA(Id());
        WEBRTC_TRACE(kTraceInfo, kTraceAudioDevice, _id, "Linux ALSA APIs will be utilized");
#endif
    }
    if (ptrAudioDevice != NULL)
    {
        // Create the Linux implementation of the Device Utility.
        // This class is independent of the selected audio layer
        // for Linux.
        //
        ptrAudioDeviceUtility = new AudioDeviceUtilityLinux(Id());
    }
#endif  // #if defined(WEBRTC_LINUX)
    // Create the *iPhone* implementation of the Audio Device
    //
#if defined(WEBRTC_IOS)
    if (audioLayer == kPlatformDefaultAudio)
    {
        // Create *iPhone Audio* implementation
        ptrAudioDevice = new AudioDeviceIPhone(Id());
        WEBRTC_TRACE(kTraceInfo, kTraceAudioDevice, _id, "iPhone Audio APIs will be utilized");
    }
    if (ptrAudioDevice != NULL)
    {
        // Create the Mac implementation of the Device Utility.
        ptrAudioDeviceUtility = new AudioDeviceUtilityIPhone(Id());
    }
    // END #if defined(WEBRTC_IOS)
    // Create the *Mac* implementation of the Audio Device
    //
#elif defined(WEBRTC_MAC)
    if (audioLayer == kPlatformDefaultAudio)
    {
        // Create *Mac Audio* implementation
        ptrAudioDevice = new AudioDeviceMac(Id());
        WEBRTC_TRACE(kTraceInfo, kTraceAudioDevice, _id, "Mac OS X Audio APIs will be utilized");
    }
    if (ptrAudioDevice != NULL)
    {
        // Create the Mac implementation of the Device Utility.
        ptrAudioDeviceUtility = new AudioDeviceUtilityMac(Id());
    }
#endif  // WEBRTC_MAC
    // Create the *Dummy* implementation of the Audio Device
    // Available for all platforms
    //
    if (audioLayer == kDummyAudio)
    {
        // Create *Dummy Audio* implementation
        assert(!ptrAudioDevice);
        ptrAudioDevice = new AudioDeviceDummy(Id());
        WEBRTC_TRACE(kTraceInfo, kTraceAudioDevice, _id, "Dummy Audio APIs will be utilized");
        if (ptrAudioDevice != NULL)
        {
            ptrAudioDeviceUtility = new AudioDeviceUtilityDummy(Id());
        }
    }
#endif  // if defined(WEBRTC_DUMMY_AUDIO_BUILD)
    if (ptrAudioDevice == NULL)
    {
        WEBRTC_TRACE(kTraceCritical, kTraceAudioDevice, _id, "unable to create the platform specific audio device implementation");
        return -1;
    }
    if (ptrAudioDeviceUtility == NULL)
    {
        WEBRTC_TRACE(kTraceCritical, kTraceAudioDevice, _id, "unable to create the platform specific audio device utility");
        return -1;
    }
    // Store valid output pointers
    //
    _ptrAudioDevice = ptrAudioDevice;
    _ptrAudioDeviceUtility = ptrAudioDeviceUtility;
    return 0;