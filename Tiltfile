custom_build(
    ref = "loqc/app",
    command =  "nix build .#loqc-container-image -L && docker load < result",
    deps = ["."],
    ignore = ["target", "k8s", ".direnv", "result*"],
    tag = "latest"
);
k8s_yaml("k8s/loqc.yaml");

docker_build(
    ref = "loqc/matrix-homeserver",
    dockerfile = "k8s/matrix-homeserver.dockerfile",
    context = "."
);

k8s_yaml("k8s/matrix-homeserver.yaml");