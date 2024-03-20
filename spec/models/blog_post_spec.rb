require "rails_helper"

RSpec.describe BlogPost, type: :model do
  let!(:draft) { FactoryBot.create(:blog_post, :draft) }
  let!(:scheduled) { FactoryBot.create(:blog_post, :scheduled) }
  let!(:published) { FactoryBot.create(:blog_post) }
  describe "when testing scopes" do
    context "published_at is nil" do
      it "draft? should return true for draft blog posts" do
        expect(draft.draft?).to eq(true)
      end

      it "draft? should return false for scheduled blog posts" do
        expect(scheduled.draft?).to eq(false)
      end

      it "draft? should return false for published blog posts" do
        expect(published.draft?).to eq(false)
      end
    end

    context "published_at is in the past" do
      it "published? should return true for published blog posts" do
        expect(published.published?).to eq(true)
      end

      it "published? should return false for draft blog posts" do
        expect(draft.published?).to eq(false)
      end

      it "published? should return false for scheduled blog posts" do
        expect(scheduled.published?).to eq(false)
      end
    end

    context "published_at is future" do
      it "scheduled? should return true for scheduled blog posts" do
        expect(scheduled.scheduled?).to eq(true)
      end

      it "scheduled? should return false for draft blog posts" do
        expect(draft.scheduled?).to eq(false)
      end

      it "scheduled? should return false for published blog posts" do
        expect(published.scheduled?).to eq(false)
      end
    end
  end
end
