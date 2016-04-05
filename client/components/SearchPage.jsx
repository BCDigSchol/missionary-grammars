import { Facet } from "./Facet.jsx";
import { SearchResults } from "./SearchResults.jsx";

import React from "react";

// Horrible kludge until I understand why ES6 objects sometimes kill 'this'.
var me;

export default class SearchPage extends React.Component {

    constructor() {
        super();
        this.state = {
            filters: [],
            tab: 'search-browse',
            open_fields: [],
            results: {
                language: [],
                publisher: [],
                title: [],
                hits: {
                    total: 0,
                    items: []
                }
            }

        };
        this.fetched = false;
        me = this;
    }

    fetch() {
        this.fetched = true;
        var url = '/texts/search?' + this.state.filters.join('&');
        $.get(url, {}, function (response) {
            this.setState({
                results: response
            });
        }.bind(this), 'json');
    }

    narrowSearch(field, term) {
        let my_filters = me.state.filters;
        my_filters.push(field + "=" + term);
        me.setState({
            filters: my_filters
        });
        me.fetch();
    }

    removeFilter(filter) {
        let my_filters = me.state.filters;

        let index = my_filters.indexOf(filter);
        my_filters.splice(index);

        me.setState({
            filters: my_filters
        });
        me.fetch();
    }

    toggleField(field) {
        let open_fields = me.state.open_fields;
        let index = open_fields.indexOf(field);

        if (index === -1) {
            open_fields.push(field);
        } else {
            open_fields.splice(index);
        }
        me.setState(
            {
                open_fields: open_fields
            }
        );
    }

    render() {
        if (!this.fetched) {
            this.fetch();
        }

        return (
            <div className="read-page">
                <div className="structure-pane">
                    <h2>Search</h2>
                    <ul className="tabs">
                        <li onClick={() => {this.setState({ tab: 'search-browse'});}}
                            className={this.state.tab === 'search-browse' ? 'selected' :'not-selected' }>
                            Browse
                        </li>
                        <li onClick={() => {this.setState({ tab: 'search-fulltext'});}}
                            className={this.state.tab === 'search-fulltext' ? 'selected' :'not-selected' }>
                            Fulltext search
                        </li>
                    </ul>
                    <div className={this.state.tab === 'search-browse' ? 'show' :'hidden' } id="text-structure">
                        <h3>Browse</h3>
                        <Facet
                            field="language"
                            values={this.state.results.language}
                            addFilter={this.narrowSearch}
                            toggleField={this.toggleField}
                            open_fields={this.state.open_fields}
                            displayName="Language"/>
                        <Facet
                            field="publisher"
                            values={this.state.results.publisher}
                            addFilter={this.narrowSearch}
                            toggleField={this.toggleField}
                            open_fields={this.state.open_fields}
                            displayName="Publisher"/>
                    </div>
                    <div className={this.state.tab === 'search-fulltext' ? 'show' :'hidden' } id="text-metadata">
                        <h3>Fulltext</h3>
                    </div>
                </div>

                <div className="read-pane">
                    <SearchResults
                        hits={this.state.results.hits.items}
                        total={this.state.results.hits.total}
                        filters={this.state.filters}
                        removeFilter={this.removeFilter}
                    />
                </div>
            </div>
        );
    }
}