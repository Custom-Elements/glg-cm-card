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