import socket
import threading

# Function to scan a single port
def scan_port(ip, port):
    try:
        # Create a socket object
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        sock.settimeout(1)  # Timeout after 1 second
        result = sock.connect_ex((ip, port))  # Try to connect to the port
        if result == 0:  # If the result is 0, the port is open
            print(f"Port {port} is OPEN on {ip}")
        sock.close()
    except Exception as e:
        print(f"Error scanning port {port}: {e}")

# Function to scan multiple ports (multi-threaded)
def scan_ports(ip, start_port, end_port):
    print(f"Scanning ports on {ip} from {start_port} to {end_port}...\n")
    threads = []
    
    # Create a thread for each port
    for port in range(start_port, end_port + 1):
        thread = threading.Thread(target=scan_port, args=(ip, port))
        threads.append(thread)
        thread.start()
    
    # Wait for all threads to finish
    for thread in threads:
        thread.join()

if __name__ == "__main__":
    ip_address = input("Enter the IP address to scan (e.g., 192.168.1.1): ")
    start_port = int(input("Enter the starting port (e.g., 1): ") or 1)
    end_port = int(input("Enter the ending port (e.g., 1024): ") or 1024)

    scan_ports(ip_address, start_port, end_port)
