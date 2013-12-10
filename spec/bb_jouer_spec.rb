require "./lib/bb_jouer.rb"
describe BbJouer do
  before do
    @p = BbJouer.new
  end
  it "should return statistic table with 1000 entries" do
    @p.build_stat_table.should eq 1000
  end
  it "should confirm on base slugging percentage" do
    @p.confirm_ops.should eq @p.ops
  end
  it "should confirm slugging average" do
    @p.confirm_slg.should eq @p.slg
  end
  it "should return player plate appearances" do
    @p.pa.should eq 681
  end
  it "should return player batting average" do
    @p.ba.should eq 314
  end
  it "should return player on base percentage" do
    @p.obp.should eq 383
  end
  it "should return player slugging average" do
    @p.slg.should eq 516
  end
  it "should return player on base slugging percentage" do
    @p.ops.should eq 899
  end
end
