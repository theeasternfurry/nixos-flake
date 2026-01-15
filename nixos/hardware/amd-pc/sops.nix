{
  sops.secrets."GITHUB_TOKEN" = {
    sopsFile = ../../../secrets/password.yaml; 
    owner = "theeasternfurry"; # Tên user của bạn
    group = "users"; # Nhóm mặc định thường là "users"
  };
  sops.age.keyFile = "/home/theeasternfurry/.config/sops/age/keys.txt";
}
