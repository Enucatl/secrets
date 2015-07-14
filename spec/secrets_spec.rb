require 'secrets'

secrets_file = "config/secrets.yml"

describe Secrets::Secret do

  before :all do
    # setup a standard secrets file with an example server address
    unless Dir.exist? "config"
      Dir.mkdir "config"
    end
    secrets = {server: {address: "100.100.100.100"}}
    File.open(secrets_file, "w") {|f| f.write secrets.to_yaml}
  end 

  it "reads a secret" do
    secrets = Secrets::Secret.new secrets_file
    expect(secrets.server.address).to eql("100.100.100.100")
  end

  it "updates a secret" do
    secrets = Secrets::Secret.new secrets_file
    secrets.server.address = "100.100.200.200"
    expect(secrets.server.address).to eql("100.100.200.200")
  end

  after :all do
    File.delete "config/secrets.yml"
  end
end
