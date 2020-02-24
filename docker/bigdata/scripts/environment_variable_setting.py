import sys
import requests
import os


if __name__ == '__main__':

    # headers = {'Authorization': 'Bearer ' + sys.argv[2]}
    headers = {}

    discovery_ep = os.environ["DISCOVERY_EP"]
    tenantid = os.environ["TENANT_ID"]

    pods_url = discovery_ep + "/subscriptions/" + tenantid + "/GetPods"
    pods = requests.get(pods_url, headers=headers)

    podIpAddress = ""
    for singlePod in pods.json():
        if singlePod["Name"] == sys.argv[1]:
            podIpAddress = singlePod["Interfaces"][0]["ExternalAddress"]
            break
    
    print(podIpAddress)
