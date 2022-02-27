window.addEventListener("message", function(event) {
    var v = event.data

    switch (v.action) {
        case 'open':
            $('.menu').fadeIn(1000)
        break;

        case 'LoadEmotes':
            $('.emoteslista').append(`
                <div class="emoteslistadios">
                    <li id='${v.emotename}'>${v.emotes}</li>
                </div>
            `)   

            $(`#${v.emotename}`).click(function() {
                emote = this.id
                $.post('https://Roda_Animations/executeemote', JSON.stringify({
                    emote: emote,
                    type: 'emote',
                }));
            });
        break;

        case 'LoadObjects': 
            $('.objectlista').show()
            $('.objectlista').append(`
                <div class="objectsadios">
                    <li id='${v.emotename}'>${v.emotes}</li>
                </div>
             `)  
        
            $(`#${v.emotename}`).click(function() {
                emote = this.id
                $.post('https://Roda_Animations/executeemote', JSON.stringify({
                    emote: emote,
                    type: 'emote',
                }));
            });
        break;

        case 'LoadDances': 
            $('.dancelista').show()
            $('.dancelista').append(`
                <div class="danceadios">
                    <li id='${v.emotename}'>${v.emotes}</li>
                </div>
             `)  
        
            $(`#${v.emotename}`).click(function() {
                emote = this.id
                $.post('https://Roda_Animations/executeemote', JSON.stringify({
                    emote: emote,
                    type: 'emote',
                }));
            });
        break;  

        case 'LoadShared': 
            $('.sharedlista').show()
            $('.sharedlista').append(`
                <div class="sharedadios">
                    <li id='${v.emotename}'>${v.emotes}</li>
                </div>
             `)  
        
            $(`#${v.emotename}`).click(function() {
                emote = this.id
                $.post('https://Roda_Animations/executeemote', JSON.stringify({
                    emote: emote,
                    type: 'shared',
                }));
            });
        break;

        case 'LoadWalk': 
            $('.walklista').show()
            $('.walklista').append(`
                <div class="walkadios">
                    <li id='${v.emotename}'>${v.emotes}</li>
                </div>
            `)  
        
            $(`#${v.emotename}`).click(function() {
                emote = this.id

                $.post('https://Roda_Animations/executeemote', JSON.stringify({
                    emote: emote,
                    type: 'walk',
                }));
            });
        break;  

        case 'LoadAim': 
            $('.aimLista').show()
            $('.aimLista').append(`
                <div class="aimadios">
                    <li id='${v.emotename}'>${v.emotes}</li>
                </div>
            `)  
        
            $(`#${v.emotename}`).click(function() {
                emote = this.id

                $.post('https://Roda_Animations/executeemote', JSON.stringify({
                    emote: emote,
                    type: 'aim',
                }));
            });
        break;  

        case 'Expresions': 
            $('.expresionlista').show()
            $('.expresionlista').append(`
                <div class="expresionadios">
                    <li id='${v.emotename}'>${v.emotes}</li>
                </div>
            `)  
        
            $(`#${v.emotename}`).click(function() {
                emote = this.id

                $.post('https://Roda_Animations/executeemote', JSON.stringify({
                    emote: emote,
                    type: 'expresion',
                }));
            });
        break;
        
        case 'sharedDances': 
            $('.shareddance').show()
            $('.shareddance').append(`
                <div class="sharedanceadios">
                    <li id='dance-${v.emotename}'>${v.emotes}</li>
                </div>
            `)  
        
            $(`#dance-${v.emotename}`).click(function() {
                emote = this.id
                $.post('https://Roda_Animations/executeemote', JSON.stringify({
                    emote: v.emotename,
                    type: 'sharedance',
                }));
            });
        break;

        case 'exit':
            $('.menu').fadeOut(500)
        break;
    } 


});


function AddActive(etiqueta, bool, clase) {
    if (bool == true) {
        $(`.${etiqueta}`).addClass(clase)
    } else if (bool == false) {
        $(`.${etiqueta}`).removeClass(clase)
    }
}

$(document).keyup((e) => {
    if (e.key === "Escape") {
        setTimeout(() => {
            $.post('https://Roda_Animations/exit', JSON.stringify({}));
        }, 300);
    }
});




