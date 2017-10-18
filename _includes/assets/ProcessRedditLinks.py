import re

def ProcessLine(pattern, line):
    match = re.search(pattern, line)
    if match is None:
        return line + "*" * 79 + "\n"
    else:
        words = match.group(1).replace("-", " ")
        # This one simply puts a line between text and link so pastebin can use it
        return f'{words}\n\t\t{line}\n'

# www.udemy.com/applewatchcourse/?couponCode=EnrollFREE
if __name__ == '__main__':
    # Extract the text after '.com/' and the next slash
    pattern = re.compile(r'^www[.]udemy[.]com[/]([^/]+)[/]')
    with open('links.txt', 'r') as read:
        with open('fixedlinks.txt', 'w' ) as write:
            for line in read:
                write.write(f'{ProcessLine(pattern, line)}')
