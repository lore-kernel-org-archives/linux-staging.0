Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB02FB0
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 10:30:21 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id u21so4810234ejo.13
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fjr9rOU6dVRvidJxKR3mVqsQOmmdyFjnEldzmOUV3qw=;
        b=P2jrTxEYJmgbrZQs6607+heDUAJ7pzqrLXLzdF/1qlbOtY7iyCrMGTM9109rZYh9Lg
         58MBukCWgMcxv6n2vngmKu62Qngs9/6Fj2rShlQdYdEfIayZD5odXOIZQN+0nZN3r9ov
         M/GvkNGQ3yeYRwIQrw99Rh/98+45yW6+9n1K3TvAFt234kPBJrEpXSDZ+tbKD6xmEYlr
         tHIo0YRcGHfsXokpfJvmA1kjgzKp6DVcdnkmHwjAwt2FqjTAaFhBTkzO+/SFP+S9p2G4
         XeqQFIj+YSUmi+7dkxSKyPQU6e8cvSfNE1PvKIrNWn83bdrTTybNwAk5gRiWcjmJPW6X
         KWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Fjr9rOU6dVRvidJxKR3mVqsQOmmdyFjnEldzmOUV3qw=;
        b=qySGuEMAaieXc3Rebgtx44rRH78HEFElHL+Ne4f48aC0Hnk3Mt34l8XtXvcxY6jj45
         ZEjoCZAOY7CHmB8zcT2RotoztzqNl8N6wabouJApnzT9cxY3t/Cb6dFLGdBpUu6qnbc8
         RjMahxZMrIHJmdsNZVd8BRHmw8haQ5shlq6PfNg8ay84dLG6cnnOTpx2NgfQ04kK3rwa
         YFrq3qeqhpE6WEm4mDg0N5EqlEJSEgwijsM3qBCpLUBGHV7e/erJlQhsZt49fYcR0bLo
         sqLNl5szD9slLltpfIE24DeNwPtqzwbKhsqEoBbWfuGH5dCtKPjYtPBrqnCuDnaVq788
         eECA==
X-Gm-Message-State: AOAM532Pk1a67+0Pr00+tV2ztQuPfU0Jt1vCclHQ2SlMaj+Wsh6Qso/c
	bQsazhjg3V9rPoC8GjAjzEk=
X-Google-Smtp-Source: ABdhPJwBxRrEBgGwdhcwGbSIS3pkz8TKVwQAol/6vRyJnqKz5wQVP2Yh4whoh9gg1+VQsWlIntN+5A==
X-Received: by 2002:a17:906:5211:: with SMTP id g17mr29028330ejm.281.1621161019842;
        Sun, 16 May 2021 03:30:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::59f8])
        by smtp.gmail.com with ESMTPSA id d15sm8737531edu.86.2021.05.16.03.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 03:30:19 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8188eu: rename struct field bLedOn
