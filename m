Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CBF3FD4
	for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 20:49:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id w17so30958687wrv.10
        for <linux-staging@lists.linux.dev>; Fri, 24 Sep 2021 13:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a8tei2z4GrmoyrcZEip935wZKfOS4cdN7dMi2avI0l8=;
        b=VEijUiro5FMz2eQM6QdaP3Oy9NZvKxZYB5ax/puTVShgfwf0ATt6MMULPPlt/biRDc
         P6u4YFn0e4lsvp55rrDjty0JrCbVvWpsYMG/yx/VPfU8bvb4Z82hwU57d6kbIO/yZ2Ez
         lOv9PKNiHwyCSyRoLaFFlovXaL+Z/rRgaK2KoCJ/Ecqplkksc6Vr7ueW46Uwh/9c4DNS
         yfXbL2GGQwE6YsrbfJNUzSTiaJCd653p+yeghtHGnFL6I0MIsQ+rs9GVOBdaiWoItjNq
         4qRPBb/TmJ7kTNC3aqHpcxscBVP70ArJnKl3LJlHWMIgDCYVvnEHE/IwbqbpISISMPBA
         TaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a8tei2z4GrmoyrcZEip935wZKfOS4cdN7dMi2avI0l8=;
        b=MvzoTCI5TteVjCuYDv24R8yiNJJUEPo80dGyRtb3LtjvZ5q5FCCMYgWyuA3SP8hVO4
         M5MOVSEKb1uJGvDnfieCsmjPLsUTUET2pEzgm4PasIMQ7o2JnydewFUxhMkJrnvcxIQt
         zBXJcCxCkxD3DANbTNOiKnhScbh2sEmotZncxWOYb+Rw/RckQ7OZgUAUXxPkN5jxHY0m
         esbfSB5uP7odWHIcgtxQprqrKff7MFvAiWuhaVAGIFYmHGWGPY/5aixbwbhSus7PC/OU
         BHR8TbfMwChpJvwiAY7X8su3FNJi+0rAfusE/6AyMNOTLQzTPjBdVut+OosFuIEmwLLs
         JPmg==
X-Gm-Message-State: AOAM531Z6ORUEszgCROmD4HYILB+6gC4uTVB4ymcnX/SaS/WYwWJWf6D
	A6OU+aV1GyG+csbJ6L9O0obEAWAJPDHmcA==
X-Google-Smtp-Source: ABdhPJw9xkkZJYbO2u0eexPnMm1qG7EIXZY6vdJLoiNT857yBsV9TgsuE2okssm2k5mvHCzpsleeeA==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr13761309wro.264.1632516573298;
        Fri, 24 Sep 2021 13:49:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51da])
        by smtp.gmail.com with ESMTPSA id j19sm9040292wra.92.2021.09.24.13.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 13:49:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove LedStrategy from struct led_priv
Date: Fri, 24 Sep 2021 22:49:17 +0200
Message-Id: <20210924204917.6313-6-straube.linux@gmail.com>
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

LedStrategy is set but never used. Remove it from struct led_priv and
remove the now unused enum LED_STRATEGY_871x as well.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c |  1 -
 drivers/staging/r8188eu/include/rtw_led.h | 18 ------------------
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 483a3b0ea94f..467809340a82 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1042,7 +1042,6 @@ static void _ReadLEDSetting(struct adapter *Adapter, u8 *PROMContent, bool Autol
 	struct hal_data_8188e	*haldata = GET_HAL_DATA(Adapter);
 
 	pledpriv->bRegUseLed = true;
-	pledpriv->LedStrategy = SW_LED_MODE1;
 	haldata->bLedOpenDrain = true;/*  Support Open-drain arrangement for controlling the LED. */
 }
 
diff --git a/drivers/staging/r8188eu/include/rtw_led.h b/drivers/staging/r8188eu/include/rtw_led.h
index f0965aa5b470..ebe6395642ae 100644
--- a/drivers/staging/r8188eu/include/rtw_led.h
+++ b/drivers/staging/r8188eu/include/rtw_led.h
@@ -127,30 +127,12 @@ struct LED_871x {
 	(((struct LED_871x *)_LED_871x)->bLedWPSBlinkInProgress	||	\
 	((struct LED_871x *)_LED_871x)->bLedScanBlinkInProgress)
 
-/*  LED customization. */
-
-enum LED_STRATEGY_871x {
-	SW_LED_MODE0 = 0, /* SW control 1 LED via GPIO0. It is default option.*/
-	SW_LED_MODE1= 1, /*  2 LEDs, through LED0 and LED1. For ALPHA. */
-	SW_LED_MODE2 = 2, /*  SW control 1 LED via GPIO0, customized for AzWave
-			   * 8187 minicard. */
-	SW_LED_MODE3 = 3, /*  SW control 1 LED via GPIO0, customized for Sercomm
-			   * Printer Server case. */
-	SW_LED_MODE4 = 4, /* for Edimax / Belkin */
-	SW_LED_MODE5 = 5, /* for Sercomm / Belkin */
-	SW_LED_MODE6 = 6, /* for 88CU minicard, porting from ce SW_LED_MODE7 */
-	HW_LED = 50, /*  HW control 2 LEDs, LED0 and LED1 (there are 4
-		      * different control modes, see MAC.CONFIG1 for details.)*/
-	LED_ST_NONE = 99,
-};
-
 void LedControl8188eu(struct adapter *padapter, enum LED_CTL_MODE	LedAction);
 
 struct led_priv{
 	/* add for led control */
 	struct LED_871x			SwLed0;
 	struct LED_871x			SwLed1;
-	enum LED_STRATEGY_871x	LedStrategy;
 	u8	bRegUseLed;
 	void (*LedControlHandler)(struct adapter *padapter,
 				  enum LED_CTL_MODE LedAction);
-- 
2.33.0

