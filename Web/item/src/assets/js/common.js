export function screenwidth(laywidth) {
   let layoutwidth = document.body.clientWidth - 200;
    window.onresize = () => {
        return (() => {
            laywidth = document.body.clientWidth - 200;
         
          })();
    }
   
}