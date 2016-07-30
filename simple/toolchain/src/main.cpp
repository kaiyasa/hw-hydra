
#include <iostream>
#include <fstream>

#include <string>
#include <vector>

std::string textOf(std::istream& file);
std::vector<std::string> split(std::string text);

using namespace std;

string textOf(istream& file)
{
    string result;
    char c;

    while (file) {
        file.get(c);
         if (file)
            result += c;
    }
    return result;
}

vector<string> split(string text)
{
    vector<string> result;
    auto p = text.begin();
    bool skip = false;
    string line;

    while (p != text.end())
    {
        auto c = *p;

        if (c == '\r' || c == '\n')
        {
            if (c == '\r')
            {
                skip = true;
                result.push_back(line);
                line.clear();
            } else if (skip)
                skip = false;
            else
            {
                result.push_back(line);
                line.clear();
            }
        } else
            line += c;
        ++p;
    }

    if (line.size() > 0)
        result.push_back(line);
    return result;
}


int main(int argc, char *argv[])
{
    string text;

    if (argc < 2)
        text = textOf(cin);
    else {
        fstream input(argv[1]);
        text = textOf(input);
    }

    auto lines = split(text);

    cout << text << endl;
    cout << lines.size() << endl;
}
