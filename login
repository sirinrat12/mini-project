<!DOCTYPE html>
<html>

<head>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    
    <base target="_top">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://www.gstatic.com/firebasejs/7.14.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/7.14.2/firebase-auth.js"></script>
    <script src="https://cdn.firebase.com/libs/firebaseui/3.5.2/firebaseui.js"></script>
    <link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.5.2/firebaseui.css" />
    <script>
        var firebaseConfig = { // enter the details below
  apiKey: "AIzaSyC0L7Hpx0g43Snx3btxzXA_QuAD_ScFhew",
  authDomain: "login2-bddd3.firebaseapp.com",
  projectId: "login2-bddd3",
  storageBucket: "login2-bddd3.appspot.com",
  messagingSenderId: "1015379177001",
  appId: "1:1015379177001:web:1c2571b77c8d4a267e7638"
        };
        firebase.initializeApp(firebaseConfig);
    </script>
    <script>
        google.script.run.withSuccessHandler(function(url) {
            var uiConfig = {
                signInFlow: 'popup',
                signInSuccessUrl: url,
                signInOptions: [
                    firebase.auth.GoogleAuthProvider.PROVIDER_ID,
                    firebase.auth.FacebookAuthProvider.PROVIDER_ID,
                    firebase.auth.EmailAuthProvider.PROVIDER_ID
                ],
            };
            var ui = new firebaseui.auth.AuthUI(firebase.auth());
            var user = firebase.auth().currentUser;
            if (user) {
               window.open('https://script.google.com/macros/s/AKfycbz-JV_PG0zOFeXoRsexC_ATRjZe0Hpm8yY_2mcvXeknxho4TUw/exec');
                document.getElementById("signOut").style.display = "inline-block";
            } else {
                ui.start('#firebaseui-auth-container', uiConfig);
            }
        }).webAppUrl();
    </script>
    <script>
        initApp = function() {
            firebase.auth().onAuthStateChanged(function(user) {
                if (user) {
                  
                    user.getIdToken().then(function(accessToken) {})

                } else {
                    document.getElementById('account-details').textContent = '';
                }
            });
        };
        window.addEventListener('load', function() {
            initApp();
            
        });
    </script>
     <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Prompt">
</head>

<body>
    <img src="https://drive.google.com/uc?id=1zFTxfu60-xbQCW6RDagEViM8ZMBhYFI4"width="800"height="150" class ="carousel slide" >
    <div class="container center-align">
        <br /><br /><h4>กรุณาลงชื่อเข้าใช้งาน</h4><br />
        <div id="firebaseui-auth-container"></div>
        <div class="row">
            <div class="col s12 m3 offset-m4">
                <pre id="account-details" class="left-align"></pre>
            </div>
        </div>
        <button style="display: none" id="signOut" class="firebaseui-idp-button mdl-button mdl-js-button mdl-button--raised firebaseui-idp-google firebaseui-id-idp-button" data-provider-id="google.com" data-upgraded=",MaterialButton">
            <span class="firebaseui-idp-icon-wrapper"><img class="firebaseui-idp-icon" alt="" src="https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg"></span>
            <span class="firebaseui-idp-text firebaseui-idp-text-long">Sign out (ออกจากระบบ)</span>
        </button>
        
        <script>
            document.getElementById('signOut').addEventListener('click', function(event) {
                firebase.auth().signOut();
                reload();
            });
            function reload() {
                google.script.run.withSuccessHandler(function(url) {
                    window.open(url, '_top');
                }).webAppUrl();
            }
        </script>
        
    </div>
</body>

</html>
