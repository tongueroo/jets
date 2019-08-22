# to run specs with what"s remembered from vcr
#   $ rake
#
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe Jets::CLI do
  before(:all) do
    @args = "--noop 2>&1"
  end

  describe "jets" do
    it "build" do
      out = execute("exe/bytala_jets_fork_1932 build #{@args}")
      # puts out
      expect(out).to include("Building project")
    end

    it "deploy" do
      out = execute("exe/bytala_jets_fork_1932 deploy #{@args}")
      # puts out
      expect(out).to include("Deploying")
    end

    it "delete" do
      out = execute("exe/bytala_jets_fork_1932 delete #{@args}")
      # puts out
      expect(out).to include("Deleting project")
  end

    it "routes" do
      out = execute("exe/bytala_jets_fork_1932 routes #{@args}")
      # puts out
      expect(out).to include("Verb")
      expect(out).to include("Path")
    end

    it "call" do
      out = execute("exe/bytala_jets_fork_1932 call posts-controller-index #{@args}")
      # puts out
      expect(out).to include("Calling lambda function")
    end
  end
end
