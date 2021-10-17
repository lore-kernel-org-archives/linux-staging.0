Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED692C80
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 17:06:37 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id g25so36614593wrb.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 10:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0fCaUspJ/VUdAic1iTmIc7QqeE5RksidRh973c3Qk4M=;
        b=iXSgDZaqTNHBfZliVp3BZ3lobHwLinkJKPO71D2DjocLFxQklwHYd1JQsEvKxwiALq
         /O9GqpGCwrVNMRsr212X3FzjmWnGPoxjSeN7F1Nw9YvH5/S2JUj6i8C/mXG18skfjtak
         oLY465w4KJqmcfmKE0NLDQ4UgPvCYH0aocORzpBljun8PsXK0tcVH02FLj2rmayPm701
         uKw5Fg8TQMEpIXtihfbyS0LI+SX2Q7jiATPTW5qdd2MqJP5H4w30fcE6h5N/96pnNgYO
         NVH0tx/kO5g4Z5lk6uq9ABbmbr4/JTdKMT7WZSTOlbOfoXKrFK2K/ecYfmksq3BNJI9g
         HXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0fCaUspJ/VUdAic1iTmIc7QqeE5RksidRh973c3Qk4M=;
        b=lcURct14TMDfuOeicyR0OtNB47TTfPBsjlIpQ0gPwVFr6zU5POM5c34MyDEcaMJP4N
         g8kMSlEZiEDnhPIpgxAN4z/PM0uHXHip9Ss9IikzJO3qkbJ4wi1x8ApPF8/IlRMDNuSy
         lFVDk+p4CkcX9lQaxLYrShrlzx4QrOEOLwmj46om5vl2UlBdcqELAlQLcNEk/rZeTg5M
         7R+UjJH9CCGBquznMzsonj9ofLwwFOdCVtvWD6KAKYFUTyz51g6Rm7pZJ4j13PJzAJYz
         pazbAVshMhelEqepbezJDCXRwj//P7yIjMFXc7B3DQWT3op0ab4bXIlIjbPQ6Yym1ORh
         m17A==
X-Gm-Message-State: AOAM531Sqfzg3+VtfS+CZprAS7TXAIFzfVZmbmlbYRV+6JVe74R50K6x
	AQ/MjzTp+oFdDu6X6oXR17M=
X-Google-Smtp-Source: ABdhPJwptV8jz34KDdp9FKnw71xm3aQR2fR8we2XCT2K2ifnpwsil2y7WyfWWNRbuv/KEeb06WIadw==
X-Received: by 2002:adf:8b9a:: with SMTP id o26mr30517194wra.109.1634490395759;
        Sun, 17 Oct 2021 10:06:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3de4])
        by smtp.gmail.com with ESMTPSA id f186sm15813352wma.46.2021.10.17.10.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 10:06:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2] staging: r8188eu: remove unnecessary assignment
Date: Sun, 17 Oct 2021 19:06:29 +0200
Message-Id: <20211017170629.13785-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The assignment "pLed->BlinkTimes = 0" is in a code path that is
executed only if pLed->BlinkTimes is 0. Remove this unnecessary
assignment.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2:
Fixed typos in the subject line and commit message.
asignment -> assignment

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

