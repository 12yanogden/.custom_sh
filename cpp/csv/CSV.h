#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <vector>
using namespace std;

class CSV {
private:
    string path;
    vector<string> fields;
    map< string, map<string, string> > records;

    void build_fields(const string *csvData);
    void build_records(const string *csvData);
    int get_field_index(const string field);
    string get_file_data(const string path);
public:
    CSV(const string path);
    
    // Getters
    map< string, map<string, string> > *get_records();
    map<string, string> *get_record_by_name(const string recordName);
    map<string, map<string, string> *> get_records_by_field_and_value(const string field, const string value);
    map<string, map<string, string> *> get_records_by_fields_and_values(const int pairCount, ...);
    
    // Record Management
    void add_record(const string record);
    void set_record_value(const string recordName, const string field, const string value);
    void remove_record(const string recordName);
    
    // Field Management
    void add_field(const string field);
    void set_field_name(const string field, const string newFieldName);
    void remove_field(const string field);
};

string CSV::get_file_data(const string path) {
    fstream csv;
    string data = "";

    csv.open(path, ios::in);

    if (csv.is_open()) {
        string line;
        
        while(getline(csv, line)) {
            data.append(line);
            data.append("\n");
        }
        
        csv.close();
    
    } else {
        fprintf(stderr, "CSV: could not read file %s\n", path);
        fflush(stderr);
    }

    return data;
}

CSV::CSV(const string path) {    
    string csvData = get_file_data(path);
    
    this->path = path;

    build_fields(&csvData);
    build_records(&csvData);
}

void CSV::build_fields(const string *csvData) {
    vector<string> fields = vector<string>();
    const string firstLine = csvData->substr(0, csvData->find_first_of('\n'));
    
}

void CSV::build_records(const string *csvData) {

}