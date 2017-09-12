import { createStore, applyMiddleware } from 'redux';
import RootReducer from '../reducers/root_reducer';

const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState, applyMiddleware(addLoggingToDispatch, bonusMiddleware));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

const addLoggingToDispatch = store => next => action => {
    console.log('Old State', store.getState());
    console.log('Action', action);
    next(action);
    console.log('New State', store.getState());
};

const bonusMiddleware = store => next => action => {
  console.log('Next', next);
  next(action);
};

export default configureStore;
