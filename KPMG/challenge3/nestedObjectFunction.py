def get_value(obj, key):
    key_list = key.split("/")
    value = ""
    try:
        for key_element in key_list:
            value = obj[key_element]
            if isinstance(value, dict):
                obj = value
        return value
    except KeyError:
        error = "Please input correct object and key. " + str(KeyError.__doc__)
        return error


#print(get_value({"a": {"b": {"c": "d"}}}, "a/b/c")) # Returns correct value
#print(get_value({"a": "d"}, "a/b/c")) # Returns error message