import sys
import argparse
from ruamel.yaml import YAML


# Function to add sed command to eycomply-base configmap pipeline file
def add_configmap(key: str, value: str):
    with open("/home/vsts/work/1/s/eycomply-base/pipelines/configmap/EYC-Configmap-Universal.yml", "r") as f:
        inp=f.read()

    yaml = YAML()
    code = yaml.load(inp)
    print(code)

    # Find the step number of the "Replace KeyVault placeholders in Configmap file" task
    step_counter = -1 # Initialize the step counter to -1 since the steps are 0 indexed
    for step in code['steps']:
        if 'displayName' in step:
            if step['displayName'] == 'Replace KeyVault placeholders in Configmap file':
                step_counter = step_counter + 1
                break
        step_counter = step_counter + 1

    script=code['steps'][step_counter]['inputs']['script']
    script_lines = script.split("\n")

    print(len(script_lines))

    if(f"sed -i 's|={key}$|=$({key})|g' $PROPERTIES_FILE" in script_lines):
        return

    if('&' in value):
        script_lines.insert(-3, f"sed -i 's|={key}$|=$({key})|g' $PROPERTIES_FILE")
        script_lines.insert(-3, f"sed -i 's|={key}|\&|g' $PROPERTIES_FILE")
    else:
        script_lines.insert(-3, f"sed -i 's|={key}$|=$({key})|g' $PROPERTIES_FILE")
    print(len(script_lines))

    script='\n'.join(script_lines)

    code['steps'][step_counter]['inputs']['script'] = script


    with open("/home/vsts/work/1/s/eycomply-base/pipelines/configmap/EYC-Configmap-Universal.yml", "w") as f:
        yaml.default_flow_style = False
        yaml.width=sys.maxsize
        yaml.dump(code, sys.stdout)
        yaml.dump(code, f)
    with open("/home/vsts/work/1/s/eycomply-base/pipelines/configmap/EYC-Configmap-Universal.yml", "r") as f:
        inp=f.read()
    print(yaml.load(inp))

# Function to extract command line arguments
def argumentParser():
    print ('The arguments are:', str(sys.argv[1:]))

    parser = argparse.ArgumentParser()

    parser.add_argument("--key_value", help="Add value to the Configmap pipeline")
    
    args = parser.parse_args()
    key_value = args.key_value.split("=")
    key,value = key_value[0], key_value[1]
    print ('Add ', str(args.key_value))

    return key,value


if __name__ == "__main__":

    key,value = argumentParser() # calling the function to extract the command line arguments
    print(type(value))
    # Update or add the properties to the required configmap file based on the environment
    print("Updating the eycomply-base configmap pipeline file")
    add_configmap(key,value)
    
    print("Update Completed")
