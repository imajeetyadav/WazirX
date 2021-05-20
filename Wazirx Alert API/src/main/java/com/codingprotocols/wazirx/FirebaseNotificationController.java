package com.codingprotocols.wazirx;

import com.codingprotocols.wazirx.models.Note;
import com.google.firebase.messaging.FirebaseMessagingException;
import org.springframework.web.bind.annotation.*;

@RestController
public class FirebaseNotificationController {

    FirebaseMessagingService firebaseService;
    @RequestMapping("/send-notification")
    @ResponseBody
    public String sendNotification(@RequestBody Note note,
                                   @RequestParam String token) throws FirebaseMessagingException {
        return firebaseService.sendNotification(note, token);
    }
}