$(function() {
    $('.fa-grin-hearts').click(function() {
        AddActive('fa-grin-hearts', true, 'activeleft')
        AddActive('fa-person-carry', false, 'active')

        AddActive('fa-person-sign', false, 'active')
        AddActive('fa-walking', false, 'activeright')

        AddActive('fa-people-arrows', false, 'activebtnleft')
        AddActive('fa-people-carry', false, 'active')
        AddActive('fa-flushed', false, 'active')
        AddActive('fa-crosshairs', false, 'activebtnright')
        $('.emoteslista').show()
        $('.objectlista').hide()
        $('.dancelista').hide()
        $('.walklista').hide()
        $('.sharedlista').hide()
        $('.shareddance').hide()
        $('.expresionlista').hide()
        $('.aimLista').hide()
        $('.menuanimaciones h1').text('Animations')
    });
    
    $('.fa-person-carry').click(function() {
        AddActive('fa-grin-hearts', false, 'activeleft')
        AddActive('fa-person-carry', true, 'active')

        AddActive('fa-person-sign', false, 'active')
        AddActive('fa-walking', false, 'activeright')

        AddActive('fa-people-arrows', false, 'activebtnleft')
        AddActive('fa-people-carry', false, 'active')
        AddActive('fa-flushed', false, 'active')
        AddActive('fa-crosshairs', false, 'activebtnright')
        $('.emoteslista').hide()
        $('.objectlista').show()
        $('.dancelista').hide() 
        $('.walklista').hide()
        $('.sharedlista').hide()
        $('.shareddance').hide()
        $('.expresionlista').hide()
        $('.aimLista').hide()
        $('.menuanimaciones h1').text('Objects')
    });
    $('.fa-person-sign').click(function() {
        AddActive('fa-grin-hearts', false, 'activeleft')
        AddActive('fa-person-carry', false, 'active')

        AddActive('fa-person-sign', true, 'active')
        AddActive('fa-walking', false, 'activeright')

        AddActive('fa-people-arrows', false, 'activebtnleft')
        AddActive('fa-people-carry', false, 'active')
        AddActive('fa-flushed', false, 'active')
        AddActive('fa-crosshairs', false, 'activebtnright')
        $('.emoteslista').hide()
        $('.objectlista').hide()
        $('.dancelista').show()
        $('.walklista').hide()    
        $('.sharedlista').hide()
        $('.expresionlista').hide()
        $('.shareddance').hide()
        $('.aimLista').hide()
        $('.menuanimaciones h1').text('Dances')
    });

    $('.fa-walking').click(function() {
        AddActive('fa-grin-hearts', false, 'activeleft')
        AddActive('fa-person-carry', false, 'active')

        AddActive('fa-person-sign', false, 'active')
        AddActive('fa-walking', true, 'activeright')

        AddActive('fa-people-arrows', false, 'activebtnleft')
        AddActive('fa-people-carry', false, 'active')
        AddActive('fa-flushed', false, 'active')
        AddActive('fa-crosshairs', false, 'activebtnright')
        $('.emoteslista').hide()
        $('.objectlista').hide()
        $('.dancelista').hide()
        $('.walklista').show()  
        $('.sharedlista').hide()
        $('.shareddance').hide()
        $('.expresionlista').hide()
        $('.aimLista').hide()
        $('.menuanimaciones h1').text('Walks') 
    });

    $('.fa-people-arrows').click(function() {
        AddActive('fa-grin-hearts', false, 'activeleft')
        AddActive('fa-person-carry', false, 'active')

        AddActive('fa-person-sign', false, 'active')
        AddActive('fa-walking', false, 'activeright')

        AddActive('fa-people-arrows', true, 'activebtnleft')
        AddActive('fa-people-carry', false, 'active')
        AddActive('fa-flushed', false, 'active')
        AddActive('fa-crosshairs', false, 'activebtnright')
        $('.emoteslista').hide()
        $('.objectlista').hide()
        $('.dancelista').hide()
        $('.walklista').hide()  
        $('.sharedlista').show()
        $('.shareddance').hide()
        $('.expresionlista').hide()
        $('.aimLista').hide()
        $('.menuanimaciones h1').text('Shared Animations') 
    });

    $('.fa-people-carry').click(function() {
        AddActive('fa-grin-hearts', false, 'activeleft')
        AddActive('fa-person-carry', false, 'active')

        AddActive('fa-person-sign', false, 'active')
        AddActive('fa-walking', false, 'activeright')

        AddActive('fa-people-arrows', false, 'activebtnleft')
        AddActive('fa-people-carry', true, 'active')
        AddActive('fa-flushed', false, 'active')
        AddActive('fa-crosshairs', false, 'activebtnright')
        $('.emoteslista').hide()
        $('.objectlista').hide()
        $('.dancelista').hide()
        $('.walklista').hide()  
        $('.sharedlista').hide()
        $('.shareddance').show()
        $('.expresionlista').hide()
        $('.aimLista').hide()
        $('.menuanimaciones h1').text('Shared Dances') 
    });

    $('.fa-flushed').click(function() {
        AddActive('fa-grin-hearts', false, 'activeleft')
        AddActive('fa-person-carry', false, 'active')

        AddActive('fa-person-sign', false, 'active')
        AddActive('fa-walking', false, 'activeright')

        AddActive('fa-people-arrows', false, 'activebtnleft')
        AddActive('fa-people-carry', false, 'active')
        AddActive('fa-flushed', true, 'active')
        AddActive('fa-crosshairs', false, 'activebtnright')
        $('.emoteslista').hide()
        $('.objectlista').hide()
        $('.dancelista').hide()
        $('.walklista').hide()  
        $('.sharedlista').hide()
        $('.shareddance').hide()
        $('.expresionlista').show()
        $('.aimLista').hide()
        $('.menuanimaciones h1').text('Expresions') 
    });

    $('.fa-crosshairs').click(function() {
        AddActive('fa-grin-hearts', false, 'activeleft')
        AddActive('fa-person-carry', false, 'active')

        AddActive('fa-person-sign', false, 'active')
        AddActive('fa-walking', false, 'activeright')

        AddActive('fa-people-arrows', false, 'activebtnleft')
        AddActive('fa-people-carry', false, 'active')
        AddActive('fa-flushed', false, 'active')
        AddActive('fa-crosshairs', true, 'activebtnright')
        $('.emoteslista').hide()
        $('.objectlista').hide()
        $('.dancelista').hide()
        $('.walklista').hide()  
        $('.sharedlista').hide()
        $('.shareddance').hide()
        $('.expresionlista').hide()
        $('.aimLista').show()
        $('.menuanimaciones h1').text('Aim Type') 
    });



}); 




window.addEventListener('load', () => {
    $.post('https://Roda_Animations/callAnimations', JSON.stringify({})); 
});