Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D733B2FB3
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 20:49:32 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c21so1369231wrb.13
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 13:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yseh3aL4iELffyvGVKgbIKn2Vt+XfL/M8AzO1+7N50I=;
        b=aVGFueIaWmc9cqmMg8a4GybZ4/5nVn3AFaqjcAXK5wn9uECK331WuXK9FXIkXFm/YO
         qlXgtqr+oCMwIyAIbX0VweF76yeIHXw4dT/mmw5wE1covcpWwHv51drmiI6oXwL15dqu
         HwzuEHkuuMIGb3EiohFyyEna5I/XAn+/dR9xHxN2z9kZZSgmCwOYBI4r9Auj8cTJq+I3
         m7EVJvamVGT/mRlGmwhDJ1RP4tell9uXTiwomM0BQDaYtTdiZKiu8Sz8V5Kr9objVn3B
         mKyU5ssTZ+/BQpfCEdfsiLFMuumoR14UwzMpue75IuZkVC9J7TXWqAbkiQyWV+RWsUMs
         lmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yseh3aL4iELffyvGVKgbIKn2Vt+XfL/M8AzO1+7N50I=;
        b=WUJBNcCTS8Qan8sqB5mr9MjEHps5Ev311Uf+pvVNi/clwwZzQm1fi3qouKhWRSZ0Ge
         ban6gjVtBCXDw4YzX3LlYaTPWamdAV8Ret3zmM5Qm6Jk+q6Yi02/s0EDXrrsaoudFh4s
         xS16rlzywsVtwi4FTV0+NuXh1gKNYNOM5LfybkjI/gs7pBXYCAKiDXbzf8QN5s++VBFW
         WEeuOdC9ykTdR9iO7Db8ogAG9wzrWnFrf8o1ltOfjFph7P5WrnI6pXjYZXUIEFogToPx
         YZbXNBjuCePa5722nAtZ8wuTCTHVjYm1OQ7clq9tDPumkQHOLkhctWJ2135MNrM4Py1V
         aTJA==
X-Gm-Message-State: AOAM5317vHGfbHUuIxX7sU1xo+yDc/n34QcDUU4UGVsssw/nKAEUXZOH
	QOvMbBY6XFoK9X+NNcWUrRM=
X-Google-Smtp-Source: ABdhPJz5Cz6T+6PAD3f5JE0oTjNFmKtAURQav4M6BNC3SIelGxEPGrAI3u6gX+3zUf2iOmB8Xs5McA==
X-Received: by 2002:a1c:a911:: with SMTP id s17mr3922067wme.84.1632516571071;
        Fri, 24 Sep 2021 13:49:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51da])
        by smtp.gmail.com with ESMTPSA id j19sm9040292wra.92.2021.09.24.13.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 13:49:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: remove dead led control functions
Date: Fri, 24 Sep 2021 22:49:14 +0200
Message-Id: <20210924204917.6313-3-straube.linux@gmail.com>
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

LedStrategy is SW_LED_MODE1 in this driver. Remove led control
functions that are not used for SW_LED_MODE1.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_led.c | 643 +------------------------
 1 file changed, 1 insertion(+), 642 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 49324e9789b9..da02cd4fdc52 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -410,624 +410,6 @@ static void SwLedControlMode1(struct adapter *padapter, enum LED_CTL_MODE LedAct
 	}
 }
 
