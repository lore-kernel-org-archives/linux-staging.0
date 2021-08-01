Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AEE3487
	for <linux-staging@lists.linux.dev>; Sun,  1 Aug 2021 19:04:51 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id j2so18743798wrx.9
        for <linux-staging@lists.linux.dev>; Sun, 01 Aug 2021 12:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+t9gqlVKrDTraoXV7VGWYthjJFTyNl4L9x3mtB9gmos=;
        b=lELHLRtzKQXHMFIAhglORI1T8m8jXyQAxTbEr1nSvpqJ76y9pVMR22oHYYORUksL+0
         Xk7AqIvTuuI6BY7j1EOhshYEDFnBOLhCF1m3Fx0hHqURrjzjBeGTDNbyJpdEvhxhes0D
         uhGaK3CaVz4rSlzxcZuHatU6h/OGDo00AqntNmzi5FXPPfEJ6frSi2I6dFcNSJpaJG9+
         wSgzFB63RzT/6oiq4jjHLe/dAPterzCwqJXB4jiKLmXMVdt4Xxx2CQVawY9RH+UQZRwr
         cASoUtTgCEWxedaOKJneHeVJ4pQvOYD3LmOB9Xc0PHIYGkXAWnjPNkyWetRSGMz+WUgd
         jC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+t9gqlVKrDTraoXV7VGWYthjJFTyNl4L9x3mtB9gmos=;
        b=RS00+SsggiWYDCof0/NR6hvlxx953vOaQtfZFNUiqSMFdcrwctRsceFi7Gp4vg1eCz
         tG/PRdas/Z+2GQ+pyleCHDw1tVkvMvZUIijqyPy+S3nzhUnGCNeS/PnS6VPGE4eytuoT
         CngfKVOWmE6DzC+ETZlVuPb5goMXZvzL2ODS84yr82/FraU6gvc0wR9Y6lk4oM5R9anc
         7XGIowfDSMcKOdpCbi+lUJj8/JJggdPKGP3rsF04Dog0eVI+MXg4vZ7Ocmd9FWSDW6Qn
         XeEWnFxuPDFoPuU/JPTDfGVkt2rtYyIPly+BSDimZhadX0dV0Y6RDa5XnW5tpZHwMurz
         UVfg==
X-Gm-Message-State: AOAM532eXnwCfxkoWoXSEb3akbhdpBHQZPeEbyPpgaHJ7fcWfzFXNx0X
	W4zPQa9v8lUZXRXG2z1xwPR5mQ==
X-Google-Smtp-Source: ABdhPJwewk/K0SZ4LWyAi3mpf9OY+cZNJ7x2SpIrTn9ez8G7INftn+QpJ3+X/J004EXpxn6fMwCcdA==
X-Received: by 2002:a5d:5484:: with SMTP id h4mr13911030wrv.20.1627844689789;
        Sun, 01 Aug 2021 12:04:49 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id c10sm8196026wmb.40.2021.08.01.12.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Aug 2021 12:04:49 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH 13/15] staging: r8188eu: remove RT_TRACE calls from core/rtw_led.c
Date: Sun,  1 Aug 2021 20:04:35 +0100
Message-Id: <20210801190437.82017-14-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801190437.82017-1-phil@philpotter.co.uk>
References: <20210801190437.82017-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro calls from core/rtw_led.c, so that ultimately the
macro definition itself can eventually be removed.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_led.c | 82 ++++----------------------
 1 file changed, 12 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 70e989d11e44..22d4df9c92a5 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -89,13 +89,10 @@ static void SwLedBlink(struct LED_871x *pLed)
 	u8 bStopBlinking = false;
 
 	/*  Change LED according to BlinkingLedState specified. */
