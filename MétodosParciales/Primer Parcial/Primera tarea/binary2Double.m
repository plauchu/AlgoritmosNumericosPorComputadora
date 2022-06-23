function x = binary2Double(b)

% Extract the sign, exponent, and mantissa bits from the string.
s=b(1);
expo=b(2:12);
f=b(13:64);

% Convert the bits to decimal values.
format long;
s=bin2dec(s);
expo=bin2dec(expo);
f=bin2dec(f);
f=(1+f/2^52);
% Convert to a real number using the IEEE Standard 754.
x = ((-1)^s)*(2^(expo-1023))*(f);

end