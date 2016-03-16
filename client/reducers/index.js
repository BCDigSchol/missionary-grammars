import { combineReducers } from 'redux';
import { pages } from './pages';
import { sections } from './sections';

export const missionaryGrammarsApp = combineReducers({
    pages,
    sections
});