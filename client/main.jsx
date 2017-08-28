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
    render(
        <SearchPage>Foo</SearchPage>,
        document.getElementById("search-holder")
    );
} else {
    let text_id = document.getElementById('reader').getAttribute('data-react-props');
    let search_string = document.getElementById('reader').getAttribute('data-search-string');
    render(
        <ReadPage text_id={text_id} search_string={search_string}></ReadPage>,
        document.getElementById("reader")
    );
}