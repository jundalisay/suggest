import sqlite3

# Connect to a SQLite database
conn = sqlite3.connect('recommendation_engine.db')
c = conn.cursor()

# Create the vegetable table
c.execute('''CREATE TABLE IF NOT EXISTS vegetables
             (id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              type TEXT,
              disease TEXT)''')

# Insert some sample data into the vegetable table
c.execute("INSERT INTO vegetables (name, type, disease) VALUES ('spinach', 'leafy green', 'diabetes')")
c.execute("INSERT INTO vegetables (name, type, disease) VALUES ('kale', 'leafy green', 'hypertension')")
c.execute("INSERT INTO vegetables (name, type, disease) VALUES ('broccoli', 'cruciferous', 'heart disease')")
c.execute("INSERT INTO vegetables (name, type, disease) VALUES ('cauliflower', 'cruciferous', 'celiac disease')")
c.execute("INSERT INTO vegetables (name, type, disease) VALUES ('asparagus', 'non-cruciferous', 'diabetes')")
c.execute("INSERT INTO vegetables (name, type, disease) VALUES ('sweet potato', 'starchy', 'hypertension')")
c.execute("INSERT INTO vegetables (name, type, disease) VALUES ('carrots', 'non-cruciferous', 'heart disease')")
c.execute("INSERT INTO vegetables (name, type, disease) VALUES ('butternut squash', 'starchy', 'celiac disease')")

# Commit the changes to the database
conn.commit()

# Create the disease table
c.execute('''CREATE TABLE IF NOT EXISTS diseases
             (id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT,
              vegetable TEXT)''')

# Insert some sample data into the disease table
c.execute("INSERT INTO diseases (name, vegetable) VALUES ('diabetes', 'spinach')")
c.execute("INSERT INTO diseases (name, vegetable) VALUES ('hypertension', 'kale')")
c.execute("INSERT INTO diseases (name, vegetable) VALUES ('heart disease', 'broccoli')")
c.execute("INSERT INTO diseases (name, vegetable) VALUES ('celiac disease', 'cauliflower')")

# Commit the changes to the database
conn.commit()

import random

def recommend_vegetables(disease):
    recommended_vegetables = []
    
    # Query the vegetable table to get all vegetables that cure the given disease
    c.execute("SELECT name, type FROM vegetables WHERE disease=?", (disease,))
    vegetables = c.fetchall()
    
    # For each vegetable that cures the given disease, query the vegetable table to get two additional vegetables
    # of the same type
    for vegetable in vegetables:
        vegetable_name = vegetable[0]
        vegetable_type = vegetable[1]
        c.execute("SELECT name FROM vegetables WHERE type=? AND name!=?", (vegetable_type, vegetable_name))
        additional_vegetables = c.fetchmany(2)
        recommended_vegetables.extend([v[0] for v in additional_vegetables])
    
    # Randomly shuffle the recommended vegetables and return the first two
    random.shuffle(recommended_vegetables)
    return recommended_vegetables[:2]

recommend_vegetables("diabetes") 
