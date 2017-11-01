bc = require '../src/identificador.coffee'
assert = require('chai').assert
exp = require("chai").expect

describe 'identificador', ->
  describe 'converter', ->
    describe 'hoje (agora)', ->
      it 'deve iniciar com y (ou z se ano > 2099) e ter mais 7 caracteres', ->
        res = bc.hoje()
        tamanho = res.length
        console.log(res)
        exp(tamanho).equal(8)
    data = '19/02/2016 13:44'
    describe 'data ' + data, ->
      res = bc.converter(data)
      it 'ateh 2099 deve iniciar com y', ->
        exp(res).equal('Y16CTN44')
    data = '30/11/2017 00:21'
    describe 'data ' + data, ->
      res = bc.converter(data)
      it 'meia noite (zero horas)', ->
        exp(res).equal('Y17L5A21')
    data = '30/11/2199 06:21'
    describe 'data ' + data, ->
      res = bc.converter(data)
      it 'de 2100 ateh 2199 deve iniciar com z', ->
        exp(res).equal('Z99L5G21')
  describe 'calcular', ->
    it 'algo diferente de um numero, deve ser nulo, por exemplo: uma letra', ->
      res = bc.calcular('R')
      assert res  == null
    it 'sem informar numero', ->
      assert bc.calcular(null) == null
    it 'maior q trinta e um', ->
      assert bc.calcular(32) == null
    it 'um deve ser be', ->
      deve 1, 'B'
    it 'vinte e seis deve ser um', ->
      assert bc.calcular(26) == '1'
    it 'vinte e oito deve ser tres', ->
      assert bc.calcular(28) == '3'
    it 'trinta deveria ser cinco', ->
      assert bc.calcular(30) == '5'

deve = (num, res) ->
  assert bc.calcular(num) == res
  
# map <Enter> <Bar>:w<CR>
