numDigits :: Integer -> Integer
numDigits n = toInteger (round (logBase 10 (fromIntegral n)) + 1)

karatsubaCalculation :: Integer -> Integer -> Integer
karatsubaCalculation x y = do
        let n = max(numDigits x, numDigits y)
        let nby2 = n/2
        let tenPower = 10**nby2

        let a = x / tenPower
        let b = mod x tenPower
        let c = y / tenPower
        let d = mod y tenPower
        let ac = karatsubaCalculation a c
        let bd = karatsubaCalculation b d
        let ad_plus_bc = karatsubaCalculation(a+b, c+d) - ac -bd
        let prod = ac * 10**(2*nby2) + (ad_plus_bc * tenPower) + bdo

        prod

karatsuba :: Integer -> Integer -> Integer
karatsuba x y = do
    if (x == 1) || (y == 1)
        then x * y
    else
        karatsubaCalculation x y


main :: IO ()
main = do
    putStrLn "Karatsuba for two numbers: X=47 Y=78"
    print(karatsuba 47 78)

