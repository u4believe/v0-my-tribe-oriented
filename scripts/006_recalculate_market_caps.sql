-- Recalculate market cap for all existing tokens using the correct formula
-- Market Cap = Current Price × Circulating Supply (700M tokens)
-- This fixes tokens that were created with the old calculation

UPDATE meme_tokens
SET market_cap = current_price * 700000000
WHERE current_supply > 0;

-- For tokens with 0 supply, use initial price
UPDATE meme_tokens
SET market_cap = 0.0001533 * 700000000
WHERE current_supply = 0;
