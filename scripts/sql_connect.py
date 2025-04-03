"""
sql_connect.py

Contains a wrapper to handle connections to the database
"""

# % IMPORT

import sqlite3


# % FUNCTION


def sqlconnector(db_path):
    def decorator(func):
        def wrapper(*args, **kwargs):
            # - check that database exists
            msg = f"Cannot find database '{db_path.resolve()}': file does not exist"
            if not db_path.exists():
                raise FileExistsError(msg)
            # - connect and execute
            with sqlite3.connect(db_path) as db_con:
                res = func(db_con, *args, **kwargs)
            # - return
            return res

        return wrapper

    return decorator
