from fastapi import Body, FastAPI
import uvicorn
import os

app = FastAPI()

script_path = "/home/zlorg/app/scripts"

@app.post("/push/")
async def push(payload: dict = Body(...)):
    if(payload['ref']=='refs/heads/test'):
        os.system('bash ' + script_path + 'ci/build.sh')
    return {'status': 'SUCCESS'}