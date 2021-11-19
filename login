<!DOCTYPE html>
<html>

<head>
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
  apiKey: "AIzaSyA-Vjq1sBnq7ZRxEVBT-nmelOn6-BaqG3s",
  authDomain: "login-project-7646c.firebaseapp.com",
  projectId: "login-project-7646c",
  storageBucket: "login-project-7646c.appspot.com",
  messagingSenderId: "690231460532",
  appId: "1:690231460532:web:0f4b4cc7a7ccbe62ddcde1"
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
               window.open('https://script.google.com/macros/s/AKfycbymE_uPC0GRHZyZYOt_agBHF5Satmv2lsCr9TqqtlkSRkdr3d2m/exec');
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
</head>

<body>
    <div class="container center-align">
        <br /><br /><h4>ลงชื่อเข้าใช้งาน</h4><br />
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
