import socket

def start_server(host='0.0.0.0', port=12345):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((host, port))
    server_socket.listen(1)
    print(f"Server is listening on {host}:{port}")
    
    while True:
        client_socket, client_address = server_socket.accept()
        print(f"Connection received from {client_address}")
        message = client_socket.recv(1024).decode('utf-8')
        print(f"Message received: {message}")
        client_socket.close()

if __name__ == "__main__":
    start_server()
