Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22D83FC0
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 20:23:15 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id w6so7881648plg.9
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 13:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=PQ0kuL9gkx8s1jZqXYLC1xp9qFGx+ag16bv9EFtZWZg=;
        b=R0iXxfxeaWOuIMXxBqJgwpmEs+YrrkoGLezGgjHac7erBTBCmHznlnD8ScyHR7amLv
         GrZhBkuLP+oWanthAX/AAbWk1EEqcImQr7xwrYXDUfC++qZAisGMgAGNgmkx63OnURDY
         knEAqu4eKhxPaYJJ/Wx2eVQVA7r6zhdKf0HTGk5E2NuNN/uHMNPviQmRnzczYZWoHRAt
         lfV3fgDf/r8pJbRipGHsU6Wrhdkf8bxBTwQfLIsBm3v4hvc3YE2xFhAgUrOpkv1dk5cZ
         kPByeWfzkPZM/HKfSZd0EPvIsDXFon0IC2VtOQcd3zjkddMqflyZzimzjnPVinETlyRm
         PxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=PQ0kuL9gkx8s1jZqXYLC1xp9qFGx+ag16bv9EFtZWZg=;
        b=A7VnReU7C6PQEQ0tTWSZyoznHOaU83iuA3Tdrv4nhkiDcVbGpYox4yhqA0sRVNS4Dw
         aEufRrPMVL0TlnMK45dCMu3BLYDZ1IyYR4XrETbL4+RWjHe+ujNgUJ3DMThK7JXq8mAm
         Ch9E1VRybCMcH5kV5KaRs2KctHX9Wphl96Cyhu6qFM5YHXLSWssEC/kREusvSHowgKK7
         dW2x7b3e8XcKGeDQKAO5Yet/uGIFZzuxj8hlMwnAztaLbUV4fkWJz0wbd1cRqeMc7TF8
         gVNMTebvka1+JKCayH6gk6QBLv6ttHTCFOYK50/A2yETEayZDBD07YlVLMV02ZfXs5k3
         1mug==
X-Gm-Message-State: AOAM532c+/VA6lNPl8njT2EeJmSDTwZy7Fj3jWYzfvxrHmtOKX4NIQmS
	WNhkkxz0/KPip8ZkB44n1yU=
X-Google-Smtp-Source: ABdhPJzzCAc5LCMMermGlZjmy6uhYlmlp/zQj/7BLosZaU2KEqRItb8/yapd4m2Ge6Nkc1MAyX8aRQ==
X-Received: by 2002:a17:902:7897:b0:132:580a:90b4 with SMTP id q23-20020a170902789700b00132580a90b4mr3627046pll.7.1629577395400;
        Sat, 21 Aug 2021 13:23:15 -0700 (PDT)
Received: from user ([106.212.234.168])
        by smtp.gmail.com with ESMTPSA id z4sm70841pjl.53.2021.08.21.13.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 13:23:14 -0700 (PDT)
Date: Sun, 22 Aug 2021 01:53:08 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, saurav.girepunje@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: core: remove condition with no effect
Message-ID: <YSFgrLUfXzgcT6k4@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the condition with no effect (if == else) in rtw_led.c
file.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_led.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 22d4df9c92a5..76cbd5f19f90 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -148,10 +148,7 @@ static void SwLedBlink(struct LED_871x *pLed)
 			_set_timer(&(pLed->BlinkTimer), LED_BLINK_SLOWLY_INTERVAL);
 			break;
 		case LED_BLINK_WPS:
-			if (pLed->BlinkingLedState == RTW_LED_ON)
-				_set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
-			else
-				_set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
+			_set_timer(&(pLed->BlinkTimer), LED_BLINK_LONG_INTERVAL);
 			break;
 		default:
 			_set_timer(&(pLed->BlinkTimer), LED_BLINK_SLOWLY_INTERVAL);
--
2.30.2

