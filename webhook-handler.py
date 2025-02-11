from http.server import BaseHTTPRequestHandler, HTTPServer
import subprocess

class WebhookHandler(BaseHTTPRequestHandler):
    def do_POST(self):
        self.send_response(200)
        self.end_headers()
        subprocess.call(["/home/ec2-user/update-site.sh"])

if __name__ == "__main__":
    server_address = ('', 8080)
    httpd = HTTPServer(server_address, WebhookHandler)
    print("Listening for webhooks...")
    httpd.serve_forever()