-	if (pLed->BlinkingLedState == RTW_LED_ON) {
+	if (pLed->BlinkingLedState == RTW_LED_ON)
 		SwLedOn(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn on\n", pLed->BlinkTimes));
-	} else {
+	else
 		SwLedOff(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn off\n", pLed->BlinkTimes));
-	}
 
 	/*  Determine if we shall change LED state again. */
 	pLed->BlinkTimes--;
@@ -170,13 +167,10 @@ static void SwLedBlink1(struct LED_871x *pLed)
 	u8 bStopBlinking = false;
 
 	/*  Change LED according to BlinkingLedState specified. */
-	if (pLed->BlinkingLedState == RTW_LED_ON) {
+	if (pLed->BlinkingLedState == RTW_LED_ON)
 		SwLedOn(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn on\n", pLed->BlinkTimes));
-	} else {
+	else
 		SwLedOff(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn off\n", pLed->BlinkTimes));
-	}
 
 	if (padapter->pwrctrlpriv.rf_pwrstate != rf_on) {
 		SwLedOff(padapter, pLed);
@@ -212,7 +206,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 				else
 					pLed->BlinkingLedState = RTW_LED_ON;
 				_set_timer(&(pLed->BlinkTimer), LED_BLINK_LINK_INTERVAL_ALPHA);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
@@ -221,7 +214,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 				else
 					pLed->BlinkingLedState = RTW_LED_ON;
 				_set_timer(&(pLed->BlinkTimer), LED_BLINK_NO_LINK_INTERVAL_ALPHA);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->bLedScanBlinkInProgress = false;
 		} else {
@@ -245,7 +237,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 				else
 					pLed->BlinkingLedState = RTW_LED_ON;
 				_set_timer(&(pLed->BlinkTimer), LED_BLINK_LINK_INTERVAL_ALPHA);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
@@ -254,7 +245,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 				else
 					pLed->BlinkingLedState = RTW_LED_ON;
 				_set_timer(&(pLed->BlinkTimer), LED_BLINK_NO_LINK_INTERVAL_ALPHA);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->BlinkTimes = 0;
 			pLed->bLedBlinkInProgress = false;
@@ -287,7 +277,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 			else
 				pLed->BlinkingLedState = RTW_LED_ON;
 			_set_timer(&(pLed->BlinkTimer), LED_BLINK_LINK_INTERVAL_ALPHA);
-			RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 
 			pLed->bLedWPSBlinkInProgress = false;
 		} else {
@@ -307,13 +296,10 @@ static void SwLedBlink2(struct LED_871x *pLed)
 	u8 bStopBlinking = false;
 
 	/*  Change LED according to BlinkingLedState specified. */
-	if (pLed->BlinkingLedState == RTW_LED_ON) {
+	if (pLed->BlinkingLedState == RTW_LED_ON)
 		SwLedOn(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn on\n", pLed->BlinkTimes));
-	} else {
+	else
 		SwLedOff(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn off\n", pLed->BlinkTimes));
-	}
 
 	switch (pLed->CurrLedState) {
 	case LED_BLINK_SCAN:
@@ -327,13 +313,10 @@ static void SwLedBlink2(struct LED_871x *pLed)
 				pLed->CurrLedState = RTW_LED_ON;
 				pLed->BlinkingLedState = RTW_LED_ON;
 				SwLedOn(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("stop scan blink CurrLedState %d\n", pLed->CurrLedState));
-
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->CurrLedState = RTW_LED_OFF;
 				pLed->BlinkingLedState = RTW_LED_OFF;
 				SwLedOff(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("stop scan blink CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->bLedScanBlinkInProgress = false;
 		} else {
@@ -359,12 +342,10 @@ static void SwLedBlink2(struct LED_871x *pLed)
 				pLed->CurrLedState = RTW_LED_ON;
 				pLed->BlinkingLedState = RTW_LED_ON;
 				SwLedOn(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("stop CurrLedState %d\n", pLed->CurrLedState));
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->CurrLedState = RTW_LED_OFF;
 				pLed->BlinkingLedState = RTW_LED_OFF;
 				SwLedOff(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("stop CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->bLedBlinkInProgress = false;
 		} else {
@@ -393,11 +374,9 @@ static void SwLedBlink3(struct LED_871x *pLed)
 	/*  Change LED according to BlinkingLedState specified. */
 	if (pLed->BlinkingLedState == RTW_LED_ON) {
 		SwLedOn(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn on\n", pLed->BlinkTimes));
 	} else {
 		if (pLed->CurrLedState != LED_BLINK_WPS_STOP)
 			SwLedOff(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn off\n", pLed->BlinkTimes));
 	}
 
 	switch (pLed->CurrLedState) {
@@ -413,13 +392,11 @@ static void SwLedBlink3(struct LED_871x *pLed)
 				pLed->BlinkingLedState = RTW_LED_ON;
 				if (!pLed->bLedOn)
 					SwLedOn(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->CurrLedState = RTW_LED_OFF;
 				pLed->BlinkingLedState = RTW_LED_OFF;
 				if (pLed->bLedOn)
 					SwLedOff(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->bLedScanBlinkInProgress = false;
 		} else {
@@ -446,14 +423,12 @@ static void SwLedBlink3(struct LED_871x *pLed)
 				pLed->BlinkingLedState = RTW_LED_ON;
 				if (!pLed->bLedOn)
 					SwLedOn(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->CurrLedState = RTW_LED_OFF;
 				pLed->BlinkingLedState = RTW_LED_OFF;
 
 				if (pLed->bLedOn)
 					SwLedOff(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->bLedBlinkInProgress = false;
 		} else {
@@ -490,7 +465,6 @@ static void SwLedBlink3(struct LED_871x *pLed)
 				pLed->CurrLedState = RTW_LED_ON;
 				pLed->BlinkingLedState = RTW_LED_ON;
 				SwLedOn(padapter, pLed);
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->bLedWPSBlinkInProgress = false;
 		}
@@ -508,13 +482,10 @@ static void SwLedBlink4(struct LED_871x *pLed)
 	u8 bStopBlinking = false;
 
 	/*  Change LED according to BlinkingLedState specified. */
-	if (pLed->BlinkingLedState == RTW_LED_ON) {
+	if (pLed->BlinkingLedState == RTW_LED_ON)
 		SwLedOn(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn on\n", pLed->BlinkTimes));
-	} else {
+	else
 		SwLedOff(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn off\n", pLed->BlinkTimes));
-	}
 
 	if (!pLed1->bLedWPSBlinkInProgress && pLed1->BlinkingLedState == LED_UNKNOWN) {
 		pLed1->BlinkingLedState = RTW_LED_OFF;
@@ -639,7 +610,6 @@ static void SwLedBlink4(struct LED_871x *pLed)
 	default:
 		break;
 	}
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("SwLedBlink4 CurrLedState %d\n", pLed->CurrLedState));
 }
 
 static void SwLedBlink5(struct LED_871x *pLed)
@@ -648,13 +618,10 @@ static void SwLedBlink5(struct LED_871x *pLed)
 	u8 bStopBlinking = false;
 
 	/*  Change LED according to BlinkingLedState specified. */
-	if (pLed->BlinkingLedState == RTW_LED_ON) {
+	if (pLed->BlinkingLedState == RTW_LED_ON)
 		SwLedOn(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn on\n", pLed->BlinkTimes));
-	} else {
+	else
 		SwLedOff(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn off\n", pLed->BlinkTimes));
-	}
 
 	switch (pLed->CurrLedState) {
 	case LED_BLINK_SCAN:
@@ -723,8 +690,6 @@ static void SwLedBlink5(struct LED_871x *pLed)
 	default:
 		break;
 	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("SwLedBlink5 CurrLedState %d\n", pLed->CurrLedState));
 }
 
 static void SwLedBlink6(struct LED_871x *pLed)
@@ -732,15 +697,10 @@ static void SwLedBlink6(struct LED_871x *pLed)
 	struct adapter *padapter = pLed->padapter;
 
 	/*  Change LED according to BlinkingLedState specified. */
-	if (pLed->BlinkingLedState == RTW_LED_ON) {
+	if (pLed->BlinkingLedState == RTW_LED_ON)
 		SwLedOn(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn on\n", pLed->BlinkTimes));
-	} else {
+	else
 		SwLedOff(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Blinktimes (%d): turn off\n", pLed->BlinkTimes));
-	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("<==== blink6\n"));
 }
 
  /* ALPHA, added by chiyoko, 20090106 */
@@ -946,8 +906,6 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 	default:
 		break;
 	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Led %d\n", pLed->CurrLedState));
 }
 
  /* Arcadyan/Sitecom , added by chiyoko, 20090216 */
@@ -1031,7 +989,6 @@ static void SwLedControlMode2(struct adapter *padapter, enum LED_CTL_MODE LedAct
 			pLed->CurrLedState = RTW_LED_ON;
 			pLed->BlinkingLedState = RTW_LED_ON;
 			_set_timer(&(pLed->BlinkTimer), 0);
-			RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 		}
 		break;
 	case LED_CTL_STOP_WPS_FAIL:
@@ -1042,7 +999,6 @@ static void SwLedControlMode2(struct adapter *padapter, enum LED_CTL_MODE LedAct
 			pLed->CurrLedState = RTW_LED_OFF;
 			pLed->BlinkingLedState = RTW_LED_OFF;
 			_set_timer(&(pLed->BlinkTimer), 0);
-			RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 		}
 		break;
 	case LED_CTL_START_TO_LINK:
@@ -1074,8 +1030,6 @@ static void SwLedControlMode2(struct adapter *padapter, enum LED_CTL_MODE LedAct
 	default:
 		break;
 	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 }
 
   /* COREGA, added by chiyoko, 20090316 */
@@ -1212,8 +1166,6 @@ static void SwLedControlMode2(struct adapter *padapter, enum LED_CTL_MODE LedAct
 	default:
 		break;
 	}
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_,
-		 ("CurrLedState %d\n", pLed->CurrLedState));
 }
 
  /* Edimax-Belkin, added by chiyoko, 20090413 */
@@ -1478,8 +1430,6 @@ static void SwLedControlMode4(struct adapter *padapter, enum LED_CTL_MODE LedAct
 	default:
 		break;
 	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Led %d\n", pLed->CurrLedState));
 }
 
  /* Sercomm-Belkin, added by chiyoko, 20090415 */
@@ -1547,8 +1497,6 @@ SwLedControlMode5(
 	default:
 		break;
 	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("Led %d\n", pLed->CurrLedState));
 }
 
  /* WNC-Corega, added by chiyoko, 20090902 */
@@ -1576,8 +1524,6 @@ SwLedControlMode6(
 	default:
 		break;
 	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("ledcontrol 6 Led %d\n", pLed0->CurrLedState));
 }
 
 /*  */
@@ -1669,8 +1615,4 @@ void LedControl8188eu(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	default:
 		break;
 	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_,
-		 ("LedStrategy:%d, LedAction %d\n",
-		 ledpriv->LedStrategy, LedAction));
 }
-- 
2.31.1

