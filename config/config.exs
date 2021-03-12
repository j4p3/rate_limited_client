import Config

config :rate_limited_client, RateLimiter,
  rate_limiter: RateLimitedClient.RateLimiters.LeakyBucket,
  timeframe_max_requests: 10,
  timeframe_units: :seconds,
  timeframe: 1
