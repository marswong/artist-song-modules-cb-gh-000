require_relative 'spec_helper.rb'

describe Song do
  before(:each) do
    Song.reset_all
  end

  let!(:song) { Song.new }

  it "can initialize a song" do
    expect(song).to be_a(Song)
  end

  it "can have a name" do
    song.name = "Begin Again"
    expect(song.name).to eq("Begin Again")
  end

  it 'converts its name to a url friendly parameter' do
    song.name = "Wildest Dreams"
    expect(song.to_param).to eq("wildest-dreams")
  end

  it "has an artist" do
    song.artist = Artist.new.tap {|a| a.name = "taylor"}
    expect(song.artist).to be_a(Artist)
    expect(song.artist.name).to eq("taylor")
  end

  describe "Class methods" do
    it "keeps track of the songs that have been created" do
      expect(Song.all).to include(song)
    end

    it "can count how many songs have been created" do
      expect(Song.count).to eq(1)
    end

    it "can find a song by name" do
      song.name = "Wildest Dreams"
      expect(Song.find_by_name("Wildest Dreams")).to eq(song)
    end

    it "can reset the songs that have been created" do
      Song.reset_all
      expect(Song.count).to eq(0)
    end
  end

end
