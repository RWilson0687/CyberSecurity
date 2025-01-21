import platform
import subprocess

def ping_sweep(network_prefix, start=1, end=254, timeout=1):
    active_hosts = []
    param = "-n" if platform.system().lower() == "windows" else "-c"

    print(f"Scanning IPs in the range {network_prefix}.{start}-{network_prefix}.{end}...\n")
    
    for ip in range(start, end + 1):
        ip_address = f"{network_prefix}.{ip}"
        try:
            # Run the ping command with a timeout and capture the output
            result = subprocess.run(
                ["ping", param, "1", ip_address],
                stdout=subprocess.PIPE,
                stderr=subprocess.PIPE,
                text=True,  # Ensure the output is a string
                timeout=timeout  # Timeout in seconds
            )
            # Check the output for "TTL" (successful ping response)
            if "TTL" in result.stdout.upper():
                print(f"Active: {ip_address}")
                active_hosts.append(ip_address)
            else:
                print(f"Inactive: {ip_address}")
        except subprocess.TimeoutExpired:
            # Timeout occurred (ping took too long)
            print(f"Timeout: {ip_address}")
        except Exception as e:
            print(f"Error pinging {ip_address}: {e}")

    print("\nActive hosts:")
    for host in active_hosts:
        print(host)

if __name__ == "__main__":
    network_prefix = input("Enter the network prefix (e.g., 192.168.1): ")
    start_ip = int(input("Enter the starting IP (default 1): ") or 1)
    end_ip = int(input("Enter the ending IP (default 254): ") or 254)
    
    ping_sweep(network_prefix, start_ip, end_ip)
