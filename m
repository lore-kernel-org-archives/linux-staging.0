Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4069010E6
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 04:59:26 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id z16so613519pfh.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Mar 2022 21:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=BIi8aIx4Pvfk7S17+jHZfQfpXJsGvw744CrZCscalCQ=;
        b=aAi92wzJLgsGIKJgq7Znwh4Z1TY6RlFPcBQjYeecZaydciy/T2xFC1Cy/JVio4wzzU
         0hos1L5o56Ipj+8vvPoVMwsfHD4sjbifeWgLanzAKXcmHGYVeSwFoj8csV4IyneU/DOM
         ivY6B52fpxOCMCxVJbdm/rQ7ZGnpCJ4MT6xVLCZnsciva0ipk45ZeNcaE9536miI5zAy
         8zF5PeF8vKud7NWVQByUkUbkyRe7vaFGARJg4IJwAUx9j1Wm98wt5qsjvJR8yLo2AuVS
         JE23U4yqFJg/Uo87aFdBEMJ2oXHeYqnE58t1dfh4FsMPJB2odpT2KC0xwvzBxMhgN0t8
         kyDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BIi8aIx4Pvfk7S17+jHZfQfpXJsGvw744CrZCscalCQ=;
        b=Ft3X9jPyyi7nCwX4pype/pJrty1xJinoIWepuD2RKoUHmWHUyTrvKBWJj2BLV5oi1e
         tiM1EWIOVM+V9gqDc1ZLX9YKVa+W+n6lrXuWwpvL8PM0Jq0SMq/VfvT1+lF3DhEtEJj5
         DvWN96wpFHzJ1sSqu1oj1ymn7RKbuK1sDQ6jVBhLpbtZaQ0c9DU1pJcyzSm3vbGYnsz2
         rrjbY4yunsDTKdThCoELU4GG3TOR0ctacnmXG6GkSjuE2VaOEneMs+zVUd4AM+3egCbj
         oSfcmLwgkHtYjFheyuDv9yKo1A/ZnEyqYKQerQfWZ08foP9KcsQoFmqazqktwDjkyA9l
         8iSQ==
X-Gm-Message-State: AOAM532fs1IcUZYzqxGGkSxo203iGJqyf4dFo8zLtX8l6LMEcbRg4iUq
	B9jNzw6qhHoG/OwX7zdYusM=
X-Google-Smtp-Source: ABdhPJxT3nV21O8ewfKHSo+/v54T6KxtacyvyURGdHb3ZOw8IJ4BvfJmvnNUK0cUqVJ6d5CP0k5GGA==
X-Received: by 2002:a63:f10c:0:b0:382:623b:3bb9 with SMTP id f12-20020a63f10c000000b00382623b3bb9mr13433546pgi.97.1648011565675;
        Tue, 22 Mar 2022 21:59:25 -0700 (PDT)
Received: from localhost.localdomain ([157.49.70.34])
        by smtp.gmail.com with ESMTPSA id d23-20020a17090a02d700b001bf6ef9daafsm4323380pjd.38.2022.03.22.21.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 21:59:25 -0700 (PDT)
From: Sathish Kumar <skumark1902@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Sathish Kumar <skumark1902@gmail.com>
Subject: [PATCH v3] staging: rtl8712: Use completions for signaling
Date: Wed, 23 Mar 2022 10:25:15 +0530
Message-Id: <20220323045515.2513-1-skumark1902@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

r8712_sitesurvey_cmd() uses a variable to notify r8712_SetFilter() that it
has completed operation. There is no sort of assurance that the variable will
actually change and it could cache the value the first time it is read and
then never update it for the whole loop logic.

Use completion variables because they are better suited for the purpose.

This patch fixes the checkpatch.pl warnings like:
CHECK: Avoid CamelCase: <blnEnableRxFF0Filter>
+   u8 blnEnableRxFF0Filter;

