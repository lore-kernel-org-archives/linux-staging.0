Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970AB6D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:39 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so2665036wmf.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k4gSFe0DOErEwXm3jMgMd1VdZfPYQ5MK/WIOIxx48g4=;
        b=u5zESPr4xis7ZcOF9UIyGUt8KJF0nt9q/VSw94Ks/Bj4hgpi6uaJQ4gVWmYaik6B14
         KkwlGy65NnpvubQ7FZVat0Z0mEcbA9NUsyWGhGcs7Gn4BzSm5l0CjL8G+OKqI7mspuE8
         LUjG33pPWc63XCbq6I1a3P/jwmQ//oQSigwmpTMt0tADrn1tcDB8Uj443ujQizWrig5t
         BBIaUitTf4J5vHrjAKVqIQ7xpGzj9jxHC0i0MmrivdTQZPuO3ZE0rH6eA4Jq1wUPOJZr
         fAUJYq9ZeE+0jv0HgzMdEt7W8WVQjI2OZx0jQArS6OAFWjSLxn84+4bI1hU7w0HqsYR5
         NDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k4gSFe0DOErEwXm3jMgMd1VdZfPYQ5MK/WIOIxx48g4=;
        b=S7bsQWrBBHZQMEeEjBSuWZ6GNABzOPlGXmh/QYNxsfpjkQzEkBYiYkwyoHGnqRNkln
         9WJ64Hihqh3fHSSEOOAy9oevq8nHWX7nsajDQkseFzB8ubAYNpSyE9BKsow8dz/8b0cB
         c1R2gUNv+OHVshPP+PZ/kJmhQiRgLt/V5ea5u540WomNGo+UxoGGiJgHy3LmCW694vV1
         aIBWToyMZ7JVILxTmD/wBG+cc//yXP1ZaHAyhULluJsyy83S7T+vOi1dm9eXtImAvuM0
         pDgh+nST5t+zD8Kd110AijWuYPgJ5mX1fLAPViewBVLIsuYKAMJRXeJOthCmyMglrgjx
         Cx1w==
X-Gm-Message-State: AOAM5336JxBc1DI83WN3CTB6Ym+icrkYgufcyLwmwcu4KdX86sUw7wgj
	1lzRykLaOIoawjymiMF6IVRvhbYGad587Q==
X-Google-Smtp-Source: ABdhPJy4gh61j3zJslUmrsERM/NqkoD55anqpT/8nNJCg0Y4Iq0jjeZNi9rRnKmiN7GOwf5BemK1lw==
X-Received: by 2002:a7b:c2fa:: with SMTP id e26mr13425514wmk.102.1617384638171;
        Fri, 02 Apr 2021 10:30:38 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id w6sm15221439wrl.49.2021.04.02.10.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:37 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 13/30] staging: rtl8723bs: remove unnecessary parentheses in if condition
Date: Fri,  2 Apr 2021 19:29:55 +0200
Message-Id: <72afa4756d2af668ac47cd50aca6744ea8c20953.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post commit hook issue:

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

