'use strict'

angular.module('app', ['ngResource'])

    .controller('ToDoController2', ToDoController2)
    .controller('ToDoController', ToDoController)
    .factory('Todoses', Todoses);

function ToDoController(Todoses, RestService){
    var vm = this;
    vm.todos = RestService.resource.query();
    vm.remainig = Todoses.remainig;
    vm.remove = Todoses.remove;

    vm.addTodo = function(){
        Todoses.addTodo(vm.newTodo);
        vm.newTodo = '';
    }
    
}

function ToDoController2(Todoses){
    var vm = this;
    vm.todos = Todoses.todoses;
    vm.remainig = Todoses.remainig;
    vm.remove = Todoses.remove;
    vm.modTodo = function(index){
        Todoses.mod(index,vm.nextTodo)
        vm.nextTodo = '';
    }
    vm.addTodo = function(){
        Todoses.addTodo(vm.newTodo);
        vm.newTodo = '';
    }
   
}

function Todoses(){
    var factory = {};

    var todoses = [{text: "pierwsze todo", done: true, priority:false}, {text: "drugie todo", done: false,priority: false},{text: "trzecie todo", done: false,priority: true}];

    var addTodo = function(todoText){
        todoses.push({text: todoText, done: false});
    }
    var remove = function(index){
        todoses.splice(index, 1);
    }
    var mod = function(index, newText){
        todoses[index].text=newText;
        
       console.log(todoses);
    }
    function remainig(){
        var count = 0;
        angular.forEach(todoses, function(todo){
            count += todo.done ? 1 : 0;
        });
        return count;
    }

    factory.todoses = todoses;
    factory.addTodo = addTodo;
    factory.remainig = remainig;
    factory.remove = remove;
    factory.mod = mod;

    return factory;
}