Signed-off-by: Sathish Kumar <skumark1902@gmail.com>
---
Changes in v2:
  - Remove the "bln" prefix

Changes in v3:
  - Replace the variable used for signaling with completion
---
 drivers/staging/rtl8712/drv_types.h   | 3 +--
 drivers/staging/rtl8712/rtl871x_cmd.c | 2 +-
 drivers/staging/rtl8712/usb_intf.c    | 2 +-
 drivers/staging/rtl8712/xmit_linux.c  | 8 +-------
 4 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8712/drv_types.h b/drivers/staging/rtl8712/drv_types.h
index a44d04effc8b..76ac798642bd 100644
--- a/drivers/staging/rtl8712/drv_types.h
+++ b/drivers/staging/rtl8712/drv_types.h
@@ -157,12 +157,11 @@ struct _adapter {
 	struct iw_statistics iwstats;
 	int pid; /*process id from UI*/
 	struct work_struct wk_filter_rx_ff0;
-	u8 blnEnableRxFF0Filter;
-	spinlock_t lock_rx_ff0_filter;
 	const struct firmware *fw;
 	struct usb_interface *pusb_intf;
 	struct mutex mutex_start;
 	struct completion rtl8712_fw_ready;
+	struct completion rx_filter_ready;
 };
 
 static inline u8 *myid(struct eeprom_priv *peepriv)
diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
index acda930722b2..f5746020a1b7 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.c
+++ b/drivers/staging/rtl8712/rtl871x_cmd.c
@@ -202,7 +202,7 @@ u8 r8712_sitesurvey_cmd(struct _adapter *padapter,
 	mod_timer(&pmlmepriv->scan_to_timer,
 		  jiffies + msecs_to_jiffies(SCANNING_TIMEOUT));
 	padapter->ledpriv.LedControlHandler(padapter, LED_CTL_SITE_SURVEY);
-	padapter->blnEnableRxFF0Filter = 0;
+	complete(&padapter->rx_filter_ready);
 	return _SUCCESS;
 }
 
diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
index ee4c61f85a07..8df50e24f2b8 100644
--- a/drivers/staging/rtl8712/usb_intf.c
+++ b/drivers/staging/rtl8712/usb_intf.c
@@ -568,7 +568,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
 	/* step 6. Load the firmware asynchronously */
 	if (rtl871x_load_fw(padapter))
 		goto deinit_drv_sw;
-	spin_lock_init(&padapter->lock_rx_ff0_filter);
+	init_completion(&padapter->rx_filter_ready);
 	mutex_init(&padapter->mutex_start);
 	return 0;
 
diff --git a/drivers/staging/rtl8712/xmit_linux.c b/drivers/staging/rtl8712/xmit_linux.c
index 90d34cf9d2ff..4a93839bf947 100644
--- a/drivers/staging/rtl8712/xmit_linux.c
+++ b/drivers/staging/rtl8712/xmit_linux.c
@@ -95,18 +95,12 @@ void r8712_SetFilter(struct work_struct *work)
 	struct _adapter *adapter = container_of(work, struct _adapter,
 						wk_filter_rx_ff0);
 	u8  oldvalue = 0x00, newvalue = 0x00;
-	unsigned long irqL;
 
 	oldvalue = r8712_read8(adapter, 0x117);
 	newvalue = oldvalue & 0xfe;
 	r8712_write8(adapter, 0x117, newvalue);
 
-	spin_lock_irqsave(&adapter->lock_rx_ff0_filter, irqL);
-	adapter->blnEnableRxFF0Filter = 1;
-	spin_unlock_irqrestore(&adapter->lock_rx_ff0_filter, irqL);
-	do {
-		msleep(100);
-	} while (adapter->blnEnableRxFF0Filter == 1);
+	wait_for_completion(&adapter->rx_filter_ready);
 	r8712_write8(adapter, 0x117, oldvalue);
 }
 
-- 
2.17.1

