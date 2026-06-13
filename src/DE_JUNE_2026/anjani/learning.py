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

def sum_of_array(arr):
    total = 0
    for num in arr:
        total += num
    return total

def sum_of_array_recursive(arr):
    if not arr:
        return 0
    else:
        return arr[0] + sum_of_array_recursive(arr[1:])

def array_largest_element(arr):
    if not arr:
        raise ValueError("Array cannot be empty.")
    
    largest = arr[0]
    for num in arr:
        if num > largest:
            largest = num
    return largest

def array_largest_element_recursive(arr):
    if not arr:
        raise ValueError("Array cannot be empty.")
    
    if len(arr) == 1:
        return arr[0]
    
    largest_in_rest = array_largest_element_recursive(arr[1:])
    return arr[0] if arr[0] > largest_in_rest else largest_in_rest

def array_rotate_left(arr, d):
    n = len(arr)
    d = d % n  # Handle cases where d >= n
    return arr[d:] + arr[:d]

def array_rotate_right(arr, d):
    n = len(arr)
    d = d % n  # Handle cases where d >= n
    return arr[-d:] + arr[:-d]

def array_reverse(arr):
    return arr[::-1]


if __name__ == "__main__":
    print(febonacci(10))
    print(febonacci_recursive(10))
    print(factorial(5))
    print(factorial_recursive(5))
    print(armstrong_number(153))
    print(armstrong_number_recursive(153))
    print(sum_of_array([1, 2, 3, 4, 5]))
    print(sum_of_array_recursive([1, 2, 3, 4, 5]))
    print(array_largest_element([1, 2, 3, 4, 5]))
    print(array_largest_element_recursive([1, 2, 3, 4, 5]))
    print(array_rotate_left([1, 2, 3, 4, 5], 2))
    print(array_rotate_right([1, 2, 3, 4, 5], 2))
    print(array_reverse([1, 2, 3, 4, 5]))