function get_eng_prefix(x,lst_sel)
-- This function associates the correct prefix to use
-- for the engineering notation of numbers, in
-- conjunction with the LaTeX package 'siunitx'.
-- INPUT:
--  - x, number to be processed
--  - lst_sel, Long/Short/Tex prefix SELector
--
-- bg @2016/07/05


-- define backslash for TeX output
local backslash = '\\'

-- ensure the functions are defined
function log10(x)
    return math.log(x,10)
end
floor = math.floor

-- define prefixes
local prex = {'y','z','a','f','p',
              'n','u','m','','k',
              'M','G','T','P','E',
              'Z','Y'}
              
local prefix = {'yocto',
                'zepto',
                'atto',
                'femto',
                'pico',
                'nano',
                'micro',
                'milli',
                '',
                'kilo',
                'mega',
                'giga',
                'tera',
                'peta',
                'exa',
                'zetta',
                'yotta'}

-- get integer part of the exponent multiple of 3, s.t.
-- x >= 10^(3t)
local t = floor(1/3*log10(x))


-- set maximum prefix
if t > 8 then
    t = 8
end
-- set minimum prefix
if t < -8 then
    t = -8
end


-- compute new number, x = y . 10^(3t)
local y = x/10^(3*t)

-- associate t to correct position
local pos = t + 9

if lst_sel == 'short' then
    return y, prex[pos]
elseif lst_sel == 'tex' then
	if t == 0 then
    	return y,''
    else
		return y, backslash .. prefix[pos]
    end
else
    return y, prefix[pos]
end
    

end