Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03879363;
	Wed, 30 Mar 2022 13:07:39 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id e189so21988524oia.8;
        Wed, 30 Mar 2022 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=iHRrjC7NGgHX48bIJgJGcmUknIuFtHx4WhnT2MgRlL4=;
        b=Kp0gzgzMfQ3kAvf1gdqVG9PW5fvH8A0wiM4iIvt/os2m6GCy08yYL67z/4CzATgJeE
         uWtPe78fPYk6XMDFsIi+sC12sSsR7hWAI01iUU/B4UeBhpp5yuWO1APRl80MMrCw8nXt
         az93SELSRfONXauqZ+Uu9Ti+fOA7Pypjke+BMgKn4U4EGLjaLw07BFcr+jcIVg2igMLk
         pSTUW5v6OhQ+M89TATX9k5I5KvYJ8rhmW96WrZi1dEP9c3PdkThDfiqqlj7UK7Kra4KA
         h0xyfDDbPGR7k5w6MGeKR3kJW1BJhwPa1VfpK8odK3A3koHsn3fZ4BdVJYU7I54cZqhp
         7pfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=iHRrjC7NGgHX48bIJgJGcmUknIuFtHx4WhnT2MgRlL4=;
        b=ppQeZ+gkReMDdNDRFc/GwS2gBabNU84WggL1bXvjBKEjAJqly6I1mbC29Cfy2ON8yd
         r/Wg4AeXkoQ0qR8E9vZMHx3rMxCQn/Xqsb8ECyHD/iWdT7YAG0BonNL3Rg8yx7G/4Mk/
         TSl18b0DthYI747K/mow60SGM/P6QU8vpLSrYCaYHREtQIAdUKgd2A3GTXpJiB+rYek6
         Hkko33aJCr6QpkJue1bg/FIr+tmfPnHYu6RD6Xklc9r+ripPwPscptKpIYbvvJ95/E01
         28Z0W28ajSowbYz+Uvy9gPGDDQ+wRJjKeO4484xnPTzTRt75VS5k3Xvh4fe/4ACxhY2r
         XDKQ==
X-Gm-Message-State: AOAM530/Vp/uA2kWgrNuTVc3bTaMxRnDbthO3Ob5NBxtXF9nU7+UCEzr
	8CanrMDxmmV4EGHvhbESH3QT9AGa0kw0oA==
X-Google-Smtp-Source: ABdhPJyrbIXiZOh+V+60qXAY07OWSGBpHcV9cLP7AqXSJjdmJ5cpofJ52ZV786SXOXELUk9wteiGSQ==
X-Received: by 2002:a05:6808:146:b0:2f4:748:5588 with SMTP id h6-20020a056808014600b002f407485588mr1704317oie.292.1648645658296;
        Wed, 30 Mar 2022 06:07:38 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id q6-20020acaf206000000b002ef960f65b3sm10264175oih.25.2022.03.30.06.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 06:07:37 -0700 (PDT)
Date: Wed, 30 Mar 2022 08:07:36 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: r8188eu: remove unnecessary spaces
Message-ID: <YkRWGCmMytlqgvkZ@bertie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Conform to Linux kernel coding style. Issue found by checkpatch:

WARNING: Statements should start on a tabstop

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_led.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index ccd43accb7dc..4b047c438389 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -278,7 +278,7 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 			else
 				pLed->BlinkingLedState = RTW_LED_ON;
 			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
-		 }
+		}
 		break;
 	case LED_CTL_TX:
 	case LED_CTL_RX:
@@ -304,7 +304,7 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 		}
 		break;
 	case LED_CTL_START_WPS: /* wait until xinpin finish */
-		 if (!pLed->bLedWPSBlinkInProgress) {
+		if (!pLed->bLedWPSBlinkInProgress) {
 			if (pLed->bLedNoLinkBlinkInProgress) {
 				cancel_delayed_work(&pLed->blink_work);
 				pLed->bLedNoLinkBlinkInProgress = false;
@@ -328,7 +328,7 @@ void rtw_led_control(struct adapter *padapter, enum LED_CTL_MODE LedAction)
 			else
 				pLed->BlinkingLedState = RTW_LED_ON;
 			schedule_delayed_work(&pLed->blink_work, LED_BLINK_SCAN_INTVL);
-		 }
+		}
 		break;
 	case LED_CTL_STOP_WPS:
 		if (pLed->bLedNoLinkBlinkInProgress) {
-- 
2.32.0

