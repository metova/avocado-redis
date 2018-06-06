describe Avocado::Redis::Strategy do
  let(:redis) { ::Redis.new }

  describe '#read' do
    it 'fetches all keys with avocado- in them' do
      redis['avocado-1'] = Hash[test: 1].to_json
      redis['avocado-2'] = Hash[test: 2].to_json
      redis['notme'] = Hash[test: 3].to_json
      expect(subject.read.map { |h| h['test'] }).to match_array [1, 2]
    end

    it 'doesnt crash when the keys are empty' do
      expect(subject.read).to be_empty
    end
  end

  describe '#write' do
    it 'writes to the data given to a redis key defined by the upload ID/timestamp' do
      subject.write Hash[test: 123], 'uploadid123'
      expect(subject.read[0]).to eq 'test' => 123
    end
  end

  describe '#purge_old' do
    it "deletes keys that don't have the given upload ID" do
      subject.write Hash[test: 1], 'uploadid-1'
      subject.write Hash[test: 2], 'uploadid-2'

      expect {
        subject.purge_old '2'
      }.to change {
        subject.read.map { |h| h['test'] }
      }.from([1, 2]).to [2]
    end
  end
end
