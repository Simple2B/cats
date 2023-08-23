from flask import Blueprint, render_template
from app.logger import log

bp = Blueprint("routes", __name__)


@bp.route("/")
def index():
    log(log.INFO, "index")
    return render_template("index.html")
