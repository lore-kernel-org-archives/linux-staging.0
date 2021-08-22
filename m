Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C33FC0
	for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 11:41:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id f10so8726015wml.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Aug 2021 04:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EGnJb6dK+F7FLCF7zjXaWBGNlnlVYewZwO3r2RfXfdE=;
        b=IQTqEEwIQpEooFMBpIdtXQQ93xAhR+U0K4YYB9ftA6e3dcwo5heF5iQmdZpR1ALN1O
         ErTQUTBoyD6NjbFpcSY7PX0cpL3HsUjTZBBzf9u+W9be5lnaClp3pW064IkcDYaYJ9TN
         qx0iDBktuZc8j9nrrRySbbaYQNS2oaxstsNwytafsj1QtnHUKIeM089GE4oY+ZPPHKbu
         E5WgWNCBrxkTEGagec8R0tsh9ubC2Ff1lmMGjNskQLNOcRYBvC8uYKCZUlDFDPM9GNF2
         SBIf5X3j5noRciaUucXohfhwiEmGUnk9fbX+tGiB78CDqEoO/Xqt9PUBV1BQjq3yXNSN
         /uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EGnJb6dK+F7FLCF7zjXaWBGNlnlVYewZwO3r2RfXfdE=;
        b=QFu0mnn0YfBbF62T0c44oQOgPhUmG3cjqrWknO6iKf66tQVbVA+AbsVE1U//tjnpSJ
         O4VxS74vurFrYD1hvm3i2PjHfR337ywuOa/Q0I1qJRAaW6RwBETbCah9i3O/gdZNCyV9
         qB6pPMxuuOAAI/+xB/sAUR1hu68sKhLb8pEJrO+gIsdM+BKqCzDJHlYRfdxst+3yYYxe
         7PpupnwWuqD88xWruHm/F7VsEhYVan+2vkbPTyTVj/VepCs+leutB8Flr1g8fbnaxlbe
         WALz/Q8DAD73xGj1DX49v+WaQi0VIx1b1DI3JF8/ak53SELaJcasL9/O0YzVbyfXaYXo
         GICw==
X-Gm-Message-State: AOAM533ubZNzUDL+8lxKofhSh6YcEJGwEseIJ5gA2eYf/PQu41ZBbPsV
	EagTAFG3OqbBeHiUtFgHjD0=
X-Google-Smtp-Source: ABdhPJxOXZyTtKO2LUpFsSSs9gAakkNFjU9/cuUW0gO4qJqcbCAj3aW4XAgprShsBZIb0roDKKlMYg==
X-Received: by 2002:a7b:c4d8:: with SMTP id g24mr11701534wmk.38.1629632470471;
        Sun, 22 Aug 2021 04:41:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id q3sm9831235wmf.37.2021.08.22.04.41.09
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
Subject: [PATCH 1/2] staging: r8188eu: remove dead code
Date: Sun, 22 Aug 2021 13:40:13 +0200
Message-Id: <20210822114014.21584-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

if (0) is never true, remove code that is never executed.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_led.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_led.c b/drivers/staging/r8188eu/core/rtw_led.c
index 306862aec53a..29c48f1a4fec 100644
--- a/drivers/staging/r8188eu/core/rtw_led.c
+++ b/drivers/staging/r8188eu/core/rtw_led.c
@@ -121,10 +121,7 @@ static void SwLedBlink(struct LED_871x *pLed)
 	}
 
 	if (bStopBlinking) {
-		/* if (padapter->pwrctrlpriv.cpwm >= PS_STATE_S2) */
-		if (0) {
-			SwLedOff(padapter, pLed);
-		} else if ((check_fwstate(pmlmepriv, _FW_LINKED)) && (!pLed->bLedOn)) {
+		if ((check_fwstate(pmlmepriv, _FW_LINKED)) && (!pLed->bLedOn)) {
 			SwLedOn(padapter, pLed);
 		} else if ((check_fwstate(pmlmepriv, _FW_LINKED)) &&  pLed->bLedOn) {
 			SwLedOff(padapter, pLed);
-- 
2.32.0

