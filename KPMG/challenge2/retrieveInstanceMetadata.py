from fabric.api import run, env, execute, settings, hide
from argparse import ArgumentParser

parser = ArgumentParser(description="Retrieve instance metadata.")
parser.add_argument('--hosts', required=True, nargs='+', help="List of host IPs")
parser.add_argument('--privateKey', required=True, help="Private key of hosts")
parser.add_argument('--user', required=True, help="Host user")
parser.add_argument('--metadata', required=False, nargs='+', help="Metadata keys to be retrieved")
args = parser.parse_args()

env.hosts = args.hosts
env.connection_attempts = 5
env.disable_keown_hosts = True
env.key_filename = args.privateKey
env.user = args.user
metadata_keys = args.metadata
if metadata_keys is None:
    metadata_keys = []


def run_command():
    with settings(
        hide('warnings', 'running', 'stdout', 'stderr', 'status', 'aborts', 'user'),
    ):
        output = ""
        for key_ in metadata_keys:
            curl_cmd = "curl http://169.254.169.254/latest/meta-data/" + key_
            output = output + key_ + ": " + run(curl_cmd).stdout + '\n'
        if output == "":
            output = output + run("curl http://169.254.169.254/latest/meta-data/").stdout
        return output


output = execute(run_command)

for ip in env.hosts:
    print("Metadata for {} \n{}".format(ip, output[ip]))