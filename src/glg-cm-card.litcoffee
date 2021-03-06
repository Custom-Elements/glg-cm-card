#glg-cm-card


    Polymer 'glg-cm-card',

      addLabel:()->
        if @selected
          @selected = !@selected
        else
          @selected = true

        if @selected
          @fire 'card-selected',
            @data

      dataChanged:(o, n)->
        @_jobHistory = if @data.JobHistory.length > 0 then @data.JobHistory else [@blankHistory]

      joinNewLine:(value)->
        if value
          value.join('\n')

      ready:()->
        @blankHistory =
          "Company": "",
          "Title": "",
          "Start": "",
          "End": "",
        @_jobHistory = [@blankHistory]

      domReady:()->
        @fire 'card-dom-ready'

#glg-cm-card-stack


    Polymer 'glg-cm-card-stack',

      getSelected:()->
        selected = []
        @.shadowRoot.querySelectorAll('glg-cm-card').array().forEach (i, index)=>
          if i.selected
            selected.push
              'data': i.data,
              'index': index

        selected

      dataChanged: ()->
        @readyTracker = 0

      cardReadyTracker: ()->
        if (@data)
          @readyTracker += 1

          if @data.length <= @readyTracker
            @fire 'glg-cm-card-stack-ready'

      ready: ()->
        @readyTracker = 0
