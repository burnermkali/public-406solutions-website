#i need a flask website I already have the html and css files
#I need a python file that will run the website
from flask import Flask, render_template

app = Flask(__name__)

# Define a route for the "home" page
@app.route('/')
def home():
  return render_template('index.html')

# Define a route for the "about" page
@app.route('/about')
def about():
  return render_template('aboutus.html')
  
 # Define a route for the "contact" page
@app.route('/contact')
def contact():
    return render_template('contact.html')

#Define  a route for the "whyus" page 
@app.route('/contact')
def contact():
    return render_template('contact.html')
    
# Include the CSS styles in the Flask app
@app.context_processor
def override_url_for():
    return dict(url_for=dated_url_for)

def dated_url_for(endpoint, **values):
    if endpoint == 'static':
        filename = values.get('filename', None)
        if filename:
            file_path = os.path.join(app.root_path,
                                     endpoint, filename)
            values['q'] = int(os.stat(file_path).st_mtime)
    return url_for(endpoint, **values)

if __name__ == '__main__':
  app.run()
