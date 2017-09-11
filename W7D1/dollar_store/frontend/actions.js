const selectCurrency = (baseCurrency, rates) => ({
  type: "SWITCH_CURRENCY",
  baseCurrency: baseCurrency,
  rate: rates
});

export default selectCurrency;
