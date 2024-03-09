# This is the file that implements a flask server to do inferences. It's the file that you will modify to
# implement your own algorithm.

from __future__ import print_function

import io
import os

import flask

prefix = "/opt/ml/"
model_path = os.path.join(prefix, "model")

# The flask app for serving predictions
app = flask.Flask(__name__)


@app.route("/ping", methods=["GET"])
def ping():
    """Determine if the container is working and healthy. In this sample container, we declare
    it healthy if we can load the model successfully."""
    return flask.Response(response="\n", status=200, mimetype="application/json")


@app.route("/invocations", methods=["POST"])
def transformation():
    """ Do an inference on a single batch of data. """
    return flask.Response(response="The result of the invocation", status=200, mimetype="application/json")
