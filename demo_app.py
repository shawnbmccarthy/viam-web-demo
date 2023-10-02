import flask
from flask import Flask, render_template
app = Flask(
    __name__,
    static_url_path='',
    static_folder='web/static',
    template_folder='web/templates'
)


if __name__ == '__main__':
    app.run(debug=False, port=9090)
