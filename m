Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D592F80
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 11:41:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id j12-20020a05600c1c0c00b002e6d80c902dso8874474wms.4
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 04:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L3+/t+M4NdbuQEywJSiSAtkeuUZUxnSjSeon08Uk4D4=;
        b=uFZ6GRjQqJCWSKzx3M+yIrVffXPmRu+XZeyH40iRzyNkat01pe/8kL6w1v8vAza+kL
         b6DkvMqtDckvtvplgB5V5o6MgrpWWp9p+KONAqMA/ZcUsNwjbahPyjpHttQYRc1xKXkT
         RSWCsAeyw2NxKUuT1DBeIx2xdmgDlqKwEm+2RND907OLlE6+3dY7lso7LFt0x3GWl8CP
         YNiWr7iVnUVo2Np+YlGbMneXaCAzo3buNP7rRCRJEVCmJpbk8Avvr5XsSfOb2szQHkaJ
         bTZlPNojzDY2L0MLJZZP9pvZs0Orm6n8Bwb2PF+t2zA6THdo9RKZHAbnpZqUlIxqlP9/
         sGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L3+/t+M4NdbuQEywJSiSAtkeuUZUxnSjSeon08Uk4D4=;
        b=rSBU82r8KKWsjuB4ckrPGM19XsRwE4V5yrjNDlw+hXBN+sVKrkTCMeKrSvRup6fUil
         1meh+0CBPhFzUUP6BZA/pfq079p8rzKKN/AGoEYIOt0r2eD0hseIxw64IluxMX9XUQvm
         xscA1VJXQ9ti8qPs73D57N92HzxjUToqoeUzM6Ss/tL6a4yQTN4dTnedBKJqLYkgRNJi
         gZ3/r6bnqd35LIhqh6KI6O7WDxb51LvK5UVmpvJ5qC4uZDkqnTnLij6nsGmaK92IuH0p
         YbckSPpp4f2tfbLo+SUFGBSMENnFkOMwHXeaW4ZixoUXg394lZXRwO4ANgsaoFHQD/e7
         k3Gw==
X-Gm-Message-State: AOAM533AF3rKHn5U0q8MosoaoF8wSaCI9TWdJvoFbKOcvwNp1MgAeXoR
	bT0mfZRdjUVL+FhfuHSrPfZnTDjtC/M=
X-Google-Smtp-Source: ABdhPJwEh3fDTlvjD2ciXWaWgQjABCYPEgZ9AbYHWy5g6n5HZu3U8x2Ylk/pajojj8avm5WVVcZMgQ==
X-Received: by 2002:a7b:c442:: with SMTP id l2mr12047673wmi.131.1629632471190;
        Sun, 22 Aug 2021 04:41:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id q3sm9831235wmf.37.2021.08.22.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 04:41:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove unnecessary parentheses
Date: Sun, 22 Aug 2021 13:40:14 +0200
Message-Id: <20210822114014.21584-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210822114014.21584-1-straube.linux@gmail.com>
References: <20210822114014.21584-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses to improve readability.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_led.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 29c48f1a4fec..cd27873c3e63 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -121,9 +121,9 @@ static void SwLedBlink(struct LED_871x *pLed)
 	}
 
 	if (bStopBlinking) {
-		if ((check_fwstate(pmlmepriv, _FW_LINKED)) && (!pLed->bLedOn)) {
+		if (check_fwstate(pmlmepriv, _FW_LINKED) && !pLed->bLedOn) {
 			SwLedOn(padapter, pLed);
-		} else if ((check_fwstate(pmlmepriv, _FW_LINKED)) &&  pLed->bLedOn) {
+		} else if (check_fwstate(pmlmepriv, _FW_LINKED) && pLed->bLedOn) {
 			SwLedOff(padapter, pLed);
 		}
 		pLed->BlinkTimes = 0;
-- 
2.32.0

