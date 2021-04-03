Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA1F6D00
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:36 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so5814046wmq.1
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vXCLvI8TEyAmbBcLdMXgq4ObYns8B8WMiEotpUKpaLI=;
        b=WFs50adgpz3dSGcyBQNLIS3Tp0TtFk8wjaDNzMaw4r5iqXOqnWuy2d28G17CYOhXyk
         yDbCyp+5G9jFtrJJN3nG6SAVzDDE9Z4vs+pw4XLXcV71RYOecCJQu0f9Q5flhlZ6b+MD
         ce7JmTw/iwCDyoQpDFUUi0y2xPYMxXbBKtK976vs6WTj09JNcNYRCKjZvkxeY7koXbmd
         8YyZRPoGWXAWEzrq9apFGvZCxcRFTuRj8bAogA72D1KqC7XvjF1bxarKTnX6EeWJ6rGn
         pHbq6Su38ohiHVZM0vuy//lqorK+NuGntH6yj4c9VXHzKIVuJcrI76wiV1taHn0RjI7N
         BgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vXCLvI8TEyAmbBcLdMXgq4ObYns8B8WMiEotpUKpaLI=;
        b=dXAHYyVJoiNFfvSCW4cZT0DelL4jWUTT6FjZNXr0C/Ja2awrl122cGK0JkaC8dcoey
         x1lQXYGnT5t0237XHRmCz0en6mSmEAMtfJZUOmNeudoSxL0R5hGiVfyGiTT+K3ms9yyy
         AB+nNxOmgQTDrToMvzRxvQlr0ee24ROtPrDdPB0TIcq2mF5c9+VksLCuXwVQwtFrr8Dq
         +/3BV8CX5WLCW7Hg1G8Va5AqlGiUGDRHnFrgohF5kzR7k0EUCFBja03FnauwZdWvAmf8
         yE4VupFR6DaymDNpQ/fvTHd5EdDTv301d1wJ5EBbwu0fzNAyCdgGd1wjyi4i7kqEIjBJ
         Mwjg==
X-Gm-Message-State: AOAM5318ry+1R249M6cTjL/gcjR/LY6arIUF/AcVyndxSPJFl778yZpF
	yuA+84CYY1A8YEMRcEyVuz8=
X-Google-Smtp-Source: ABdhPJzACVpB3QNYZgTGatcLcfz5A8Ffm8zJNdB2Kd/RtyCRxKDE4XOaObIEFLdEvlqZt2WrWLL3DA==
X-Received: by 2002:a05:600c:4b86:: with SMTP id e6mr2320153wmp.78.1617441275004;
        Sat, 03 Apr 2021 02:14:35 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id f2sm15951756wmp.20.2021.04.03.02.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:34 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 13/30] staging: rtl8723bs: remove unnecessary parentheses in if condition in core/rtw_cmd.c
Date: Sat,  3 Apr 2021 11:13:35 +0200
Message-Id: <04aa9d68d6d28d295001dde7cc14f33ef83f8046.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issue:

WARNING: Unnecessary parentheses
166: FILE: drivers/staging/rtl8723bs/core/rtw_cmd.c:2000:
+	if ((pcmd->res != H2C_SUCCESS))

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 840b9da9f2d9..77c583c60343 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1997,7 +1997,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	if (pcmd->parmbuf == NULL)
 		goto exit;
 
-	if ((pcmd->res != H2C_SUCCESS))
+	if (pcmd->res != H2C_SUCCESS)
 		_set_timer(&pmlmepriv->assoc_timer, 1);
 
 	del_timer_sync(&pmlmepriv->assoc_timer);
-- 
2.20.1

