/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

"use strict";


var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Box = function () {
  function Box(ctx) {
    _classCallCheck(this, Box);

    this.ctx = ctx;
    this.topLimit = 10;
    this.bottomLimit = 400;
    this.leftLimit = 10;
    this.rightLimit = 400;
  }

  _createClass(Box, [{
    key: "render",
    value: function render() {
      this.ctx.rect(this.leftLimit, this.topLimit, this.rightLimit, this.bottomLimit);
      this.ctx.stroke();
    }

    // object's origin is not the same as the box origin

  }, {
    key: "nearToVerticalWall",
    value: function nearToVerticalWall(object) {
      return this.bottomLimit <= object.y || this.topLimit >= object.y - this.topLimit;
    }

    // object's origin is not the same as the box origin

  }, {
    key: "nearToHorizontalWall",
    value: function nearToHorizontalWall(object) {
      return this.rightLimit <= object.x || this.leftLimit >= object.x - this.leftLimit;
    }
  }, {
    key: "clear",
    value: function clear() {
      this.ctx.clearRect(this.leftLimit, this.topLimit, this.rightLimit, this.bottomLimit);
    }
  }]);

  return Box;
}();

var Ball = function () {
  function Ball(ctx, _ref) {
    var x = _ref.x,
        y = _ref.y,
        xDirection = _ref.xDirection,
        yDirection = _ref.yDirection,
        box = _ref.box;

    _classCallCheck(this, Ball);

    this.ctx = ctx;
    this.x = x;
    this.y = y;
    this.r = 10;
    this.increment = 5;
    this.xDirectionIncrement = this.increment * xDirection;
    this.yDirectionIncrement = this.increment * yDirection;
    this.box = box;
  }

  _createClass(Ball, [{
    key: "render",
    value: function render() {
      if (box.nearToVerticalWall(this)) {
        this.yDirectionIncrement *= -1;
      }

      if (box.nearToHorizontalWall(this)) {
        this.xDirectionIncrement *= -1;
      }

      this.x += this.xDirectionIncrement;
      this.y += this.yDirectionIncrement;

      this.ctx.strokeStyle = 'black';
      this.ctx.beginPath();
      this.ctx.arc(this.x, this.y, this.r, 0, 2 * Math.PI);
      this.ctx.stroke();
      this.ctx.fill();
      this.ctx.closePath();
    }
  }]);

  return Ball;
}();

function frame(timestamp) {
  if (!previousTimestamp) previousTimestamp = timestamp;

  if (timestamp - previousTimestamp >= 16) {
    box.clear();

    balls.forEach(function (ball) {
      ball.render();
    });

    previousTimestamp = timestamp;
  }

  requestAnimationFrame(frame);
}

// create objects
var canvas = document.querySelector("canvas");
var ctx = canvas.getContext("2d");
var box = new Box(ctx);
var balls = [new Ball(ctx, {
  box: box,
  x: Math.random() * (box.bottomLimit - box.topLimit) + box.topLimit,
  y: Math.random() * (box.rightLimit - box.leftLimit) + box.leftLimit,
  xDirection: [-1, 1][Math.round(Math.random())],
  yDirection: [-1, 1][Math.round(Math.random())]
})];
var previousTimestamp = null;

// start animation
box.render();
requestAnimationFrame(frame);

/***/ })
/******/ ]);