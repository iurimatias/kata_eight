require 'spec_helper'

describe KataEight do

  let(:kata_eight) { KataEight.new }

  describe "#parse_file" do
    before { kata_eight.parse_file("./spec/fixtures/word_list.txt"); }

    subject {  kata_eight }

    its(:words)            { should == ["belong", "albums", "barely", "befoul", "convex", "hereby", "jigsaw", "tailor", "weaver"] }
    its(:possible_matches) { should == Set.new(["we", "your", "saw", "to", "here", "con", "bums", "all", "by", "be", "ely", "jig", "base", "tail", "vex", "foul", "bar", "us", "aver", "al", "or"]) }
    
  end

  describe "#find_words" do

    before {
      kata_eight.words = ["belong", "albums", "barely", "befoul", "convex", "hereby", "jigsaw", "tailor", "weaver"]
      kata_eight.possible_matches = Set.new(["we", "your", "saw", "to", "here", "con", "bums", "all", "by", "be", "ely", "jig", "base", "tail", "vex", "foul", "bar", "us", "aver", "al", "or"])
    }

    subject { kata_eight }

    its(:find_words) { should == [["al", "bums", "albums"],
                                  ["bar", "ely", "barely"],
                                  ["be", "foul", "befoul"],
                                  ["con", "vex", "convex"],
                                  ["here", "by", "hereby"],
                                  ["jig", "saw", "jigsaw"],
                                  ["tail", "or", "tailor"],
                                  ["we", "aver", "weaver"]] }

  end

end

