data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = <<-EOF
      package_update: true
      packages:
        - docker.io
        - docker-compose
      groups:
        - docker
      users:
        - default
        - name: ubuntu
          groups: docker
      write_files:
      - path: /home/ubuntu/wireguard/wg-config.yaml
        encoding: b64
        content: ${var.wg_access_server_config}
        owner: ubuntu:ubuntu
        permissions: '0644'
      - path: /home/ubuntu/wireguard/docker-compose.yaml
        encoding: b64
        content: ${var.docker_compose_file}
        owner: ubuntu:ubuntu
        permissions: '0644'
      runcmd:
        - [ cd, /home/ubuntu/wireguard ]
        - [ docker-compose, up, -d ]
    EOF
  }
}