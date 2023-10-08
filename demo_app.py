from app_cfg import VERSION
from datetime import datetime as dt
from flask import Flask, jsonify

app = Flask(
    __name__,
    static_url_path='',
    static_folder='web/static',
    template_folder='web/templates'
)


@app.route('/version')
def version():
    return jsonify(
        version=VERSION,
        deployed_at=dt.now()
    )


if __name__ == '__main__':
    app.run(debug=False, port=9090)
