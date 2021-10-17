Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318512C80
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:51:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id j10-20020a1c230a000000b0030d523b6693so8017986wmj.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZeVnNCmW5EyaPMj60KfsQo7kwwc+3LgC2qvi+RyQlo=;
        b=I10ALzmYuQSVIkoaVW9ciNkm/ET7sZtHXyT51uXtjXLZZIPpWNAwizgV62EnyDFjUN
         B3POG3muifaAleDji4ORbqlsBMATCUo+4tvSDN4FfDs2Ys/VJLZXIajKfMIsHs3z/7x9
         KG8CiJFYC6RadgmZT9xUObOXzUNN6msDl3sYcFOIq0uzxaWF7JQIv46nH4+A6OFZ2BYV
         bJGiFZciPBdKawTA6DjlOMgMZ8fcCC+40qP1dUKcrGrqXsKLIzFXdHDlsWdEwg7QUjDJ
         dcj9Culszto3GfUeHwlNHyFWGIi7gVgfh2OBE9/5FMnyT3kxcY5iHaYVKz3mMyhPctL7
         pwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UZeVnNCmW5EyaPMj60KfsQo7kwwc+3LgC2qvi+RyQlo=;
        b=XWcsTZQkEo3NuG4WEUeFC+8V6olWLOJiwFuSFLPCnymA5XFK/p7RJBaypVIG9pdSwq
         3sbhShoERv9JC0hbQgB+Sy5NHP34AHLgMMW00Cww0DOZznOqo+n2ZX/pnLg9ouHdat36
         n7t52kwYB/+XkywSemYNaCXiLy4Tx2356XdajMsVHOFS81olTkW/MXkEJPi7Y9yTNbQ/
         Viz0/po3TO/dyS0+3NAWR+Kx8Pbw9j7JGgVltynPD8GHx7E1YmKXPyeXnzYNAM1lTyzL
         c1oEzOg34JCJGj52pftWuzb2fp0QIesM8elQl1KsDCG7+viv/aj3FXArf1r5JMbd0nmF
         kFCg==
X-Gm-Message-State: AOAM530kk/EJQbS/irYuDAImC+96JbKrjGgRuZeCtvBgNXRwXo2zK8ma
	zTGbyIFLKPGX0RwyRMhjPPs=
X-Google-Smtp-Source: ABdhPJwycNnkDcN6ezgCoYR+2+ScM82E0WaX2bP2GyDF9tKW1sNC49D3xGRV3D7sHvBWB54JCyzdDA==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id o13mr40360450wmq.158.1634489458610;
        Sun, 17 Oct 2021 09:50:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3de4])
        by smtp.gmail.com with ESMTPSA id p18sm11249489wrt.54.2021.10.17.09.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:50:58 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unnecessary asignment
Date: Sun, 17 Oct 2021 18:50:49 +0200
Message-Id: <20211017165049.8061-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The asignment "pLed->BlinkTimes = 0" is in a code path that is
executed only if pLed->BlinkTimes is 0. Remove this unnecessary
asignment.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_led.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 09d8c4e85863..0e3453639a8b 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -142,7 +142,6 @@ static void SwLedBlink1(struct LED_871x *pLed)
 					pLed->BlinkingLedState = RTW_LED_ON;
 				_set_timer(&pLed->BlinkTimer, LED_BLINK_NO_LINK_INTERVAL_ALPHA);
 			}
-			pLed->BlinkTimes = 0;
 			pLed->bLedBlinkInProgress = false;
 		} else {
 			if (pLed->bLedOn)
-- 
2.33.0

