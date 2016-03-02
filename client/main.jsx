/**
 * Launch application
 */
import React from "react";
import ReactDOM from "react-dom";

const runApp = () => {
    ReactDOM.render(
        <div />,
        document.getElementById("app")
    );
};

if (window.addEventListener) {
    window.addEventListener('DOMContentLoaded', runApp);
} else {
    window.attachEvent('onload', runApp);
}