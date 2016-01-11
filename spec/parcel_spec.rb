require('rspec')
require('parcel')

describe(Parcel) do
  describe('#volume') do
    it('return 1 for a 12 inch cube') do
      test_parcel = Parcel.new(12, 12, 12, 16)
      expect(test_parcel.volume()).to(eq(1))
    end

    it('return 8 for a 24 inch cube') do
      test_parcel = Parcel.new(24, 24, 24, 16)
      expect(test_parcel.volume()).to(eq(8))
    end
  end

  describe('#cost_to_ship') do
    it('returns 18 for a 12 inch 1 lb cube shipped 1000 mi in 1 day') do
      test_parcel = Parcel.new(12, 12, 12, 16)
      expect(test_parcel.cost_to_ship(1, 1000)).to(eq(18))
    end

    it('returns 52 for a 27CF 50 lb parcel shipped 300 mi in 1 week') do
      test_parcel = Parcel.new(36, 36, 36, 800)
      expect(test_parcel.cost_to_ship(7, 300)).to(eq(56.5))
    end
  end
end
