import os
import requests

CLOUDFLARE_API_TOKEN = os.getenv("CLOUDFLARE_API_TOKEN")
ACCOUNT_ID = os.getenv("CLOUDFLARE_ACCOUNT_ID")
PROJECT_NAME = os.getenv("CLOUDFLARE_PROJECT_NAME")

headers = {
    "Authorization": f"Bearer {CLOUDFLARE_API_TOKEN}",
    "Content-Type": "application/json"
}

def get_deployments():
    url = f"https://api.cloudflare.com/client/v4/accounts/{ACCOUNT_ID}/pages/projects/{PROJECT_NAME}/deployments"
    resp = requests.get(url, headers=headers)
    resp.raise_for_status()
    return resp.json()["result"]

def delete_deployment(deployment_id):
    url = f"https://api.cloudflare.com/client/v4/accounts/{ACCOUNT_ID}/pages/projects/{PROJECT_NAME}/deployments/{deployment_id}"
    resp = requests.delete(url, headers=headers)
    resp.raise_for_status()
    return resp.json()

def main():
    deployments = get_deployments()
    if len(deployments) < 2:
        print("No previous deployment to delete.")
        return
    previous_deployment = deployments[1]
    deployment_id = previous_deployment["id"]
    print(f"Going to DELETE deployment: {deployment_id}")
    result = delete_deployment(deployment_id)
    print("Deletion result:", result)

if __name__ == "__main__":
    main()