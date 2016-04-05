import React from "react";
import { render } from 'react-dom';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import ReadPage from "./components/ReadPage.jsx";
import SearchPage from "./components/SearchPage.jsx";
import { missionaryGrammarsApp } from './reducers';
import { nextPage, prevPage, openSection, closeSection } from './actions';

let store = createStore(missionaryGrammarsApp);


if (window.location.href.indexOf('search') > 0) {
    console.log('searched');
    render(
        <SearchPage>Foo</SearchPage>,
        document.getElementById("search-holder")
    );
} else {
    let initial_data = document.getElementById('reader').getAttribute('data-react-props');
    render(
        <ReadPage text_id={initial_data}></ReadPage>,
        document.getElementById("reader")
    );
}