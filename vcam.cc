

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
        }
    }
    if (ptrAudioDevice != NULL)
    {
        ptrAudioDeviceUtility = new AudioDeviceUtilityLinux(Id());
    }
    _ptrAudioDevice = ptrAudioDevice;
    _ptrAudioDeviceUtility = ptrAudioDeviceUtility;
    return 0;