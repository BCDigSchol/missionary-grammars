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
            open_langs: [],
            results: {
                language: [],
                alternate_designations: [],
                author: [],
                publisher: [],
                title: [],
                date: [],
                category: [],
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

    addFilter(filter) {
        let my_filters = me.state.filters;
        my_filters.push(filter);
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

        let facets = [
            {
                field: 'language',
                values: this.state.results.language,
                display: 'Language'
            },
            {
                field: 'alternate_designations',
                values: this.state.results.alternate_designations,
                display: 'Alternate designations'
            },
            {
                field: 'author',
                values: this.state.results.author,
                display: 'Author'
            },
            {
                field: 'date',
                values: this.state.results.date,
                display: 'Date'
            },
            {
                field: 'publisher',
                values: this.state.results.publisher,
                display: 'Publisher'
            },
            {
                field: 'category',
                values: this.state.results.category,
                display: 'Categories'
            }
        ];


        console.log(this.state.results);

        return (
            <div className="read-page">
                <div className="structure-pane">
                    <h2>Search</h2>

                    <div className={this.state.tab === 'search-browse' ? 'show' :'hidden' } id="text-structure">
                        {facets.map((facet) =>(
                                <Facet
                                    field={facet.field}
                                    values={facet.values}
                                    addFilter={this.addFilter}
                                    removeFilter={this.removeFilter}
                                    filters={this.state.filters}
                                    toggleField={this.toggleField}
                                    open_fields={this.state.open_fields}
                                    displayName={facet.display}/>
                            )
                        )}
                    </div>
                    <div className={this.state.tab === 'search-fulltext' ? 'show' :'hidden' } id="text-metadata">
                    </div>
                </div>

                <div className="read-pane search-page">
                    <SearchResults
                        hits={this.state.results.hits.items}
                        total={this.state.results.hits.hits}
                        filters={this.state.filters}
                        removeFilter={this.removeFilter}
                    />
                </div>
            </div>
        );
    }
}