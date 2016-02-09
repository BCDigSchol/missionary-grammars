var SearchPage = React.createClass({
    fetch: function (url) {
        $.get(url, {}, function (response) {
            if (this.isMounted()) {
                this.setState({
                    results: response.results,
                    fields: response.fields
                });
            }
        }.bind(this), 'json');
    },
    getInitialState: function () {
        return {
            fields: [],
            results: []
        };
    },
    componentDidMount: function () {
        this.fetch(this.props.source);
    },
    handleUpdate: function (parameter, value) {
        this.fetch('/texts/search?' + parameter + '=' + value);
    },
    render: function () {
        return (
            <div className="search-page">
                <h2>Search</h2>
                <SearchPane fields={this.state.fields} handleUpdate={this.handleUpdate}/>
                <SearchResults results={this.state.results}/>
            </div>
        );
    }
});


var SearchPane = React.createClass({
    render: function () {
        var this_pane = this;
        var fields = this.props.fields.map(function (field) {
            return <SelectList key={field.name} handleUpdate={this_pane.props.handleUpdate} field={field}/>;
        });
        return (
            <div className="search-pane">
                {fields}
            </div>
        );
    }
});

var SelectList = React.createClass({
    handleChange: function (event) {
        console.log(event.target.value);
        console.log(this.props.field.name);
        this.props.handleUpdate(this.props.field.name,event.target.value);
    },
    render: function () {
        var name = this.props.field.name;
        var options = this.props.field.options.map(function (option) {
            var key = name + '-' + option.value;
            return (<option key={key} label={option.label} value={option.value}/>);
        });
        return (
            <div className="search-selector">
                <label htmlFor={this.props.field.name}>{this.props.field.display}</label>
                <select name={this.props.field.name} onChange={this.handleChange}>
                    <option value="">Any</option>
                    {options}
                </select>
            </div>
        );
    }
});

var SearchResults = React.createClass({
    render: function () {
        var results = this.props.results.map(function (result) {
            return (<SearchResult key={result.id} result={result}/>);
        });
        return (
            <div className="search-results">
                <ul>
                    {results}
                </ul>
            </div>
        );
    }
});

SearchResult = React.createClass({
    render: function () {
        return (
            <li><cite><a href={this.props.result.id}>{this.props.result.title}</a></cite></li>
        );
    }
});

if (window.location.href.indexOf("search") > -1) {
    ReactDOM.render(
        <SearchPage source="/texts/search"/>,
        document.getElementById('container')
    );
}