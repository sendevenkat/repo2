import sys
import argparse


# Function to add properties to required configmaps file based on the environment
def add_configmap(key: str, value: str, environment: str, repo: str):
    f = open(f"/home/vsts/work/1/s/{repo}/{environment}env.properties","a")
    f.write(key+"="+value+"\n")
    f.close()
    print("Addition Completed")



# Function to update properties to required configmaps file based on the environment
def update_configmap(key: str, value: str, environment: str, repo: str):
    with(open(f"/home/vsts/work/1/s/{repo}/{environment}env.properties","r")) as f:
        lines = f.readlines()
    print(f"/home/vsts/work/1/s/{repo}/{environment}env.properties")
    with open(f"/home/vsts/work/1/s/{repo}/{environment}env.properties","w") as f:
        for line in lines:
            if key in line:
                line=line.replace(line, key+"="+value+"\n")
            f.write(line)

    print("Update Completed")


# Function to extract command line arguments
def argumentParser():
    print ('The arguments are:', str(sys.argv[1:]))

    parser = argparse.ArgumentParser()

    parser.add_argument("--update_or_add", help="Check if the new property is to be added or property needs to be updated")
    parser.add_argument("--property", help="Provide the configmap properties to add")
    parser.add_argument("--environment", help="Provide the environment to update the configmap file accordingly")
    parser.add_argument("--repo", help="Provide the repo to update the configmap file accordingly")

    args = parser.parse_args()
    print ('Add ', str(args.update_or_add))
    print ('Add ', str(args.property))
    print ('Add ', str(args.environment))
    print ('Add ', str(args.repo))

    update_or_add = args.update_or_add
    property = args.property.split("=",1)
    key=property[0]
    value=property[1]
    environment = args.environment
    repo = args.repo

    return key, value, environment, update_or_add, repo


if __name__ == "__main__":

    key, value, environment, update_or_add, repo = argumentParser() # calling the function to extract the command line arguments

    # Update or add the properties to the required configmap file based on the environment
    if update_or_add == 'add':
        print("Adding the configmap")
        add_configmap(key, value, environment, repo)
    else:
        print("Updating the configmap")
        update_configmap(key, value, environment, repo)
