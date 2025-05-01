function vfio
    set action $argv[1]

    set gpu "0000:01:00.0"
    set aud "0000:01:00.1"
    set gpu_vd (cat /sys/bus/pci/devices/$gpu/vendor) (cat /sys/bus/pci/devices/$gpu/device)
    set aud_vd (cat /sys/bus/pci/devices/$aud/vendor) (cat /sys/bus/pci/devices/$aud/device)

    if test $action = "bind"
        echo "Binding GPU and audio device to VFIO..."
        sudo echo $gpu > /sys/bus/pci/devices/$gpu/driver/unbind
        sudo echo $aud > /sys/bus/pci/devices/$aud/driver/unbind
        echo $gpu_vd | sudo tee /sys/bus/pci/drivers/vfio-pci/new_id > /dev/null
        echo $aud_vd | sudo tee /sys/bus/pci/drivers/vfio-pci/new_id > /dev/null
    else if test $action = "unbind"
        echo "Unbinding GPU and audio device from VFIO and rescanning..."
        echo $gpu_vd | sudo tee /sys/bus/pci/drivers/vfio-pci/remove_id > /dev/null
        echo $aud_vd | sudo tee /sys/bus/pci/drivers/vfio-pci/remove_id > /dev/null
        echo 1 | sudo tee /sys/bus/pci/devices/$gpu/remove > /dev/null
        echo 1 | sudo tee /sys/bus/pci/devices/$aud/remove > /dev/null
        echo 1 | sudo tee /sys/bus/pci/rescan > /dev/null
    else
        echo "Usage: vfio bind|unbind"
        return 1
    end
end
