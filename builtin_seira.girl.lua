function ondraw()
  if who ~= self or rinshan then
    return
  end

  local ctx = game:getformctx(self)
  if ctx.ippatsu then
    return
  end

  local hand = game:gethand(self)
  local rule = game:getrule()
  local drids = mount:getdrids()
  if hand:ready() then
    for _, t in ipairs(hand:effa()) do
      local form = Form.new(hand, T37.new(t:id34()), ctx, rule, drids)
      local ron_han = form:han()
      local tsumo_han = ron_han + (hand:ismenzen() and 1 or 0)
      local pinfu = form:yakus()["pnf"] and 1 or 0
      local ok = tsumo_han >= (4 + pinfu)
      local modest = tsumo_han <= 7
      mount:lighta(t, ok and (modest and 400 or 100) or -200);
    end
  else
    for _, t in ipairs(hand:effa()) do
      mount:lighta(t, 30)
    end

    if hand:ctaka5() + drids % hand < 2 then
      for _, t in ipairs(drids) do
        mount:lighta(t:dora(), 80)
      end

      mount:lighta(T37.new("0m"), 30);
      mount:lighta(T37.new("0p"), 30);
      mount:lighta(T37.new("0s"), 30);
    end
  end
end
