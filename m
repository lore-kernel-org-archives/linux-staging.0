Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8166D0D
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 07:47:54 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id a85so748923pfa.0
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 00:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=cyd1TO42KxdvcksUboP1vrADRv/z/6+I2iUfLJ43Yyw=;
        b=gu4CIrb4pMCx57faV0GmT1dqxw8bCEP9KdEkXOfCIzBZ7S8p/n3HoVxFlqQVa52jm6
         yPm/FeAW6tf6pKpsuRj9ANuTOA6LQKYULOJ0oAXQbA/IJOvBh7F7AKixVER9fW/QbUaI
         Q4fzGnhLQY/FGzoosTOMgx600g5Prhv1eHivqGK8emRmARPG2PMQEmCD8A2Hn81orl6m
         PJbJcUWDSuVmxQcIXfO8YKUznzJ0e7ameQDQD6DKLrCHyNzYNQzRBnbBCM6HB90TO3Lk
         QSu0YOw5qDxMX6YZKb5FelIIApaTo7Nv/XoLT/6Cm4GkrnSRAsvk5Z5qn4kTnT7RQXzr
         UF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=cyd1TO42KxdvcksUboP1vrADRv/z/6+I2iUfLJ43Yyw=;
        b=MTrWpp8JRHDJ34o54lBKTcV9Rw8z354Cnc8evjAIV5KlJlCHl3YtLrcHYbFmH0S6pj
         aiWJ6H12Wf7V9krPjEuKuawaVNC9sd/DnXPJb91skui/+O22eq6GROJB6Cr4uvPTGtZv
         Tf1WdlmPaMwh+vgsJX/mxegTgouJG3yW5DKirgLecqKdPRLA7k/9sTOqGss0ZxAqXQUn
         POi7AhK8g/2pQ4wuciLMIf3NueMHEqv/Y7Cyt3KKiDqHj5P0J8+zZQ9AA0hNBRaU5Zg+
         kRtXMt3K0Q7By1Kt00jeQvGcEbuwHfkXlTI0HDcXVyN+s8LgrhAVHQSeY93lqB+Ev835
         h5kA==
X-Gm-Message-State: AOAM532e817ZTSvy4EW8SKUq34x9sVYke8+ZDMdvHWA+TMbDPI1Iz/Cx
	U/9QA3JUBCI/4amGK/8ViLE=
X-Google-Smtp-Source: ABdhPJy6kzep4AA8UGP+4t/x1BgySCoGHmZQbIj/22oR+qYpL0Itd2PnPwArbwH1JDqXHKhGCPuQqg==
X-Received: by 2002:a65:66d9:: with SMTP id c25mr6712735pgw.359.1617868074362;
        Thu, 08 Apr 2021 00:47:54 -0700 (PDT)
Received: from kali ([152.57.40.190])
        by smtp.gmail.com with ESMTPSA id p2sm23715948pgm.24.2021.04.08.00.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 00:47:54 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:17:49 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: rtl8712: removed unnecessary blank line
Message-ID: <YG61JYTdl1HQKcGj@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Cleanup patch for CHECK: blank lines aren't necessary after an open
brace '{'
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8712/usb_intf.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index dc21e7743349..9038570fb949 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -36,7 +36,6 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 static void r871xu_dev_remove(struct usb_interface *pusb_intf);
 
 static const struct usb_device_id rtl871x_usb_id_tbl[] = {
-
 /* RTL8188SU */
 	/* Realtek */
 	{USB_DEVICE(0x0BDA, 0x8171)},
@@ -441,7 +440,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 
 			for (i = 0, offset = 0; i < 128; i += 8, offset++)
 				r8712_efuse_pg_packet_read(padapter, offset,
-						     &pdata[i]);
+							   &pdata[i]);
 
 			if (!r8712_initmac || !mac_pton(r8712_initmac, mac)) {
 				/* Use the mac address stored in the Efuse
@@ -561,10 +560,10 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 			 */
 			mac[0] &= 0xFE;
 			dev_info(&udev->dev,
-				"r8712u: MAC Address from user = %pM\n", mac);
+				 "r8712u: MAC Address from user = %pM\n", mac);
 		} else {
 			dev_info(&udev->dev,
-				"r8712u: MAC Address from efuse = %pM\n", mac);
+				 "r8712u: MAC Address from efuse = %pM\n", mac);
 		}
 		ether_addr_copy(pnetdev->dev_addr, mac);
 	}
-- 
2.30.2

