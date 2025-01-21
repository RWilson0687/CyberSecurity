import socket

def send_message(host, port, message):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((host, port))
    client_socket.sendall(message.encode('utf-8'))
    client_socket.close()

if __name__ == "__main__":
    target_host = input("Enter the server's IP address: ")
    target_port = int(input("Enter the server's port: "))
    message = input("Enter the message to send: ")
    send_message(target_host, target_port, message)
