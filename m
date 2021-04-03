Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1846D09
	for <linux-staging@lists.linux.dev>; Sat,  3 Apr 2021 09:14:34 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id k8so6548436wrc.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Apr 2021 02:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fwdqSVIbe15EmqulmndVdLGM1V+ZcYJqDXqI1hmDV28=;
        b=B2zKceQJMvJZps4KGFbrQ/dcZmkQUpB+C30A4wehgt5gfKeMeeEvQXrgmTNZ4Jvcnw
         LLkB7ByBIIwxsoyKNRiASU6qQy7q6uSo2CJkj2vjV0X3OiUyE3KWKgAgU8UyOC7ZJF37
         pYwEYQd+IuQrZKkqnrpoRFByq0oTnj5RB3zasfTF+/Qe6MaqD+GgurWwQskRDRkhl8bf
         6nGTC3AKgNQpj/azbxcDzTj9FFMfNFUKXDSQqKVy/xec1rLFMjdTAA1GA7dWAfymdlD/
         UPhWP9mIYjvRh3xDH89sjO+ZWK3mmQ2STjMXGJtTUp+3LhAPiUoJOzplbP4XIFYUvu3X
         S77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fwdqSVIbe15EmqulmndVdLGM1V+ZcYJqDXqI1hmDV28=;
        b=h0YbjPKPzHu9XRvBKBjU9qBaMwl4gP6VhkWlEnbukDOzHlQ6Z2KIFwT0+Sr9gd78iz
         cC09384TDhOoXAYmKw5arH0l6Ryh5e4Y+ENCpRx3AtAwmN8i8qg+Om1x+7Akb1N/Fe7n
         nV8uvrkn06/FiUm4sp+BcHC85DlOR7vmuhPl1TUDeg+Mz844K0BrDpbPh9Et1B/aqrLj
         TXMkCwAX8fa6mQhG9yGLr2H11SUB6u3SK5tH9IRq+CCa9KkV2p8FKq4WYnqHT7IZ45ys
         cIh1eNoT59toQ1chmo0y1qmJBfe1RkJBlsn+ri3X4F3hwGUgdbjxW0hsclL2bYIrYhDt
         ayhQ==
X-Gm-Message-State: AOAM532rwW07lsffJi5Jje4AvcTaAC6SJsy5B1mZXZjU4cMK/vHKef6x
	rHHCabb4FabC80MFZZQnpaaKggGL26A=
X-Google-Smtp-Source: ABdhPJyIuN1hBeQSCQvNnXuY1JY4jFiY2leEdEiS2S9ELnW4xNibCq8/wqSnOGzKyEs2RNlLCe0j0Q==
X-Received: by 2002:adf:ec8c:: with SMTP id z12mr19217699wrn.405.1617441273494;
        Sat, 03 Apr 2021 02:14:33 -0700 (PDT)
Received: from agape ([5.171.72.64])
        by smtp.gmail.com with ESMTPSA id c131sm15748535wma.37.2021.04.03.02.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Apr 2021 02:14:33 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v3 12/30] staging: rtl8723bs: fix null check conditions in core/rtw_cmd.c
Date: Sat,  3 Apr 2021 11:13:34 +0200
Message-Id: <03e36e1710ea4dfd07c3753d9a8df5746e59bc18.1617440834.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617440833.git.fabioaiuto83@gmail.com>
References: <cover.1617440833.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook checkpatch issues:

CHECK: Comparison to NULL could be written "!psta"
178: FILE: drivers/staging/rtl8723bs/core/rtw_cmd.c:2012:
+			if (psta == NULL)

CHECK: Comparison to NULL could be written "!psta"
198: FILE: drivers/staging/rtl8723bs/core/rtw_cmd.c:2066:
+	if (psta == NULL)

CHECK: Comparison to NULL could be written "!psta"
211: FILE: drivers/staging/rtl8723bs/core/rtw_cmd.c:2081:
+	if (psta == NULL)

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 2086df056c44..840b9da9f2d9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -2009,7 +2009,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		psta = rtw_get_stainfo(&padapter->stapriv, pnetwork->MacAddress);
 		if (!psta) {
 			psta = rtw_alloc_stainfo(&padapter->stapriv, pnetwork->MacAddress);
-			if (psta == NULL)
+			if (!psta)
 				goto createbss_cmd_fail;
 		}
 
@@ -2063,7 +2063,7 @@ void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pc
 	struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp *) (pcmd->rsp);
 	struct sta_info *psta = rtw_get_stainfo(pstapriv, psetstakey_rsp->addr);
 
-	if (psta == NULL)
+	if (!psta)
 		goto exit;
 
 exit:
@@ -2078,7 +2078,7 @@ void rtw_setassocsta_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *
 	struct set_assocsta_rsp *passocsta_rsp = (struct set_assocsta_rsp *) (pcmd->rsp);
 	struct sta_info *psta = rtw_get_stainfo(pstapriv, passocsta_parm->addr);
 
-	if (psta == NULL)
+	if (!psta)
 		goto exit;
 
 	psta->aid = passocsta_rsp->cam_id;
-- 
2.20.1

