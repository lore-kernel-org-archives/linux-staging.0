Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDAD2CA1
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 20:01:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n10-20020a7bc5ca000000b00345c520d38eso13803335wmk.1
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 12:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q6ueGjhitt5AKVe2y1vecDo+aJ407Ip2YoygN2lvWow=;
        b=lUjJWRIwzuq9avYjFleZFvHqEKsyrzAZZA/KJA1+TgxIduC1PQ9L0mwv6Er8sOu+l4
         PVjWCLUs5p+QAlfZSvE+guw9VGRhIEeBvSpdPY8v6HpZ5+u/IqIfTINqnOOCCllnrqJ5
         4HtbpnG9VgVyLUdumUB/ttNJxoOejHYaYugPgozDclGRYeTJ3z6wNl52WwKy6QGKubmq
         xoi4k1liWeftVZ4Ns9b4IHbZnBsy5OJchinJx5KW+yg3zBWI0vQxXtAVBKztr62tlOmL
         p+PhxYCu9TnMNHz+xot0nVi4DDpbr9AzvbeD1Xi0FXvlkFESCtZhHiDumwusbk7+sJPQ
         2dRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q6ueGjhitt5AKVe2y1vecDo+aJ407Ip2YoygN2lvWow=;
        b=FiDhfV5qfR4JEaZT/MX8s2hOyWGQUitcXBOZYy7YyS3PqUKWzcL97G+dypJTjTuKOq
         04+ODa16zsz8RLWJMR+6NI/kEWRWPKmLsyWv+X1NV7nAfnHnzAUQNUcp/8fPpBZGKvJp
         FJthVfy1vcLXmrVBY2A3EyBnHaRKGSGZZiTkRdvJXdJlOAQR5M+6C6wAkeUFD/BmA7cy
         trJJXfNIO+7Oi/8sEuM2DCigKLX/Vc1ciF2WB0dv7xAJYun7gd7sNXb40cc5HcEWe5EQ
         WIht6jm6+6GeGpoSpi6E9AgzPM4ES8x6+99KKRYm5UAdRX0IPqXELrGHSaCk57OFQ043
         vTyA==
X-Gm-Message-State: AOAM5305rBXun4jRxfxACoEdxhTnj036pNVXRPDLOJwcpug2wl89QodJ
	ZPwSZoAjC4TY4mIHbV8Ago4=
X-Google-Smtp-Source: ABdhPJwYJCuNuWbv6IQMeQOBMXgAwgmi9/D3Vj51tik9Y3lsDE8f3KOAKoI5g1C7/KzHcd2ZQYtkiA==
X-Received: by 2002:a7b:c08e:: with SMTP id r14mr27058656wmh.68.1640894466941;
        Thu, 30 Dec 2021 12:01:06 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id o8sm29042286wry.20.2021.12.30.12.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 12:01:06 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/7] staging: r8188eu: UsbRxHighSpeedMode is set but never used
Date: Thu, 30 Dec 2021 21:00:54 +0100
Message-Id: <20211230200059.13406-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230200059.13406-1-straube.linux@gmail.com>
References: <20211230200059.13406-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field UsbRxHighSpeedMode of struct hal_data_8188e is set but
never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c      | 5 -----
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 3 ---
 2 files changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 104705ef170e..96db9a8e7667 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -502,16 +502,11 @@ usb_AggSettingRxUpdate(
 
 static void InitUsbAggregationSetting(struct adapter *Adapter)
 {
-	struct hal_data_8188e *haldata = &Adapter->haldata;
-
 	/*  Tx aggregation setting */
 	usb_AggSettingTxUpdate(Adapter);
 
 	/*  Rx aggregation setting */
 	usb_AggSettingRxUpdate(Adapter);
-
-	/*  201/12/10 MH Add for USB agg mode dynamic switch. */
-	haldata->UsbRxHighSpeedMode = false;
 }
 
 static void _InitOperationMode(struct adapter *Adapter)
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index e8cb093abb62..8b54f52f49e2 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -262,9 +262,6 @@ struct hal_data_8188e {
 	u8	OutEpQueueSel;
 	u8	OutEpNumber;
 
-	/*  Add for USB aggreation mode dynamic shceme. */
-	bool		UsbRxHighSpeedMode;
-
 	/*  2010/11/22 MH Add for slim combo debug mode selective. */
 	/*  This is used for fix the drawback of CU TSMC-A/UMC-A cut.
 	 * HW auto suspend ability. Close BT clock. */
-- 
2.34.1

