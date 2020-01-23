RSpec.describe "Bongloy::Charge" do
  it "creates a charge" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id
    )

    expect(charge.amount).to eq(10000)
    expect(charge.currency).to eq("USD")
    expect(charge.status).to eq("succeeded")
  end

  it "shows a charge" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id
    )

    result = Bongloy::Charge.retrieve(charge.id)

    expect(result.id).to eq(charge.id)
  end

  it "lists charges" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id
    )

    charges = Bongloy::Charge.list

    expect(charges.data.is_a?(Array)).to eq(true)
    expect(charges.first.id).to eq(charge.id)
  end

  it "captures a charge" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id,
      capture: false
    )

    charge_capture = Bongloy::Charge.capture(charge.id)

    expect(charge_capture.captured).to eq(true)
    expect(charge_capture.status).to eq("succeeded")
    expect(charge_capture.amount).to eq(10000)
  end

  it "partially captures a charge" do
    charge = Bongloy::Charge.create(
      amount: 10000,
      currency: "USD",
      source: token.id,
      capture: false
    )

    charge_capture = Bongloy::Charge.capture(charge.id, amount: 8000)

    expect(charge_capture.captured).to eq(true)
    expect(charge_capture.amount_refunded).to eq(2000)
  end

  def token
    Bongloy::Token.create({
      card: {
        number: '6200000000000005',
        exp_month: 1,
        exp_year: 2021,
        cvc: '314',
      },
    })
  end
end
