/*
|--------------------------------------------------------------------------
| Routes
|--------------------------------------------------------------------------
|
| Http routes are entry points to your web application. You can create
| routes for different URL's and bind Controller actions to them.
|
| A complete guide on routing is available here.
| http://adonisjs.com/docs/4.1/routing
|
*/

/** @type {typeof import('@adonisjs/framework/src/Route/Manager')} */
const Route = use('Route')

Route.on('/').render('index')

Route.get('/index', function({view}){
     return view.render('index');
 })

Route.get('/post', function({view}){
     return view.render('post');
 })
Route.get('/post', function({view}){
     return view.render('post');
 })
Route.post('/', function({view}){
     return view.render('login');
 })
Route.post('/', function({view}){
     return view.render('login');
 })
Route.get('/signup', function({view}){
     return view.render('signup');
 })

