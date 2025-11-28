from flask import Flask, request

app = Flask(__name__)

def lcm(a, b):
    from math import gcd
    return abs(a * b) // gcd(a, b)

@app.get("/akbotamaratovamaratkizy_gmail_com")
def compute_lcm():
    x = request.args.get("x")
    y = request.args.get("y")

    if x is None or y is None:
        return "NaN"

    if not x.isdigit() or not y.isdigit():
        return "NaN"

    x = int(x)
    y = int(y)

    return str(lcm(x, y))


if __name__ == "__main__":
    app.run()
