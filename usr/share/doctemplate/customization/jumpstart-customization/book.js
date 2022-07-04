var divs_module = new Array();
var divs_topic = new Array();
var module_topics = new Array(new Array());
var curr_module_div = 0;
var curr_topic_div = 0;
var modules;
var topics;
$(document).ready(function(){

    divs_module = $("div.module").get();
    //alert (divs_module.length);
    divs_topic = $("div.topic").get();
    //alert("module_topics: " + divs_topic.length);


    get_module_topics();

    //alert(divs_topics.length);
    nav_state = new NavState(divs_module, curr_module_div, module_topics, curr_topic_div);
    //topics = new NavDivs(divs_topic, curr_topic_div);
    //alert(divs_module.length);
    //alert(divs_module[1].getAttribute("id"));
    //alert(modules.divs[1].getAttribute("id"));


    $("button[class='but_prev_mod']").click(function(event){
       showPrevious(nav_state);
    });
    $("button[class='but_next_mod']").click(function(event){
       showNext(nav_state);
    });
    $("button[class='but_prev_topic']").click(function(event){
       showPreviousTopic(nav_state);
    });
    $("button[class='but_next_topic']").click(function(event){
       showNextTopic(nav_state);
    });

    divs_module[0].style.display = "block";
    divs_topic[0].style.display = "block";
});


    function NavState(mods, curr_mod, topics, curr_topic)
    {
        this.mods = mods;
        this.curr_module = curr_mod;
        this.mod_topics = topics;
        //alert("mod_topics[0]:" + this.mod_topics[0].length);
        this.curr_topic = curr_topic;
    }

    function get_module_topics () {
        for (i=0; i < divs_module.length; i++){
            mod_id = divs_module[i].getAttribute("id");
            var selector = "div[id='" + mod_id + "']>div[class='topic']"
            module_topics[i] = $(selector);
        }
    }

    function showPrevious(nav)
    {
        //alert("in prev. " + nav.curr_module);
        //alert(nav.mod_divs[nav.curr].getAttribute("id"));
        if (nav.curr_module > -1) {
            nav.mods[nav.curr_module].style.display = "none";
        }
        nav.curr_module -= 1;
        if (nav.curr_module >= 0) {
            nav.mods[nav.curr_module].style.display = "block";
        } else {
            //alert ("past the end");
            nav.curr_module = nav.mods.length - 1;
            nav.mods[nav.curr_module].style.display = "block";
        }
        show_first_topic(nav);
    }

    function showNext(nav)
    {
        //alert("in next. " + nav.curr_module);
        if (nav.curr_module > -1) {
            nav.mods[nav.curr_module].style.display = "none";
        }
        nav.curr_module += 1;
        //alert("nav.curr_module: " + nav.curr_module + " nav.mods.length:" + nav.mods.length);
        if (nav.curr_module < nav.mods.length) {
            nav.mods[nav.curr_module].style.display = "block";
        } else {
            //alert ("past the end");
            nav.curr_module = 0;
            nav.mods[nav.curr_module].style.display = "block";
        }
        show_first_topic(nav);
        return;
    }


    function showPreviousTopic(nav)
    {
        //alert("in prev. " + nav.mod_topics[0][0].getAttribute("id") + " "  + nav.curr_topic);
        //alert(nav.topicss[nav.curr].getAttribute("id"));
        if (nav.curr_topic > -1) {
            nav.mod_topics[nav.curr_module][nav.curr_topic].style.display = "none";
        }
        nav.curr_topic -= 1;
        if (nav.curr_topic >= 0) {
            nav.mod_topics[nav.curr_module][nav.curr_topic].style.display = "block";
        } else {
            //alert ("Prev Topic: past the end")
            showPrevious(nav);
// now display the last topic in this new module
            //alert("num topics in current module: " + nav.mod_topics[nav.curr_module].length);
            nav.mod_topics[nav.curr_module][0].style.display = "none";
            var new_mod_last_topic = (nav.mod_topics[nav.curr_module].length) - 1 ;
            nav.mod_topics[nav.curr_module][new_mod_last_topic].style.display = "block";
            nav.curr_topic = new_mod_last_topic
        }
        return;
    }
    function showNextTopic(nav)
    {
        //alert("in prev. " + nav.mod_topics[0][0].getAttribute("id") + " "  + nav.curr_topic);
        //alert(nav.curr_topic);
        if (nav.curr_topic > -1) {
            nav.mod_topics[nav.curr_module][nav.curr_topic].style.display = "none";
        }
        nav.curr_topic += 1;
        if (nav.curr_topic >= nav.mod_topics[nav.curr_module].length ) {
// display the next module, first (0th) topic
            showNext(nav);
            nav.mod_topics[nav.curr_module][0].style.display = "block";
            nav.curr_topic = 0
        } else {
            nav.mod_topics[nav.curr_module][nav.curr_topic].style.display = "block";
            //alert ("past the end")
        }

    }

    function show_first_topic(nav)
    {
// set all topics to hidden
        for (i=0; i<divs_topic.length; i++){
            divs_topic[i].style.display = "none";
        }
// show the 0th topif of the new module
        module_topics[nav.curr_module][0].style.display = "block";

// update the nav obj to reflect current topic, which must be 0 because
// we just switched to a new module
        nav.curr_topic = 0;
        return;
    }

