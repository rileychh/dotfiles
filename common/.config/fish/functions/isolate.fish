function isolate
    # Get number of CPUs to isolate
    set -l num_cpus_to_isolate $argv[1]

    # Get total number of CPUs
    set -l total_cpus (grep -c ^processor /proc/cpuinfo)
    set -l max_cpu_index (math $total_cpus - 1)

    # If no argument given, release all CPUs
    if test -z "$num_cpus_to_isolate"
        echo "Releasing all CPUs..."
        sudo systemctl set-property --runtime -- system.slice AllowedCPUs=0-$max_cpu_index
        sudo systemctl set-property --runtime -- user.slice AllowedCPUs=0-$max_cpu_index
        sudo systemctl set-property --runtime -- init.scope AllowedCPUs=0-$max_cpu_index
        return 0
    end

    # Validate the input number
    if not string match -qr '^[0-9]+$' $num_cpus_to_isolate
        echo "Error: Please provide a valid number of CPUs to isolate"
        return 1
    end

    # Check if the requested number is valid
    if test $num_cpus_to_isolate -ge $max_cpu_index
        echo "Error: Cannot isolate $num_cpus_to_isolate CPUs (only $total_cpus available)"
        return 1
    end

    # Calculate the range of isolated and allowed CPUs
    set -l isolated_cpus (math $total_cpus - $num_cpus_to_isolate)
    set -l isolated_end_index (math $num_cpus_to_isolate - 1)
    set -l allowed_start_index (math $num_cpus_to_isolate)

    # Set the allowed CPUs for system slices
    echo "Isolating $num_cpus_to_isolate CPUs (0-$isolated_end_index)"
    echo "Allowing CPUs $allowed_start_index-$max_cpu_index for system processes"

    sudo systemctl set-property --runtime -- system.slice AllowedCPUs=$allowed_start_index-$max_cpu_index
    sudo systemctl set-property --runtime -- user.slice AllowedCPUs=$allowed_start_index-$max_cpu_index
    sudo systemctl set-property --runtime -- init.scope AllowedCPUs=$allowed_start_index-$max_cpu_index

    echo "CPUs 0-$isolated_end_index are now isolated"
end
