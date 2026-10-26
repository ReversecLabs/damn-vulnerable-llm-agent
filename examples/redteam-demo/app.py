import argparse
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
def health():
    return {"healthy": True}

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--port", type=int, default=8000)
    parser.add_argument("--mode", type=str, default="vulnerable")
    args = parser.parse_args()
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=args.port)

if __name__ == "__main__":
    main()
