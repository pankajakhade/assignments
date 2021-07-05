module "network" {
  source = "terraform-google-modules/network/google"
  version = "~> 2.5.0"
  project_id = var.projectId
  network_name = "gcp-net"
  delete_default_internet_gateway_routes = true
  routing_mode = "GLOBAL"
  subnets = [
    {
      subnet_name = "subnetA"
      subnet_ip = "10.0.1.0/24"
      subnet_region = var.region
      subnet_private_access = true
      subnet_flow_logs = true
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    },
    {
      subnet_name = "subnetB"
      subnet_ip = "10.0.2.0/24"
      subnet_region = var.region
      subnet_private_access = true
      subnet_flow_logs = true
      subnet_flow_logs_interval = "INTERVAL_10_MIN"
      subnet_flow_logs_sampling = 0.7
      subnet_flow_logs_metadata = "INCLUDE_ALL_METADATA"
    }
  ]
}