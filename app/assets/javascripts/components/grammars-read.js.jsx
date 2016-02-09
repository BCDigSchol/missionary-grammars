function getTextNumber() {
    var text_number = window.location.pathname.split('/')[2];
    return text_number;
}

var ReadPage = React.createClass({
    fetch: function (url) {
        url = '/texts/' + getTextNumber() + '/structure';
        $.get(url, {}, function (response) {
            console.log('here');
            if (this.isMounted()) {
                this.setState({
                    structure: response.sections
                });
            }
        }.bind(this), 'json');
    },
    componentDidMount: function () {
        this.fetch(this.props.source);
    },
    handleUpdate: function (page) {
        console.log(page);
        this.setState(
            {
                page: page
            }
        );
    },
    getInitialState: function () {
        return {
            structure: [],
            page: 1
        };
    },
    incrementPage: function () {
        this.handleUpdate(this.state.page + 1);
    },
    decrementPage: function () {
        this.handleUpdate(this.state.page - 1);
    },
    render: function () {
        var prevlink = <div className="prev-page">&nbsp;</div>;
        if (this.state.page > 0) {
            prevlink = <div onClick={this.decrementPage} className="prev-page">&lt;</div>;
        }


        return (
            <div className="read-page">
                <div className="structure-pane">
                    <TextStructure structure={this.state.structure} handleUpdate={this.handleUpdate}/>
                </div>
                <div className="read-pane">
                    {prevlink}
                    <ReadBox page={this.state.page}/>
                    <div onClick={this.incrementPage} className="next-page">&gt;</div>
                </div>
            </div>
        );
    }
});

var TextStructure = React.createClass({
    render: function () {
        var this_pane = this;
        var sections = this.props.structure.map(function (field) {
            var key = field.title + "p" + field.page;
            var subsections = '';
            if (field.sections) {
                subsections =
                    <TextStructure structure={field.sections} handleUpdate={this_pane.props.handleUpdate}/>;
            }

            return <li key={key}>
                <TextSectionTitle handleClick={this_pane.props.handleUpdate} page={field.page} title={field.title}/>
                {subsections}
            </li>
        });
        return (
            <ul className="sections">
                {sections}
            </ul>
        );
    }
});

var TextSectionTitle = React.createClass({
    handleClick: function () {
        this.props.handleClick(this.props.page);
    },
    render: function () {
        return <a onClick={this.handleClick} page={this.props.page}>{this.props.title}</a>
    }
});

var ReadBox = React.createClass({
    componentDidMount: function () {
        document.documentElement.addEventListener('scroll', this.handleScroll);
    },
    handleScroll: function (event) {
        //this.refs.nav.getDOMNode().style.top = document.documentElement.scrollTop + 'px';
    },
    render: function () {
        function pad(num, size) {
            var s = num + "";
            while (s.length < size) s = "0" + s;
            return s;
        }

        var img_src = "/img/texts/" + getTextNumber() + "/" + pad(this.props.page, 4) + ".jpg";
        var imgdiv = <div id="img-holder" onScroll={this.handleScroll} ref="imgholder"><img src={img_src}/></div>;
        return imgdiv;
    }
});

if (window.location.href.indexOf("read") > -1) {
    ReactDOM.render(
        <ReadPage></ReadPage>,
        document.getElementById('reader')
    );
}