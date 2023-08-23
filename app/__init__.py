from flask import Flask


def create_app() -> Flask:
    app = Flask(__name__)

    from .views import routes

    app.register_blueprint(routes.bp)

    return app
