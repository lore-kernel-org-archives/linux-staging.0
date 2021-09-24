Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E443FC8
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 20:49:33 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id i24so15111197wrc.9
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 13:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ggSSluSfCP353WDDv81czvciokxy86FRslxnjZPG5F0=;
        b=nmHiMwRvRivsWqFb6thAnlq3nhtw2q2lj8MvalzhAdgJevAwnN8Anl3D5nrBw+xwtP
         wzh9YMPTFEsfj3kVEaj84IUl+33zQDEAhz7tI0e/WyKKZwOVBS2nhT6k9njUNFQQeMgl
         uspiy9Cu3TC9PGOqRtiLuigHAPlNHk0kHea0dOxEgKBjyNCcMtEC5jilmF1sHLP2zkVt
         fd9dnWlDIYSFc40W5m7yhztQdTKiLonggrtqY4RlQs2N/9iiyUl1Gu8FPalXGSTEsc5+
         g7ZDWzXdCGFShKQg+herjKqLRLC3MqDnJQ+MzhM6EwT0YuJY/YHrbSUXJZtFV/yZyrrt
         RDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggSSluSfCP353WDDv81czvciokxy86FRslxnjZPG5F0=;
        b=M+0AfYYTNeNBverj1++Jw0KYfjVz1WwCuOukSoE8rucLWDEzVd3fTjFDO3WC1mTt/1
         8cEDahjNkmdf+nDiaYMVA3Gie1Z+vxGS7zDVkYMKzYrS8GGpjs8omz4GHcxjOyWcpkyf
         1Jlnk7whss7OfIZ3f6SUZ0DMYX7AS1a7+E0Wj7S5H44Giq3R9aF9i3ngOFcUUQBOXdD9
         bkqtSsYfrVVuYeTMcp0mwzcaL/X7L0nbOsBuY2E4ZIGzc9/qJ2+vJFLK5DR9xuUv0SCZ
         XNoLAFljOQIObCO/Ge1+8uyq1Dg7i0006+f9GmEYJJXCBD3CRjMy4Ov8nzAzn7TqFMWt
         qBCw==
X-Gm-Message-State: AOAM532MXgvVLgdxj/vctAc+Y4SaJxjzviulprWHnQpzgOvPDFmC/okV
	zOygOOr5ycLyaWnRr9WPUs8=
X-Google-Smtp-Source: ABdhPJxuNcaMGHAn6UOkJbB1ueoKNRMsFdj9QoOV6MEyndGV+miwWu8o9dfkCti1V5VV5702MiToPg==
X-Received: by 2002:a7b:cf0b:: with SMTP id l11mr4022134wmg.176.1632516571798;
        Fri, 24 Sep 2021 13:49:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51da])
        by smtp.gmail.com with ESMTPSA id j19sm9040292wra.92.2021.09.24.13.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 13:49:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/5] staging: r8188eu: remove unnecessary comments
Date: Fri, 24 Sep 2021 22:49:15 +0200
Message-Id: <20210924204917.6313-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210924204917.6313-1-straube.linux@gmail.com>
References: <20210924204917.6313-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function names in rtw_led.c are self-explanatory. Remove
unnecessary comments.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_led.c | 21 ---------------------
 1 file changed, 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index da02cd4fdc52..09d8c4e85863 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -4,11 +4,6 @@
 #include "../include/drv_types.h"
 #include "../include/rtw_led.h"
 
-/*  */
-/*	Description: */
-/*		Callback function of LED BlinkTimer, */
-/*		it just schedules to corresponding BlinkWorkItem/led_blink_hdl */
-/*  */
 void BlinkTimerCallback(struct timer_list *t)
 {
 	struct LED_871x *pLed = from_timer(pLed, t, BlinkTimer);
@@ -20,21 +15,12 @@ void BlinkTimerCallback(struct timer_list *t)
 	_set_workitem(&pLed->BlinkWorkItem);
 }
 
-/*  */
-/*	Description: */
-/*		Callback function of LED BlinkWorkItem. */
-/*		We dispatch acture LED blink action according to LedStrategy. */
-/*  */
 void BlinkWorkItemCallback(struct work_struct *work)
 {
 	struct LED_871x *pLed = container_of(work, struct LED_871x, BlinkWorkItem);
 	BlinkHandler(pLed);
 }
 
-/*  */
-/*	Description: */
-/*		Reset status of LED_871x object. */
-/*  */
 void ResetLedStatus(struct LED_871x *pLed)
 {
 	pLed->CurrLedState = RTW_LED_OFF; /*  Current LED state. */
@@ -52,8 +38,6 @@ void ResetLedStatus(struct LED_871x *pLed)
 	pLed->bLedScanBlinkInProgress = false;
 }
 
-/*Description: */
-/*		Initialize an LED_871x object. */
 void InitLed871x(struct adapter *padapter, struct LED_871x *pLed, enum LED_PIN_871x LedPin)
 {
 	pLed->padapter = padapter;
@@ -65,10 +49,6 @@ void InitLed871x(struct adapter *padapter, struct LED_871x *pLed, enum LED_PIN_8
 	_init_workitem(&pLed->BlinkWorkItem, BlinkWorkItemCallback, pLed);
 }
 
-/*  */
-/*	Description: */
-/*		DeInitialize an LED_871x object. */
-/*  */
 void DeInitLed871x(struct LED_871x *pLed)
 {
 	_cancel_workitem_sync(&pLed->BlinkWorkItem);
@@ -205,7 +185,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 	}
 }
 
- /* ALPHA, added by chiyoko, 20090106 */
 static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 {
 	struct led_priv *ledpriv = &padapter->ledpriv;
-- 
2.33.0

