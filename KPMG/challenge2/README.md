Below are the command examples:

python retrieveInstanceMetadata.py --hosts {Space separated host IPs} --privateKey {Private key to connect to all provided hosts} --user ubuntu # This is a generic command.

python retrieveInstanceMetadata.py --hosts {VM_IPs} --privateKey /tmp/pemfile --user ubuntu # This command will give us all metadata for provided instances.

python retrieveInstanceMetadata.py --hosts {VM_IPs} --privateKey /tmp/pemfile --user ubuntu --metadata network hostname # This command will give us selected metadata values for provided instances.
