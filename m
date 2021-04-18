Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DFA71
	for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 17:32:41 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q10so22627161pgj.2
        for <linux-staging@lists.linux.dev>; Sun, 18 Apr 2021 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=AOU4sFlQzuUDId/4lsftUubI13w4y5BA/4YL9lGoNIE=;
        b=UDOWUj/BNmeQSx/IgyaGqDTmjZZszrVkDuNdr4y66X9r562Y+OY1cj1s5J936A/huy
         HSN5s1Cnru8Wu0vRluiQoRVnI30VApfE7lJFeTjHz1d0qbWv/oeAXtp6nJSwM7zJJoYg
         PCbwG8eVjPAtz9nbASXV2Uk7/pJnMsqyK9VzADmdyykFiCwHJ/LEX2knOiNBEwPzxYSt
         3dbv3vs3ms4DTQ6dT90qU1cXffjeTRcIX8LPEBn7rXnTkHPKSAqeCepJOEt9Z+44+Yw9
         YDhCy9zRTJKmMI+P+jRJCP+YW96FOZ7FpUzeMcJ4VEIlFmH9u9w45bH5JcmQt9kGjgAx
         lKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=AOU4sFlQzuUDId/4lsftUubI13w4y5BA/4YL9lGoNIE=;
        b=bQ+SsppUyKscP6Z0IxVZ4HAM8FtjEVvIy7gShZUp5PeVGAGLJJvg2Gw+qKQJfvk66j
         fk4Nb2/j2TXua7Jz7O733O48/PAtaFPMUbNsyYeTTY0nirfXP3lQwkdocBFWkqlqI6tb
         jTCTiK5fzqEfLokb4oOCiQva1Mywg5BmP+bvdH3iqg0EtMcIReo+FBwwu8t1pCJuHgVX
         dKWWiU8OZKT9kunMM9xnuuZnt/HLFgGlVFrNzro8V9Ukna74epwOHqH36fxIN+6m74lN
         wDWhhUdfoUO1UBuocFVQX9lMhvAlaJ7I/yD+LHOQ9kjzkmyG4K/AujDorEWzErHhcRUn
         hK3Q==
X-Gm-Message-State: AOAM533sBSrGsAaQSGbEOprWGGw5Y3iJd+d3bIdP62uobpvlMRbBD5jJ
	y2aHOyaUNED5qNfL8ykLvLo=
X-Google-Smtp-Source: ABdhPJwYtFD5FMK8qCddAiscQgeKoiR6Bcb9l4vBJZaJ2WSQjn0NaD71yQrqcqB8shkmFR89ZoS4Cg==
X-Received: by 2002:a05:6a00:1585:b029:203:6bc9:3ca6 with SMTP id u5-20020a056a001585b02902036bc93ca6mr16579043pfk.79.1618767161520;
        Sun, 18 Apr 2021 10:32:41 -0700 (PDT)
Received: from user ([2001:4490:4409:d07c:b4ac:39e7:e05c:f39b])
        by smtp.gmail.com with ESMTPSA id s40sm9411038pfw.100.2021.04.18.10.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 10:32:41 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
X-Google-Original-From: Saurav Girepunje <saurav.girepunje@google.com>
Date: Sun, 18 Apr 2021 23:02:33 +0530
To: gregkh@linuxfoundation.org, fabioaiuto83@gmail.com,
	hello@bryanbrattlof.com, hdegoede@redhat.com,
	saurav.girepunje@google.com, john.oldman@polehill.co.uk,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8723bs: os_dep: remove multiple return
Message-ID: <20210418173233.GA59153@user>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

on sdio_intf.c rtw_sdio_suspend call we have multiple
return which can replace by goto exit. As in all the places
return value is 0.

Signed-off-by: Saurav Girepunje <saurav.girepunje@google.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index a9a9631dd23c..3e566cf97f6e 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -445,14 +445,17 @@ static int rtw_sdio_suspend(struct device *dev)
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 
 	if (padapter->bDriverStopped)
-		return 0;
+		goto exit;
 
 	if (pwrpriv->bInSuspend) {
 		pdbgpriv->dbg_suspend_error_cnt++;
-		return 0;
+		goto exit;
 	}
 
-	return rtw_suspend_common(padapter);
+	rtw_suspend_common(padapter);
+exit:
+
+	return 0;
 }
 
 static int rtw_resume_process(struct adapter *padapter)
-- 
2.25.1

