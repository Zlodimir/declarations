// $(document).ready(function() {
//   var $socialLikes;
//   $socialLikes = $('.social-likes');

//   if ($socialLikes.length === 0) {
//     return;
//   }

//   if (typeof gon.model === 'undefined') {
//     return;
//   }

//   $socialLikes.on('ready.social-likes', function(event, number) {
//     var netValues = [];

//     for (i = 0, len = gon.social_nets.length; i < len; i++) {
//       var service = gon.social_nets[i];
//       netValues.push({ service: service, value: +($(event.currentTarget).find('.social-likes__counter_' + service).text())||0 } );
//     }
//     SocialLike(null, netValues)
//   });


//   $socialLikes.on('popup_closed.social-likes', function(event, service, win) {
//     SocialLike(service, [])
//   });

//   SocialLike = function(service, netValues) {
//     return $.ajax({
//       url: '/social_likes',
//       type: 'POST',
//       dataType: 'json',
//       data: {
//         social_like: {
//           service: service,
//           social_value: netValues,
//           likeable: { id: gon.model.id, model: gon.model.name }
//         }
//       }
//     });
//   };
// });
