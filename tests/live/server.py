"""Local test site for the live run. Serves site/ on 127.0.0.1:8765 and logs, as JSON lines in the file given
as argv[1], every field change the page reports (POST /log) and every Submit click (POST /submit).
Fictional pages only; nothing leaves this computer."""
import http.server, json, sys, time, os

LOG = sys.argv[1]
ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "site")

class H(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *a, **k):
        super().__init__(*a, directory=ROOT, **k)

    def do_POST(self):
        n = int(self.headers.get("Content-Length", 0))
        body = self.rfile.read(n).decode("utf-8", "replace")
        try:
            data = json.loads(body)
        except ValueError:
            data = {"raw": body}
        data["path"] = self.path
        data["t"] = time.time()
        with open(LOG, "a") as f:
            f.write(json.dumps(data) + "\n")
        self.send_response(204)
        self.end_headers()

    def log_message(self, *a):
        pass

http.server.ThreadingHTTPServer(("127.0.0.1", 8765), H).serve_forever()
