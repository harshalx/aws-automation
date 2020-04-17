control "service_checks" do
  desc "A demonstration services can be checked"

  describe service('auditd') do
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  end

end
