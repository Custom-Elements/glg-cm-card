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

      joinNewLine:(value)->
        if value
          value.join('\n');

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