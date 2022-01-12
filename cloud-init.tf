data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content      = <<-EOF
      package_update: true
      packages:
        - docker.io
      groups:
        - docker
      users:
        - default
        - name: ubuntu
          groups: docker
    EOF
  }
}