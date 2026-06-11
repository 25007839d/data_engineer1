def febonacci(n):
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    elif n == 2:
        return [0, 1]
    
    sequence = [0, 1]
    for i in range(2, n):
        next_value = sequence[i-1] + sequence[i-2]
        sequence.append(next_value)
    
    return sequence


def febonacci_recursive(n):
    if n <= 0:
        return []
    elif n == 1:
        return [0]
    elif n == 2:
        return [0, 1]
    
    sequence = febonacci_recursive(n - 1)
    next_value = sequence[-1] + sequence[-2]
    sequence.append(next_value)
    
    return sequence

def factorial(n):
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    elif n == 0 or n == 1:
        return 1
    else:
        result = 1
        for i in range(2, n + 1):
            result *= i
        return result
    
def factorial_recursive(n):
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    elif n == 0 or n == 1:
        return 1
    else:
        return n * factorial_recursive(n - 1)


def armstrong_number(n):
    num_str = str(n)
    num_digits = len(num_str)
    
    armstrong_sum = sum(int(digit) ** num_digits for digit in num_str)
    
    return armstrong_sum == n

def armstrong_number_recursive(n):
    num_str = str(n)
    num_digits = len(num_str)
    
    def armstrong_sum(index):
        if index == len(num_str):
            return 0
        else:
            digit = int(num_str[index])
            return digit ** num_digits + armstrong_sum(index + 1)
    
    return armstrong_sum(0) == n

if __name__ == "__main__":
    print(febonacci(10))
    print(febonacci_recursive(10))
    print(factorial(5))
    print(factorial_recursive(5))
    print(armstrong_number(153))
    print(armstrong_number_recursive(153))