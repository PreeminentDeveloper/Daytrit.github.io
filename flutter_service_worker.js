'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "f7396981ef97cc602d66880c1bdb29a5",
"splash/img/light-2x.png": "9f3e9c2ed96a199dc2a714f4770491fe",
"splash/img/dark-4x.png": "fd88d7615e70514a3e49d3465a1d4a82",
"splash/img/light-3x.png": "fea7c4c59d8a2737253526152e3e3fc2",
"splash/img/dark-3x.png": "fea7c4c59d8a2737253526152e3e3fc2",
"splash/img/light-4x.png": "fd88d7615e70514a3e49d3465a1d4a82",
"splash/img/daytrit-official-name-logo_black.png": "5b769a7312609255738588ce8bcd54e8",
"splash/img/dark-2x.png": "9f3e9c2ed96a199dc2a714f4770491fe",
"splash/img/dark-1x.png": "fd9347857b75b023044bfdc99bc78312",
"splash/img/light-1x.png": "fd9347857b75b023044bfdc99bc78312",
"splash/splash.js": "123c400b58bea74c1305ca3ac966748d",
"splash/style.css": "c94c38ff00a9d487c353a2d78989ea08",
"index.html": "9c7dff6ae73aa328b4ccf78b0ff6f1c1",
"/": "9c7dff6ae73aa328b4ccf78b0ff6f1c1",
"main.dart.js": "d0273e1b26ccbf8e1ffae074076df01a",
"paystack_interop.js": "6a93ffd041621b595f3570cc32acc261",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5f76752198692c7954069dabbb092e62",
"icons/Icon-192.png": "8fa7704a7c6eb344b40adcdbba92c074",
"icons/Icon-maskable-192.png": "8fa7704a7c6eb344b40adcdbba92c074",
"icons/Icon-maskable-512.png": "e0fe70fe716a326de019b41ce4dc0a7b",
"icons/Icon-512.png": "e0fe70fe716a326de019b41ce4dc0a7b",
"manifest.json": "fb162006637fb06b9a71c90c5631246d",
"assets/AssetManifest.json": "335934a792f6ec83472d3fed8ef43e7f",
"assets/NOTICES": "a9996d580253cc3f3fb490223940c4d5",
"assets/FontManifest.json": "806858a06988dd5a5c1fa43ea47cee65",
"assets/AssetManifest.bin.json": "a2f1a7dbfe716fd9ab0e1e9255ab2737",
"assets/packages/flutter_paystack/assets/images/discover.png": "c3a58509fe14ba54b0ca0ff29ee5619d",
"assets/packages/flutter_paystack/assets/images/dob.png": "33734b76a856e9b07934793d83a14cae",
"assets/packages/flutter_paystack/assets/images/otp.png": "99aa2d23b63c65db7565622ce17ef3e9",
"assets/packages/flutter_paystack/assets/images/visa.png": "a8b02279da904c1f40e041b20cbaf49c",
"assets/packages/flutter_paystack/assets/images/paystack_icon.png": "5b143d4fa4eb48496adc052b89849025",
"assets/packages/flutter_paystack/assets/images/verve.png": "d9e7f9a5b6987ec61b7c2d0bd7db1271",
"assets/packages/flutter_paystack/assets/images/paystack.png": "0b8db920412edd7d8b40e7e7e01ac439",
"assets/packages/flutter_paystack/assets/images/jcb.png": "82658437070a16f35238c2f989a00c2a",
"assets/packages/flutter_paystack/assets/images/successful.png": "bd7cfa16ecd2b480ca4875fbf8d6f9e2",
"assets/packages/flutter_paystack/assets/images/dinners_club.png": "24450426cbb1e5b657356b6cca621956",
"assets/packages/flutter_paystack/assets/images/mastercard.png": "6aecef820a950ef57140f79e07da916a",
"assets/packages/flutter_paystack/assets/images/american_express.png": "fac1ed63030230003fa52ee8f98aa8dc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "f2163b9d4e6f1ea52063f498c8878bb9",
"assets/packages/youtube_player_flutter/assets/speedometer.webp": "50448630e948b5b3998ae5a5d112622b",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.css": "5a8d0222407e388155d7d1395a75d5b9",
"assets/packages/flutter_inappwebview/assets/t_rex_runner/t-rex.html": "16911fcc170c8af1c5457940bd0bf055",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "835d839ecbe590fc6f007e36fae357fd",
"assets/fonts/MaterialIcons-Regular.otf": "acd43304e5b1e994164d3945688efb4f",
"assets/assets/images/eko.png": "efade26d3d44e61b6f07be89d08b041c",
"assets/assets/images/roundGrace.png": "61b0ea64509f1b03d8e7537e999e6424",
"assets/assets/images/check.png": "8a8f34ffd207ac85692e54273c395a6f",
"assets/assets/images/daytrit_logo%2520copy.png": "43b3cbea7f7cbcb711da98726197fbc8",
"assets/assets/images/onboarding_image_1.png": "62a9ee270f6a4017be2c84f9dcdc9e8b",
"assets/assets/images/onboarding_image_3.png": "1c9b3aea453705162a15f8edbd06ae29",
"assets/assets/images/gracefield_island.png": "30e87d180fb4b0840584e84027088395",
"assets/assets/images/img_mtndataflyer_458x374.png": "1e3a52a1b01e7cbed088c21b8d1cc1c5",
"assets/assets/images/cake.png": "4b10de25e9ea288861006fb6e5ff0880",
"assets/assets/images/daytrit_splash_screen.png": "512d48b7fabb3a37949137824ceb4b4c",
"assets/assets/images/password_visibility_on.png": "470da51fd9595884e10b27a7dafe3cf6",
"assets/assets/images/onboarding_image_2.png": "4fc8bb4c46b91b0d4ecf24c46ca05242",
"assets/assets/images/img_americanherita.png": "24bd8c85cd2ce016df020b69e44df5b3",
"assets/assets/images/img_arrowleft.svg": "65d976201ad0d5306c9343edd80ac31f",
"assets/assets/images/hiii.png": "59564b4c490b4e662695b616cfb650b9",
"assets/assets/images/coin_icon.png": "e937dc9f027dec41e577949e1b0f37bc",
"assets/assets/images/banner.png": "6f1b17d046263d4024448f7226a09a26",
"assets/assets/images/img_camera.svg": "fab13ffd9d38fcb2b60aeb63c2792909",
"assets/assets/images/banner2.png": "187a0126056850fc57e770f855e43fcf",
"assets/assets/images/img_image4_172x350.png": "ca1a0ffe2022013915cfcfd90b3d507a",
"assets/assets/images/img_natallianagorn.png": "19ed3dd343b28474543c6305e9c3fe9d",
"assets/assets/images/banner3.png": "b7881cb5cf8d929be16c9d56f42bba9f",
"assets/assets/images/img_group131.png": "474afc0d5d11b1cf5feed0262ad53769",
"assets/assets/images/img_image2.png": "c9c14ab49d94e6c7463585fe15603db4",
"assets/assets/images/banner1.png": "ce731853e4589a96700cc9d777d00e50",
"assets/assets/images/chicken.png": "ff9322798e1ea9186bfc20f47d48cdbe",
"assets/assets/images/daytrit_official_name_logo_black.png": "5b769a7312609255738588ce8bcd54e8",
"assets/assets/images/visa.png": "93da581b2ca52fd7b27ae999fc8abaaa",
"assets/assets/images/shop.png": "1fb6ff76967cbd0dcd876dca7c7abe0e",
"assets/assets/images/img_unsplashyqfoty.png": "7dcebbcdc0ea8cd6d241700f0891c2e5",
"assets/assets/images/dashboard.svg": "a6e4607ab3e9bb6ec1f263722d6b2914",
"assets/assets/images/img_image4.png": "b5e1b39b47dcc13ee3c0016087380232",
"assets/assets/images/img_notification.svg": "521259e97f9cf03d3359814ed059a26e",
"assets/assets/images/img_user.svg": "f242f601fb5ed588291fff8846032871",
"assets/assets/images/coin_box.png": "515c7072bd7004524d54d5539f3d9f17",
"assets/assets/images/img_home.svg": "1b4dbf3594b69014acab0b06f5ea9c21",
"assets/assets/images/mtn.png": "7aebb9d2b67e344aa81771feb17b6e56",
"assets/assets/images/daytrit_logo.png": "ea37ffa068bce00edb10b4c2980742c2",
"assets/assets/images/play_icon.png": "8f72afa23b3ec3d572aa714d4d974c05",
"assets/assets/images/beach.png": "9aef391a34fff84902f1592f8ad57c67",
"assets/assets/images/verve.png": "02176c4208ce6583f31d28cb78d68a3b",
"assets/assets/images/apple.png": "5cc27b7e8db7476c50d245f351c92acb",
"assets/assets/images/Avatar.png": "99cc7640e4f231ad321778b78df784b7",
"assets/assets/images/daytrit_name_logo.png": "ed2d2576b35864c829fc276211a3371d",
"assets/assets/images/gracefield.png": "979fcd9edb649ceee9e692c0b0c76a53",
"assets/assets/images/password_visibility_off.png": "3dae2ceb8c4731c8f09f557c7dacebb9",
"assets/assets/images/img_eye.svg": "16e3d798a1cb7b6b50e1d8bd89e8a49d",
"assets/assets/images/road_trip.png": "ab1d95ee472abef9fc9c6762758212ae",
"assets/assets/images/img_coins.svg": "b41eae752bbe32a7760c55a99a0c860c",
"assets/assets/images/gardin.png": "013741e14a452e302d5dbffd8033fed3",
"assets/assets/images/beach_wide.png": "e728bcd8922183c7262c611a100d8ba1",
"assets/assets/images/img_group111.png": "51b95fd3f04e412a49aa62b7c44e3fe4",
"assets/assets/images/img_search.svg": "e407717a6b5f044eee0d95010a9ac225",
"assets/assets/images/img_arrowleft_white_a701.svg": "34f876f26d90824ae893706d47c95561",
"assets/assets/images/img_cakeaddesign.png": "0dc750b26f42a8e2fc86974ef44f6296",
"assets/assets/images/img_davidholifield.png": "68d26aec932eb181b603ba3663f3e228",
"assets/assets/images/share.png": "a537cf39d26af10200364af63b0305da",
"assets/assets/images/img_danielhooperp.png": "996f67b51308ebcaa0d2f1c2550d7b2b",
"assets/assets/images/daytrit_official_logo.png": "e328ca2e69b2abe82b34db632c944742",
"assets/assets/images/img_x.svg": "e983e24a4a615a6d25fcc0232da23c0a",
"assets/assets/images/daytrit_blue_logo.png": "b0563e338992b92e77e115815a38668b",
"assets/assets/images/chickbox.png": "f2b61c3022141717f1b822b2b9cf78a3",
"assets/assets/images/new_banner.png": "6d690ca3c5cf056f4a2266e92f58edd4",
"assets/assets/images/img_checkmark.svg": "5bc0fb17a82d5ae5c88df79f1eb9ab22",
"assets/assets/images/edit.png": "3f507d486f75acfd818beecede717158",
"assets/assets/images/img_cakeaddesign_458x375.png": "a3bda2b58965c60ef9fe64e6e47b90a3",
"assets/assets/images/img_mtndataflyer_172x168.png": "b1266f07c752cbf48353e3542c6c35d6",
"assets/assets/images/status4.png": "df3476d18f3097f558bdfad7dd7441f4",
"assets/assets/images/daytrit_blue_black_logo.png": "4c0573542851168a4f2a379558f20526",
"assets/assets/images/image_not_found.png": "a88029aaad6e6ea7596096c7c451840b",
"assets/assets/images/google.png": "716184e81db2a7885de0019fd055b4af",
"assets/assets/images/daytrit_official_name_logo_white.png": "213d4f9c476c799c1ef900649523c91b",
"assets/assets/images/facebook.png": "b46e2028ed2cb1e92e64ff0a745bf32f",
"assets/assets/images/status1.png": "21523604b46ddbe6e0c2ffd1df9e3279",
"assets/assets/images/daytrit_white_logo.png": "31f58b8830340991631c382175362988",
"assets/assets/images/img_image1removeb.png": "78e3e181de99b8f4b40c401d54ebd469",
"assets/assets/images/img_mtndataflyer.png": "2755bc9346f07ab0d233c8c341b8b073",
"assets/assets/images/img_arrowdown.svg": "477fb42a974d4566b93efb957bb33f6f",
"assets/assets/images/status3.png": "615844899d28c664d2d0e9581b286173",
"assets/assets/svgs/search.svg": "c61566964766ac343db55b72b2820677",
"assets/assets/svgs/flight.svg": "6011c2946e0e024a1d7317727910d029",
"assets/assets/svgs/User.svg": "f93ba5e42e54a88e438d96ba52c3de9f",
"assets/assets/svgs/black_home.svg": "039688c4c997d9e2289c30da8b8c528a",
"assets/assets/svgs/person.svg": "898259c75a16ed789d5ddf01763a712d",
"assets/assets/svgs/home.svg": "88a56f611b87acf87c95a5ee8d2de06d",
"assets/assets/svgs/logout.svg": "9dd913784f90ea3c139424ce0d09a39e",
"assets/assets/svgs/black_notification.svg": "a0129cf1f7c334fdf960f02ca49c9f05",
"assets/assets/svgs/Headset.svg": "60e212b31ce36c9929141b6d8e7f9104",
"assets/assets/svgs/deep_wallet.svg": "53c7bc34d16414a3828067c479ffdad0",
"assets/assets/svgs/vendor.svg": "08a14eb6dcb171c3de13e5a883d11069",
"assets/assets/svgs/order.svg": "6ab4f07ac91a32543ee3c878e72a54b4",
"assets/assets/svgs/travel.svg": "ce013555134391cfe620e37f4cbecf1c",
"assets/assets/svgs/StatusSwitch.svg": "2065257692da226ead2124a7d323d8ca",
"assets/assets/svgs/wallet.svg": "0ead740b7127eacfaec7f77d82244601",
"assets/assets/svgs/dashboard.svg": "a6e4607ab3e9bb6ec1f263722d6b2914",
"assets/assets/svgs/dates.svg": "075a2f70b1aa49cbd477111dd1945936",
"assets/assets/svgs/check.svg": "6d431a291e2cb7a4e9b9d0cf71fbb1f4",
"assets/assets/svgs/lemon_headset.svg": "233e9bf830afac39fe4a9193ca210d2e",
"assets/assets/svgs/watch.svg": "37a2dfe66c227e6789f9d61b7ae61068",
"assets/assets/svgs/deposit.svg": "8dcc7735970eac0e2167de033a78617a",
"assets/assets/svgs/add.svg": "9bae5174cf8ab34d3d6ae8884bcda4f6",
"assets/assets/svgs/people.svg": "064f6154a35adb2fec886e250760f643",
"assets/assets/svgs/Coins.svg": "7d0c656e29eba42b259cba88b682ca09",
"assets/assets/svgs/light_wallet.svg": "10d8e3256d7a3f96e9fed778a4082148",
"assets/assets/svgs/notification.svg": "56a3eba2c0ce51e18bb08227b3951851",
"assets/assets/svgs/beach3.svg": "e89a16a446d9a6aa9928bd2263b07d75",
"assets/assets/svgs/beach2.svg": "44ce283aeae71ccf74c0e885ab85eacb",
"assets/assets/svgs/star.svg": "f5ae175622b5e848a82a28e883d8bac6",
"assets/assets/svgs/black_watch.svg": "de301e10dcb52f49bb4676aeb2f60b86",
"assets/assets/svgs/edit.svg": "5d08a52f9add6cd0db4568d00fcdb846",
"assets/assets/svgs/faq.svg": "fe2f636c9731faf515bc344e9ed810c2",
"assets/assets/svgs/beach1.svg": "c7bc5a1ca2ba652313ee2f4c5919cd33",
"assets/assets/svgs/Frame.svg": "f2bf051927c37035a5164f3a95e5e7f7",
"assets/assets/svgs/trip.svg": "486f5aa07df90322e4b6375886dea523",
"assets/assets/svgs/date.svg": "f1badadf5c8706cae6cd70bd05c142f8",
"assets/assets/svgs/more_vert.svg": "b40bf2216beaf3625bc79a3dc86026bb",
"assets/assets/svgs/revenue.svg": "b71ef956e73af454f84b04f16d338587",
"assets/assets/svgs/weight.svg": "32f272c5aff7dea59762867d952272ec",
"assets/assets/svgs/vert.svg": "edb3ec4733d0d058d293b47e0cabac06",
"assets/assets/svgs/add_vendor.svg": "3fbe724402b0f438a5587efa1595504b",
"assets/assets/svgs/privacy.svg": "586a95b476deb06c6e473a77f4f88ef8",
"assets/assets/fonts/AeonikTRIAL-LightItalic.otf": "5e38542d92d278309b926354f3e9dd34",
"assets/assets/fonts/AeonikTRIAL-Regular.otf": "fc7dcdbbfd339d1d810345a43751054d",
"assets/assets/fonts/AeonikTRIAL-Light.otf": "9273ff290be490993a7ea85ed65dbea2",
"assets/assets/fonts/AeonikTRIAL-BoldItalic.otf": "bcfac77226ce3bfa7d160f7089217a83",
"assets/assets/fonts/AeonikTRIAL-Bold.otf": "c62e7a45950ffb9009388facbdc53cb3",
"assets/assets/fonts/AeonikTRIAL-RegularItalic.otf": "27ac158d4c9ce33bee35f0fd5fa45440",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
