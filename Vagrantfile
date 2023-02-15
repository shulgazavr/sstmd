MACHINES = {
  :"kernel-update" => {
              :box_name => "centos/stream8",
              :box_version => "20210210.0",
              :cpus => 2,
              :memory => 1024,
            }
}

Vagrant.configure("2") do |config|
  MACHINES.each do |boxname, boxconfig|
    config.vm.synced_folder ".", "/vagrant", disabled: true
    config.vm.define boxname do |box|
      box.vm.box = boxconfig[:box_name]
      box.vm.box_version = boxconfig[:box_version]
      box.vm.host_name = boxname.to_s
      box.vm.provider "virtualbox" do |v|
        v.memory = boxconfig[:memory]
        v.cpus = boxconfig[:cpus]
      end
    end
    config.vm.provision "file", source: "watchlog", destination: "/home/vagrant/watchlog"
    config.vm.provision "file", source: "fsgi", destination: "/home/vagrant/fsgi"
    config.vm.provision "file", source: "apache2", destination: "/home/vagrant/apache2"
    config.vm.provision "shell", path: "prepare_os.sh"
  end
end

