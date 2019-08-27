Haofan Wang
hwang108
Lab3: Ripple Adder With Memory
Due date 2/7/2018
01E TA: Carlos Espinosa
Magic number: 0x6010 
              0234
              0b0111

I learn the Mux output is depends on the S. For 2:1 mux example, when S is 0, the output is the input 0. When S is 1, the output is the input 1. I also learned Flip-Flop can stores bit. Everything works well as I expected.

The issue I had is during subtracting, It subtracts 1 extra bits. So I changed my adder to when adding the carry out is 0, when subtracting the carry out is 1.

I built a stored number with 7-segments led, so I know what number is stored everytime. 

My I subtracts a larger number from a smaller number, the output becomes 64 minus the difference of two numbers. For exmaple, when I subtract 1 from 0, my output becomes 3F(63). The result make sense.
When I add two numbers that won't fit in 6 bits, the results becomes the sum minus 64. For example, when I add 3C(60) and 04, the result is 0.
