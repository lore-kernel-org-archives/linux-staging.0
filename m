Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944DA2FB2
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:16 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id e3so6304871qte.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7mHiKXTuV+++A5Z6xMEOomC7XBF+hxxIRo65FkhdTsc=;
        b=oMx8KOSqzKepkiXYRYwCgnibUQZCYCk1LbGEHiYxfNeVHQ0VOomw6rDsLVS9VI/NZZ
         vXPSFkZu4sm8mqlOzofDdd8CnVBtHAJgbc7EL9mB0Mvm3BJrCnYy3eeNch6wA+2tQOcx
         iirtpHN5Zyh4VdjNQwwkSX0+2aIpuZdrdBbQvxoq/2PKGStAYfh4xix6QdLMZsTe/gHC
         4KhBPWwKH5uzN2UCC8hE774kJG1ddhLeBwPHyh9HpfV+co+tE0FvV7YTlFAgmTBeeOIG
         YgaGCL+UE6vrrQ7oqlIXTqdzGkQYOoZ3xoAYV1kjDybQb0WWzOPNZgqUMlOezl4Jddcs
         xYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7mHiKXTuV+++A5Z6xMEOomC7XBF+hxxIRo65FkhdTsc=;
        b=U0dBNtT0o7AV4V8Y4v9jete0J4DP0HA6Swnt9lvEEp8OkhX9yoYCLBhdWqhcq3gzse
         n9wKBHaez6vVCejVjiCB3RO4WnSX3/NTCLNOqcGQaKcgIgQ+QqtOlB44/6NFmuwM2nUl
         TC6WlBFyylkXy8dvCX/fIgrOCWtq2T1lSW6Q5KtmkfL7p6FsLB3Rw7zIME58fy2Ch5Nc
         clDluMzSuiSRAE8Ry6h+f5gQFF80TJr7+mK/nvNVakK/0u6klS4wXQBdXXeC801Vpuvy
         w9sK+IChGZ+Nf93R9inesnu1bWdRI7PwgrGwTyeZurS1/rCl9hhJ16E/hIFwcghLP7Nc
         4rMw==
X-Gm-Message-State: AOAM532A8iXYv1uuK4CQvWYT2YARJQhA6QK+BM8TzFVa3SjuUaRqlV6a
	dTgUzLkvmReZVWSnWweCm9xdhg==
X-Google-Smtp-Source: ABdhPJyyrsE8BgKUHH7KrO3ltVxHwtLE1hNQnwPRiEjJaYx6qDqCxpmWVrihSFMRTQtNZ/M19wESVA==
X-Received: by 2002:ac8:5550:: with SMTP id o16mr7123704qtr.387.1624579695746;
        Thu, 24 Jun 2021 17:08:15 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:15 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 10/23] staging: rtl8188eu: remove all RT_TRACE calls from core/rtw_led.c
Date: Fri, 25 Jun 2021 01:07:43 +0100
Message-Id: <20210625000756.6313-11-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all RT_TRACE calls from core/rtw_led.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_led.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_led.c b/drivers/staging/rtl8188eu/core/rtw_led.c
index 7bf05bbfbe69..be868f386204 100644
--- a/drivers/staging/rtl8188eu/core/rtw_led.c
+++ b/drivers/staging/rtl8188eu/core/rtw_led.c
@@ -92,15 +92,10 @@ static void SwLedBlink1(struct LED_871x *pLed)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	/*  Change LED according to BlinkingLedState specified. */
-	if (pLed->BlinkingLedState == RTW_LED_ON) {
+	if (pLed->BlinkingLedState == RTW_LED_ON)
 		sw_led_on(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_,
-			 ("Blinktimes (%d): turn on\n", pLed->BlinkTimes));
-	} else {
+	else
 		sw_led_off(padapter, pLed);
-		RT_TRACE(_module_rtl8712_led_c_, _drv_info_,
-			 ("Blinktimes (%d): turn off\n", pLed->BlinkTimes));
-	}
 
 	if (padapter->pwrctrlpriv.rf_pwrstate != rf_on) {
 		sw_led_off(padapter, pLed);
@@ -137,7 +132,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 					pLed->BlinkingLedState = RTW_LED_ON;
 				mod_timer(&pLed->BlinkTimer, jiffies +
 					  msecs_to_jiffies(LED_BLINK_LINK_INTERVAL_ALPHA));
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
@@ -147,7 +141,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 					pLed->BlinkingLedState = RTW_LED_ON;
 				mod_timer(&pLed->BlinkTimer, jiffies +
 					  msecs_to_jiffies(LED_BLINK_NO_LINK_INTERVAL_ALPHA));
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->bLedScanBlinkInProgress = false;
 		} else {
@@ -171,7 +164,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 					pLed->BlinkingLedState = RTW_LED_ON;
 				mod_timer(&pLed->BlinkTimer, jiffies +
 					  msecs_to_jiffies(LED_BLINK_LINK_INTERVAL_ALPHA));
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			} else if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				pLed->bLedNoLinkBlinkInProgress = true;
 				pLed->CurrLedState = LED_BLINK_SLOWLY;
@@ -181,7 +173,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 					pLed->BlinkingLedState = RTW_LED_ON;
 				mod_timer(&pLed->BlinkTimer, jiffies +
 					  msecs_to_jiffies(LED_BLINK_NO_LINK_INTERVAL_ALPHA));
-				RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 			}
 			pLed->bLedBlinkInProgress = false;
 		} else {
@@ -211,7 +202,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 				pLed->BlinkingLedState = RTW_LED_ON;
 			mod_timer(&pLed->BlinkTimer, jiffies +
 				  msecs_to_jiffies(LED_BLINK_LINK_INTERVAL_ALPHA));
-			RT_TRACE(_module_rtl8712_led_c_, _drv_info_, ("CurrLedState %d\n", pLed->CurrLedState));
 
 			pLed->bLedWPSBlinkInProgress = false;
 		} else {
@@ -439,9 +429,6 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 	default:
 		break;
 	}
-
-	RT_TRACE(_module_rtl8712_led_c_, _drv_info_,
-		 ("Led %d\n", pLed->CurrLedState));
 }
 
 void blink_handler(struct LED_871x *pLed)
-- 
2.31.1

