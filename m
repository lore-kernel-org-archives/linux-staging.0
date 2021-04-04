Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E14D70
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:13 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so4472633wmi.3
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vXCLvI8TEyAmbBcLdMXgq4ObYns8B8WMiEotpUKpaLI=;
        b=h09SrG+r+5CWjgigGT0BYGHjCzEwKi9mzCR2/48D2LF+znv236NDVYDzokxR7YrGwZ
         YSpEIcDzYxtR3XMR62416DflGpVuxe0aphmwNYjVoOYyTpPiLetpYjW0tm1aTw9eRNBD
         1HVKba+p5cHJ7/b/r6+e1UE55uP+m9aJo70jNpvZiIOB/TjP/7SvckO6ObEIRrwwipHH
         czPibnUzdxlLX+n//pyom/p+h5rXkotiqGqGm0mEnmjimYRjzlivkQ3k3Lu/eL3JQ0pB
         ZtILhv0HvNx1906e97kyvEyrbfJw7IaWdHbBKTmv0bgUn273l3MrVeP4+1V+cvoBkO5b
         Vc6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vXCLvI8TEyAmbBcLdMXgq4ObYns8B8WMiEotpUKpaLI=;
        b=PCo+iIpBD2KWA2ZXWQdWd25mGF19Lt4/yrahgJjFAwxKDOHcL45BuaMZ2F5RmIpyA4
         uNlqJ9B852EjnNM6nMu+rVBTO/NIEzKUrzSe1gquPrYfoki6T5FkFVvZt4CcgAur9Hyb
         AE9u6Suef44e9L6oKThX/k52s09NQB2dsgel7RwHqP2d032qeLHGZYtsf18CsYqCus8h
         4gBdVKFSuty2ZSnhpOAXddh96IZe3Sj1ZQ5RFPW2eS4O3cL0GoV2u++0Tx+cL2z4GS2t
         DVC6kvIFgIPUcoiGkcJpU6cp9VKoyynJ2p85eHDfULQ5euP2Oo6NtWMHdTp02WRp/9/9
         A+kA==
X-Gm-Message-State: AOAM532Ck6Q5kOQVc8i1NPRrioPAi7Fj36nbYGtxWfHsmAST1sJK3EKc
	uT/WidofZ04FAIYZ9K2H/U8=
X-Google-Smtp-Source: ABdhPJwpr3wIitZZJ4lIhFVwC/axsTBKKp2IXt1abjIudRj2qB48XB6qJs2ZNtaZh7tbTyUz5e9WXQ==
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr21034711wmf.3.1617545411881;
        Sun, 04 Apr 2021 07:10:11 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id k16sm11319725wro.11.2021.04.04.07.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:11 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 13/30] staging: rtl8723bs: remove unnecessary parentheses in if condition in core/rtw_cmd.c
Date: Sun,  4 Apr 2021 16:09:29 +0200
Message-Id: <04aa9d68d6d28d295001dde7cc14f33ef83f8046.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
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