Date: Sun, 16 May 2021 12:30:09 +0200
Message-Id: <20210516103009.7184-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename field bLedOn of struct LED_871x to avoid camel case.
bLedOn -> led_on

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8188eu/core/rtw_led.c      | 36 +++++++++----------
 drivers/staging/rtl8188eu/hal/rtl8188eu_led.c |  4 +--
 drivers/staging/rtl8188eu/include/rtw_led.h   |  2 +-
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_led.c b/drivers/staging/rtl8188eu/core/rtw_led.c
index 32dccae186ca..7bf05bbfbe69 100644
--- a/drivers/staging/rtl8188eu/core/rtw_led.c
+++ b/drivers/staging/rtl8188eu/core/rtw_led.c
@@ -43,7 +43,7 @@ void BlinkWorkItemCallback(struct work_struct *work)
 void ResetLedStatus(struct LED_871x *pLed)
 {
 	pLed->CurrLedState = RTW_LED_OFF; /*  Current LED state. */
-	pLed->bLedOn = false; /*  true if LED is ON, false if LED is OFF. */
+	pLed->led_on = false; /*  true if LED is ON, false if LED is OFF. */
 
 	pLed->bLedBlinkInProgress = false; /*  true if it is blinking, false o.w.. */
 	pLed->bLedWPSBlinkInProgress = false;
@@ -110,7 +110,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 
 	switch (pLed->CurrLedState) {
 	case LED_BLINK_SLOWLY:
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
@@ -118,7 +118,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 			  msecs_to_jiffies(LED_BLINK_NO_LINK_INTERVAL_ALPHA));
 		break;
 	case LED_BLINK_NORMAL:
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
@@ -131,7 +131,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_NORMAL;
-				if (pLed->bLedOn)
+				if (pLed->led_on)
 					pLed->BlinkingLedState = RTW_LED_OFF;
 				else
 					pLed->BlinkingLedState = RTW_LED_ON;
@@ -141,7 +141,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
-				if (pLed->bLedOn)
+				if (pLed->led_on)
 					pLed->BlinkingLedState = RTW_LED_OFF;
 				else
 					pLed->BlinkingLedState = RTW_LED_ON;
@@ -151,7 +151,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 			}
 			pLed->bLedScanBlinkInProgress = false;
 		} else {
-			if (pLed->bLedOn)
+			if (pLed->led_on)
 				pLed->BlinkingLedState = RTW_LED_OFF;
 			else
 				pLed->BlinkingLedState = RTW_LED_ON;
@@ -165,7 +165,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_NORMAL;
-				if (pLed->bLedOn)
+				if (pLed->led_on)
 					pLed->BlinkingLedState = RTW_LED_OFF;
 				else
 					pLed->BlinkingLedState = RTW_LED_ON;
@@ -175,7 +175,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
-				if (pLed->bLedOn)
+				if (pLed->led_on)
 					pLed->BlinkingLedState = RTW_LED_OFF;
 				else
 					pLed->BlinkingLedState = RTW_LED_ON;
@@ -185,7 +185,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 			}
 			pLed->bLedBlinkInProgress = false;
 		} else {
-			if (pLed->bLedOn)
+			if (pLed->led_on)
 				pLed->BlinkingLedState = RTW_LED_OFF;
 			else
 				pLed->BlinkingLedState = RTW_LED_ON;
@@ -194,7 +194,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 		}
 		break;
 	case LED_BLINK_WPS:
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
@@ -205,7 +205,7 @@ static void SwLedBlink1(struct LED_871x *pLed)
 		if (pLed->BlinkingLedState != RTW_LED_ON) {
 			pLed->bLedLinkBlinkInProgress = true;
 			pLed->CurrLedState = LED_BLINK_NORMAL;
-			if (pLed->bLedOn)
+			if (pLed->led_on)
 				pLed->BlinkingLedState = RTW_LED_OFF;
 			else
 				pLed->BlinkingLedState = RTW_LED_ON;
@@ -251,7 +251,7 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 		}
 		pLed->bLedNoLinkBlinkInProgress = true;
 		pLed->CurrLedState = LED_BLINK_SLOWLY;
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
@@ -274,7 +274,7 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 		}
 		pLed->bLedLinkBlinkInProgress = true;
 		pLed->CurrLedState = LED_BLINK_NORMAL;
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
@@ -304,7 +304,7 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 		pLed->bLedScanBlinkInProgress = true;
 		pLed->CurrLedState = LED_BLINK_SCAN;
 		pLed->BlinkTimes = 24;
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
@@ -329,7 +329,7 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 		pLed->bLedBlinkInProgress = true;
 		pLed->CurrLedState = LED_BLINK_TXRX;
 		pLed->BlinkTimes = 2;
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
@@ -358,7 +358,7 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 		}
 		pLed->bLedWPSBlinkInProgress = true;
 		pLed->CurrLedState = LED_BLINK_WPS;
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
@@ -387,7 +387,7 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 		else
 			pLed->bLedWPSBlinkInProgress = true;
 		pLed->CurrLedState = LED_BLINK_WPS_STOP;
-		if (pLed->bLedOn) {
+		if (pLed->led_on) {
 			pLed->BlinkingLedState = RTW_LED_OFF;
 			mod_timer(&pLed->BlinkTimer, jiffies +
 				  msecs_to_jiffies(LED_BLINK_WPS_SUCCESS_INTERVAL_ALPHA));
@@ -404,7 +404,7 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 		}
 		pLed->bLedNoLinkBlinkInProgress = true;
 		pLed->CurrLedState = LED_BLINK_SLOWLY;
-		if (pLed->bLedOn)
+		if (pLed->led_on)
 			pLed->BlinkingLedState = RTW_LED_OFF;
 		else
 			pLed->BlinkingLedState = RTW_LED_ON;
diff --git a/drivers/staging/rtl8188eu/hal/rtl8188eu_led.c b/drivers/staging/rtl8188eu/hal/rtl8188eu_led.c
index 35806b27fdee..25ce6db3beae 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188eu_led.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188eu_led.c
@@ -18,7 +18,7 @@ void sw_led_on(struct adapter *padapter, struct LED_871x *pLed)
 		return;
 	led_cfg = usb_read8(padapter, REG_LEDCFG2);
 	usb_write8(padapter, REG_LEDCFG2, (led_cfg & 0xf0) | BIT(5) | BIT(6));
-	pLed->bLedOn = true;
+	pLed->led_on = true;
 }
 
 void sw_led_off(struct adapter *padapter, struct LED_871x *pLed)
@@ -37,7 +37,7 @@ void sw_led_off(struct adapter *padapter, struct LED_871x *pLed)
 	led_cfg &= 0xFE;
 	usb_write8(padapter, REG_MAC_PINMUX_CFG, led_cfg);
 exit:
-	pLed->bLedOn = false;
+	pLed->led_on = false;
 }
 
 void rtw_hal_sw_led_init(struct adapter *padapter)
diff --git a/drivers/staging/rtl8188eu/include/rtw_led.h b/drivers/staging/rtl8188eu/include/rtw_led.h
index ee62ed76a465..5f65c3e1e46f 100644
--- a/drivers/staging/rtl8188eu/include/rtw_led.h
+++ b/drivers/staging/rtl8188eu/include/rtw_led.h
@@ -52,7 +52,7 @@ struct LED_871x {
 						   * either RTW_LED_ON or RTW_LED_OFF are.
 						   */
 
-	u8 bLedOn; /*  true if LED is ON, false if LED is OFF. */
+	u8 led_on; /*  true if LED is ON, false if LED is OFF. */
 
 	u8 bLedBlinkInProgress; /*  true if it is blinking, false o.w.. */
 
-- 
2.31.1

