from fastapi import Body, FastAPI
import uvicorn
import os

app = FastAPI()

script_path = "/home/zlorg/app/scripts/"

@app.post("/push/")
async def push(payload: dict = Body(...)):
    if(payload['ref']=='refs/heads/test'):
        os.system('bash ' + script_path + 'ci/build.sh')
    elif(payload['ref']=='refs/heads/main'):
        os.system('bash ' + script_path + 'cd/deploy.sh')
    return {'status': 'SUCCESS'}

if __name__=="__main__":
    uvicorn.run(app, host="0.0.0.0", port=5000)