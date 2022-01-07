Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DAB2CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 21:50:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l25so2655883wrb.13
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qd2MUjateJP8WxPnVI13o6zs3521STkyo0JY4qUchOI=;
        b=cg3dKnod/AnHI9m0rDURb9DUp8cIFfp4L7lxM4gWOhML9io1tWgDxBaRb41VqoepQh
         m8ejqBO6PXVjWhuRPfQjydiVAGViz4K8Q5UnZvYwwrwIfnlLXvc5vsDfGt8UxhzDHyrZ
         2jtVxVHQIhumH0Z0gDXN5P2ggk7wkwJeNlkmPEjqvmO3Betm66G0f3LfjlazgWnjCKZD
         F/JsXw8o6X7Vx4P0TQYlz9crzFOY513aDU41ZO1gh6OlEKCCoalPMdJdms1FKfOKUi6u
         2yz+wfy/naElUNXkhWk0cAEpu7C0st6NWW7i4wE244ab61TEjbuUhyEDtjzE8vLuXWie
         l5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qd2MUjateJP8WxPnVI13o6zs3521STkyo0JY4qUchOI=;
        b=lNl5ZAGS6wS+7GBb1caODbiordFv3DpGz/P0UYT/WQpSWtdTDDr7Fc/T7CwwBaQnES
         b+l4p7S8Ob6owLf9aVzZ4l3YoQGup+wWqstzN0ufSoKNjXPkj05LwgI18D8BaU2khhnA
         ubm6OVxgLQdMtpN6FL20rbfvfCqe4VkHX0se8vGQ3IqHAV7MhkMTPcsfJEiWltFccPci
         tI75o0IpIqXYytpP68Ngavyl2szIfdaYBoBy68MlcwYg3z6vuo9lXth5bESeZh8gpcPE
         SSKq4cOLS0VxLf9lJl79QioVddZnLwtu8XdGzwVia7VySMRjoG19v2ypyL2c6SSDFW23
         ZOiQ==
X-Gm-Message-State: AOAM532tlk1snd+glveXlL7OyXjVZJvCCxa2r1R40nsohgGhzQ+bBzzt
	X+TRR9P45ga81RnHsJQPluk=
X-Google-Smtp-Source: ABdhPJwiThWEV7gGSM22XNZ+RKjltQa7kWzD3PiqHMPyhToHoHJKII0nTb/zcktv3VRgRDsHeJAAPA==
X-Received: by 2002:adf:e70e:: with SMTP id c14mr3489753wrm.334.1641592249500;
        Fri, 07 Jan 2022 13:50:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id k14sm1729161wrn.59.2022.01.07.13.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:50:49 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/6] staging: r8188eu: EfuseUsedBytes is set but never used
Date: Fri,  7 Jan 2022 22:50:32 +0100
Message-Id: <20220107215033.12257-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107215033.12257-1-straube.linux@gmail.com>
References: <20220107215033.12257-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field EfuseUsedBytes of struct hal_data_8188e is set but never
used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 ---
 drivers/staging/r8188eu/hal/usb_halinit.c       | 3 ---
 drivers/staging/r8188eu/include/hal_intf.h      | 1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 2 --
 4 files changed, 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index b818872e0d19..53328c4b1fd1 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -797,9 +797,6 @@ static void Hal_EfuseReadEFuse88E(struct adapter *Adapter,
 	for (i = 0; i < _size_byte; i++)
 		pbuf[i] = efuseTbl[_offset + i];
 
-	/*  5. Calculate Efuse utilization. */
-	SetHwReg8188EU(Adapter, HW_VAR_EFUSE_BYTES, (u8 *)&eFuse_Addr);
-
 exit:
 	kfree(efuseTbl);
 	kfree(eFuseWord);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index c1129c83ebf7..10e40e654775 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1528,9 +1528,6 @@ void SetHwReg8188EU(struct adapter *Adapter, u8 variable, u8 *val)
 			}
 		}
 		break;
-	case HW_VAR_EFUSE_BYTES: /*  To set EFUE total used bytes, added by Roger, 2008.12.22. */
-		haldata->EfuseUsedBytes = *((u16 *)val);
-		break;
 	case HW_VAR_FIFO_CLEARN_UP:
 		{
 			struct pwrctrl_priv *pwrpriv = &Adapter->pwrctrlpriv;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 37c2d2b82ea8..a86cb376a125 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -59,7 +59,6 @@ enum hw_variables {
 	HW_VAR_ANTENNA_DIVERSITY_SELECT,
 	HW_VAR_SWITCH_EPHY_WoWLAN,
 	HW_VAR_EFUSE_USAGE,
-	HW_VAR_EFUSE_BYTES,
 	HW_VAR_EFUSE_BT_USAGE,
 	HW_VAR_EFUSE_BT_BYTES,
 	HW_VAR_FIFO_CLEARN_UP,
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 8134a173ea07..837b633cf98a 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -232,8 +232,6 @@ struct hal_data_8188e {
 	u8	OutEpQueueSel;
 	u8	OutEpNumber;
 
-	u16	EfuseUsedBytes;
-
 	struct P2P_PS_Offload_t	p2p_ps_offload;
 
 	/*  Auto FSM to Turn On, include clock, isolation, power control
-- 
2.34.1