- /* Arcadyan/Sitecom , added by chiyoko, 20090216 */
-static void SwLedControlMode2(struct adapter *padapter, enum LED_CTL_MODE LedAction)
-{
-	struct led_priv *ledpriv = &padapter->ledpriv;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct LED_871x *pLed = &ledpriv->SwLed0;
-
-	switch (LedAction) {
-	case LED_CTL_SITE_SURVEY:
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic) {
-		} else if (!pLed->bLedScanBlinkInProgress) {
-			if (IS_LED_WPS_BLINKING(pLed))
-				return;
-
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-			pLed->bLedScanBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_SCAN;
-			pLed->BlinkTimes = 24;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_SCAN_INTERVAL_ALPHA);
-		 }
-		break;
-	case LED_CTL_TX:
-	case LED_CTL_RX:
-		if ((!pLed->bLedBlinkInProgress) && (check_fwstate(pmlmepriv, _FW_LINKED))) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
-				return;
-			pLed->bLedBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_TXRX;
-			pLed->BlinkTimes = 2;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_FASTER_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_LINK:
-		pLed->CurrLedState = RTW_LED_ON;
-		pLed->BlinkingLedState = RTW_LED_ON;
-		if (pLed->bLedBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedBlinkInProgress = false;
-		}
-		if (pLed->bLedScanBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedScanBlinkInProgress = false;
-		}
-		_set_timer(&pLed->BlinkTimer, 0);
-		break;
-	case LED_CTL_START_WPS: /* wait until xinpin finish */
-	case LED_CTL_START_WPS_BOTTON:
-		if (!pLed->bLedWPSBlinkInProgress) {
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-			if (pLed->bLedScanBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedScanBlinkInProgress = false;
-			}
-			pLed->bLedWPSBlinkInProgress = true;
-			pLed->CurrLedState = RTW_LED_ON;
-			pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, 0);
-		 }
-		break;
-	case LED_CTL_STOP_WPS:
-		pLed->bLedWPSBlinkInProgress = false;
-		if (padapter->pwrctrlpriv.rf_pwrstate != rf_on) {
-			SwLedOff(padapter, pLed);
-		} else {
-			pLed->CurrLedState = RTW_LED_ON;
-			pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, 0);
-		}
-		break;
-	case LED_CTL_STOP_WPS_FAIL:
-		pLed->bLedWPSBlinkInProgress = false;
-		if (padapter->pwrctrlpriv.rf_pwrstate != rf_on) {
-			SwLedOff(padapter, pLed);
-		} else {
-			pLed->CurrLedState = RTW_LED_OFF;
-			pLed->BlinkingLedState = RTW_LED_OFF;
-			_set_timer(&pLed->BlinkTimer, 0);
-		}
-		break;
-	case LED_CTL_START_TO_LINK:
-	case LED_CTL_NO_LINK:
-		if (!IS_LED_BLINKING(pLed)) {
-			pLed->CurrLedState = RTW_LED_OFF;
-			pLed->BlinkingLedState = RTW_LED_OFF;
-			_set_timer(&pLed->BlinkTimer, 0);
-		}
-		break;
-	case LED_CTL_POWER_OFF:
-		pLed->CurrLedState = RTW_LED_OFF;
-		pLed->BlinkingLedState = RTW_LED_OFF;
-		if (pLed->bLedBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedBlinkInProgress = false;
-		}
-		if (pLed->bLedScanBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedScanBlinkInProgress = false;
-		}
-		if (pLed->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedWPSBlinkInProgress = false;
-		}
-
-		_set_timer(&pLed->BlinkTimer, 0);
-		break;
-	default:
-		break;
-	}
-}
-
-  /* COREGA, added by chiyoko, 20090316 */
- static void SwLedControlMode3(struct adapter *padapter, enum LED_CTL_MODE LedAction)
-{
-	struct led_priv *ledpriv = &padapter->ledpriv;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct LED_871x *pLed = &ledpriv->SwLed0;
-
-	switch (LedAction) {
-	case LED_CTL_SITE_SURVEY:
-		if (pmlmepriv->LinkDetectInfo.bBusyTraffic) {
-		} else if (!pLed->bLedScanBlinkInProgress) {
-			if (IS_LED_WPS_BLINKING(pLed))
-				return;
-
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-			pLed->bLedScanBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_SCAN;
-			pLed->BlinkTimes = 24;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_SCAN_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_TX:
-	case LED_CTL_RX:
-		if ((!pLed->bLedBlinkInProgress) && (check_fwstate(pmlmepriv, _FW_LINKED))) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
-				return;
-			pLed->bLedBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_TXRX;
-			pLed->BlinkTimes = 2;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_FASTER_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_LINK:
-		if (IS_LED_WPS_BLINKING(pLed))
-			return;
-		pLed->CurrLedState = RTW_LED_ON;
-		pLed->BlinkingLedState = RTW_LED_ON;
-		if (pLed->bLedBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedBlinkInProgress = false;
-		}
-		if (pLed->bLedScanBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedScanBlinkInProgress = false;
-		}
-
-		_set_timer(&pLed->BlinkTimer, 0);
-		break;
-	case LED_CTL_START_WPS: /* wait until xinpin finish */
-	case LED_CTL_START_WPS_BOTTON:
-		if (!pLed->bLedWPSBlinkInProgress) {
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-			if (pLed->bLedScanBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedScanBlinkInProgress = false;
-			}
-			pLed->bLedWPSBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_WPS;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_SCAN_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_STOP_WPS:
-		if (pLed->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedWPSBlinkInProgress = false;
-		} else {
-			pLed->bLedWPSBlinkInProgress = true;
-		}
-
-		pLed->CurrLedState = LED_BLINK_WPS_STOP;
-		if (pLed->bLedOn) {
-			pLed->BlinkingLedState = RTW_LED_OFF;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_WPS_SUCESS_INTERVAL_ALPHA);
-		} else {
-			pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, 0);
-		}
-		break;
-	case LED_CTL_STOP_WPS_FAIL:
-		if (pLed->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedWPSBlinkInProgress = false;
-		}
-		pLed->CurrLedState = RTW_LED_OFF;
-		pLed->BlinkingLedState = RTW_LED_OFF;
-		_set_timer(&pLed->BlinkTimer, 0);
-		break;
-	case LED_CTL_START_TO_LINK:
-	case LED_CTL_NO_LINK:
-		if (!IS_LED_BLINKING(pLed)) {
-			pLed->CurrLedState = RTW_LED_OFF;
-			pLed->BlinkingLedState = RTW_LED_OFF;
-			_set_timer(&pLed->BlinkTimer, 0);
-		}
-		break;
-	case LED_CTL_POWER_OFF:
-		pLed->CurrLedState = RTW_LED_OFF;
-		pLed->BlinkingLedState = RTW_LED_OFF;
-		if (pLed->bLedBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedBlinkInProgress = false;
-		}
-		if (pLed->bLedScanBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedScanBlinkInProgress = false;
-		}
-		if (pLed->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedWPSBlinkInProgress = false;
-		}
-
-		_set_timer(&pLed->BlinkTimer, 0);
-		break;
-	default:
-		break;
-	}
-}
-
- /* Edimax-Belkin, added by chiyoko, 20090413 */
-static void SwLedControlMode4(struct adapter *padapter, enum LED_CTL_MODE LedAction)
-{
-	struct led_priv *ledpriv = &padapter->ledpriv;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct LED_871x *pLed = &ledpriv->SwLed0;
-	struct LED_871x *pLed1 = &ledpriv->SwLed1;
-
-	switch (LedAction) {
-	case LED_CTL_START_TO_LINK:
-		if (pLed1->bLedWPSBlinkInProgress) {
-			pLed1->bLedWPSBlinkInProgress = false;
-			_cancel_timer_ex(&pLed1->BlinkTimer);
-
-			pLed1->BlinkingLedState = RTW_LED_OFF;
-			pLed1->CurrLedState = RTW_LED_OFF;
-
-			if (pLed1->bLedOn)
-				_set_timer(&pLed->BlinkTimer, 0);
-		}
-
-		if (!pLed->bLedStartToLinkBlinkInProgress) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
-				return;
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-			if (pLed->bLedNoLinkBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedNoLinkBlinkInProgress = false;
-			}
-
-			pLed->bLedStartToLinkBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_StartToBlink;
-			if (pLed->bLedOn) {
-				pLed->BlinkingLedState = RTW_LED_OFF;
-				_set_timer(&pLed->BlinkTimer, LED_BLINK_SLOWLY_INTERVAL);
-			} else {
-				pLed->BlinkingLedState = RTW_LED_ON;
-				_set_timer(&pLed->BlinkTimer, LED_BLINK_NORMAL_INTERVAL);
-			}
-		}
-		break;
-	case LED_CTL_LINK:
-	case LED_CTL_NO_LINK:
-		/* LED1 settings */
-		if (LedAction == LED_CTL_LINK) {
-			if (pLed1->bLedWPSBlinkInProgress) {
-				pLed1->bLedWPSBlinkInProgress = false;
-				_cancel_timer_ex(&pLed1->BlinkTimer);
-
-				pLed1->BlinkingLedState = RTW_LED_OFF;
-				pLed1->CurrLedState = RTW_LED_OFF;
-
-				if (pLed1->bLedOn)
-					_set_timer(&pLed->BlinkTimer, 0);
-			}
-		}
-
-		if (!pLed->bLedNoLinkBlinkInProgress) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
-				return;
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-
-			pLed->bLedNoLinkBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_SLOWLY;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_NO_LINK_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_SITE_SURVEY:
-		if ((pmlmepriv->LinkDetectInfo.bBusyTraffic) && (check_fwstate(pmlmepriv, _FW_LINKED))) {
-		} else if (!pLed->bLedScanBlinkInProgress) {
-			if (IS_LED_WPS_BLINKING(pLed))
-				return;
-
-			if (pLed->bLedNoLinkBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedNoLinkBlinkInProgress = false;
-			}
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-			pLed->bLedScanBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_SCAN;
-			pLed->BlinkTimes = 24;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_SCAN_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_TX:
-	case LED_CTL_RX:
-		if (!pLed->bLedBlinkInProgress) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN || IS_LED_WPS_BLINKING(pLed))
-				return;
-			if (pLed->bLedNoLinkBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedNoLinkBlinkInProgress = false;
-			}
-			pLed->bLedBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_TXRX;
-			pLed->BlinkTimes = 2;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_FASTER_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_START_WPS: /* wait until xinpin finish */
-	case LED_CTL_START_WPS_BOTTON:
-		if (pLed1->bLedWPSBlinkInProgress) {
-			pLed1->bLedWPSBlinkInProgress = false;
-			_cancel_timer_ex(&pLed1->BlinkTimer);
-
-			pLed1->BlinkingLedState = RTW_LED_OFF;
-			pLed1->CurrLedState = RTW_LED_OFF;
-
-			if (pLed1->bLedOn)
-				_set_timer(&pLed->BlinkTimer, 0);
-		}
-
-		if (!pLed->bLedWPSBlinkInProgress) {
-			if (pLed->bLedNoLinkBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedNoLinkBlinkInProgress = false;
-			}
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-			if (pLed->bLedScanBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedScanBlinkInProgress = false;
-			}
-			pLed->bLedWPSBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_WPS;
-			if (pLed->bLedOn) {
-				pLed->BlinkingLedState = RTW_LED_OFF;
-				_set_timer(&pLed->BlinkTimer, LED_BLINK_SLOWLY_INTERVAL);
-			} else {
-				pLed->BlinkingLedState = RTW_LED_ON;
-				_set_timer(&pLed->BlinkTimer, LED_BLINK_NORMAL_INTERVAL);
-			}
-		}
-		break;
-	case LED_CTL_STOP_WPS:	/* WPS connect success */
-		if (pLed->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedWPSBlinkInProgress = false;
-		}
-
-		pLed->bLedNoLinkBlinkInProgress = true;
-		pLed->CurrLedState = LED_BLINK_SLOWLY;
-		if (pLed->bLedOn)
-			pLed->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed->BlinkingLedState = RTW_LED_ON;
-		_set_timer(&pLed->BlinkTimer, LED_BLINK_NO_LINK_INTERVAL_ALPHA);
-
-		break;
-	case LED_CTL_STOP_WPS_FAIL:		/* WPS authentication fail */
-		if (pLed->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedWPSBlinkInProgress = false;
-		}
-		pLed->bLedNoLinkBlinkInProgress = true;
-		pLed->CurrLedState = LED_BLINK_SLOWLY;
-		if (pLed->bLedOn)
-			pLed->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed->BlinkingLedState = RTW_LED_ON;
-		_set_timer(&pLed->BlinkTimer, LED_BLINK_NO_LINK_INTERVAL_ALPHA);
-
-		/* LED1 settings */
-		if (pLed1->bLedWPSBlinkInProgress)
-			_cancel_timer_ex(&pLed1->BlinkTimer);
-		else
-			pLed1->bLedWPSBlinkInProgress = true;
-		pLed1->CurrLedState = LED_BLINK_WPS_STOP;
-		if (pLed1->bLedOn)
-			pLed1->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed1->BlinkingLedState = RTW_LED_ON;
-		_set_timer(&pLed->BlinkTimer, LED_BLINK_NORMAL_INTERVAL);
-		break;
-	case LED_CTL_STOP_WPS_FAIL_OVERLAP:	/* WPS session overlap */
-		if (pLed->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedWPSBlinkInProgress = false;
-		}
-		pLed->bLedNoLinkBlinkInProgress = true;
-		pLed->CurrLedState = LED_BLINK_SLOWLY;
-		if (pLed->bLedOn)
-			pLed->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed->BlinkingLedState = RTW_LED_ON;
-		_set_timer(&pLed->BlinkTimer, LED_BLINK_NO_LINK_INTERVAL_ALPHA);
-
-		/* LED1 settings */
-		if (pLed1->bLedWPSBlinkInProgress)
-			_cancel_timer_ex(&pLed1->BlinkTimer);
-		else
-			pLed1->bLedWPSBlinkInProgress = true;
-		pLed1->CurrLedState = LED_BLINK_WPS_STOP_OVERLAP;
-		pLed1->BlinkTimes = 10;
-		if (pLed1->bLedOn)
-			pLed1->BlinkingLedState = RTW_LED_OFF;
-		else
-			pLed1->BlinkingLedState = RTW_LED_ON;
-		_set_timer(&pLed->BlinkTimer, LED_BLINK_NORMAL_INTERVAL);
-		break;
-	case LED_CTL_POWER_OFF:
-		pLed->CurrLedState = RTW_LED_OFF;
-		pLed->BlinkingLedState = RTW_LED_OFF;
-
-		if (pLed->bLedNoLinkBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedNoLinkBlinkInProgress = false;
-		}
-		if (pLed->bLedLinkBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedLinkBlinkInProgress = false;
-		}
-		if (pLed->bLedBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedBlinkInProgress = false;
-		}
-		if (pLed->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedWPSBlinkInProgress = false;
-		}
-		if (pLed->bLedScanBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedScanBlinkInProgress = false;
-		}
-		if (pLed->bLedStartToLinkBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedStartToLinkBlinkInProgress = false;
-		}
-		if (pLed1->bLedWPSBlinkInProgress) {
-			_cancel_timer_ex(&pLed1->BlinkTimer);
-			pLed1->bLedWPSBlinkInProgress = false;
-		}
-		pLed1->BlinkingLedState = LED_UNKNOWN;
-		SwLedOff(padapter, pLed);
-		SwLedOff(padapter, pLed1);
-		break;
-	default:
-		break;
-	}
-}
-
- /* Sercomm-Belkin, added by chiyoko, 20090415 */
-static void
-SwLedControlMode5(
-	struct adapter *padapter,
-	enum LED_CTL_MODE LedAction
-)
-{
-	struct led_priv *ledpriv = &padapter->ledpriv;
-	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct LED_871x *pLed = &ledpriv->SwLed0;
-
-	switch (LedAction) {
-	case LED_CTL_POWER_ON:
-	case LED_CTL_NO_LINK:
-	case LED_CTL_LINK:	/* solid blue */
-		pLed->CurrLedState = RTW_LED_ON;
-		pLed->BlinkingLedState = RTW_LED_ON;
-
-		_set_timer(&pLed->BlinkTimer, 0);
-		break;
-	case LED_CTL_SITE_SURVEY:
-		if ((pmlmepriv->LinkDetectInfo.bBusyTraffic) && (check_fwstate(pmlmepriv, _FW_LINKED))) {
-		} else if (!pLed->bLedScanBlinkInProgress) {
-			if (pLed->bLedBlinkInProgress) {
-				_cancel_timer_ex(&pLed->BlinkTimer);
-				pLed->bLedBlinkInProgress = false;
-			}
-			pLed->bLedScanBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_SCAN;
-			pLed->BlinkTimes = 24;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_SCAN_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_TX:
-	case LED_CTL_RX:
-		if (!pLed->bLedBlinkInProgress) {
-			if (pLed->CurrLedState == LED_BLINK_SCAN)
-				return;
-			pLed->bLedBlinkInProgress = true;
-			pLed->CurrLedState = LED_BLINK_TXRX;
-			pLed->BlinkTimes = 2;
-			if (pLed->bLedOn)
-				pLed->BlinkingLedState = RTW_LED_OFF;
-			else
-				pLed->BlinkingLedState = RTW_LED_ON;
-			_set_timer(&pLed->BlinkTimer, LED_BLINK_FASTER_INTERVAL_ALPHA);
-		}
-		break;
-	case LED_CTL_POWER_OFF:
-		pLed->CurrLedState = RTW_LED_OFF;
-		pLed->BlinkingLedState = RTW_LED_OFF;
-
-		if (pLed->bLedBlinkInProgress) {
-			_cancel_timer_ex(&pLed->BlinkTimer);
-			pLed->bLedBlinkInProgress = false;
-		}
-		SwLedOff(padapter, pLed);
-		break;
-	default:
-		break;
-	}
-}
-
- /* WNC-Corega, added by chiyoko, 20090902 */
-static void
-SwLedControlMode6(
-	struct adapter *padapter,
-	enum LED_CTL_MODE LedAction
-)
-{
-	struct led_priv *ledpriv = &padapter->ledpriv;
-	struct LED_871x *pLed0 = &ledpriv->SwLed0;
-
-	switch (LedAction) {
-	case LED_CTL_POWER_ON:
-	case LED_CTL_LINK:
-	case LED_CTL_NO_LINK:
-		_cancel_timer_ex(&pLed0->BlinkTimer);
-		pLed0->CurrLedState = RTW_LED_ON;
-		pLed0->BlinkingLedState = RTW_LED_ON;
-		_set_timer(&pLed0->BlinkTimer, 0);
-		break;
-	case LED_CTL_POWER_OFF:
-		SwLedOff(padapter, pLed0);
-		break;
-	default:
-		break;
-	}
-}
-
 void BlinkHandler(struct LED_871x *pLed)
 {
 	struct adapter *padapter = pLed->padapter;
@@ -1063,28 +445,5 @@ void LedControl8188eu(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 	     LedAction == LED_CTL_POWER_ON))
 		return;
 
-	switch (ledpriv->LedStrategy) {
-	case SW_LED_MODE0:
-		break;
-	case SW_LED_MODE1:
-		SwLedControlMode1(padapter, LedAction);
-		break;
-	case SW_LED_MODE2:
-		SwLedControlMode2(padapter, LedAction);
-		break;
-	case SW_LED_MODE3:
-		SwLedControlMode3(padapter, LedAction);
-		break;
-	case SW_LED_MODE4:
-		SwLedControlMode4(padapter, LedAction);
-		break;
-	case SW_LED_MODE5:
-		SwLedControlMode5(padapter, LedAction);
-		break;
-	case SW_LED_MODE6:
-		SwLedControlMode6(padapter, LedAction);
-		break;
-	default:
-		break;
-	}
+	SwLedControlMode1(padapter, LedAction);
 }
-- 
2.33.0

