from flask import Flask
app = Flask(
    __name__,
    static_url_path='',
    static_folder='web/static',
    template_folder='web/templates'
)


@app.route('/version')
def version():
    return "v0.0.1"


if __name__ == '__main__':
    app.run(debug=False, port=9090)
