control "aws_tests" do
  desc "check for a few AWS resources"

  describe aws_ec2_instance(name: 'Kitchen-terraform-test-vm') do
    it { should be_running }
  end

describe aws_security_group(group_name: 'default') do
  it { should_not allow_in(port: 22, ipv4_range: '0.0.0.0/0') }
end

end
