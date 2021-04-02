Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD366D09
	for <linux-staging@lists.linux.dev>; Fri,  2 Apr 2021 17:30:37 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so2665005wmf.5
        for <linux-staging@lists.linux.dev>; Fri, 02 Apr 2021 10:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NlEtSw2yb334S6OHokyLqfSbSWsCFUXj1IQBpWYM0ts=;
        b=VbTD3U5r1eU4nnsEYo9lsrcPWFqDblP226l2xygxMUP3JZb4Cu6WmtzONpdZHWj351
         gyEY4F3oICMNl9DlTFK+7avj97Xkbjz1LJ4lhU1fN4R68ziTUgr1f0gfuQy3Ksor1b22
         6Hj1XChCjWTDK1dQQjGBIqR4F9NimLao22uXUWcf52+CXTHrY5kGDsl+gNPq+iQEMuIP
         3EqGlbdvrp3xmhBni7eg64a9zfzlOcfNByA0eKVYtIq8DAS/U9qkkrH3RQjy1hnmNN4u
         oygORwchjVKMv1k/ckrJHP763GMUM3UTclNBkUmtMB8et95r/yUpKVy3yHAArK2Tolb+
         PHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NlEtSw2yb334S6OHokyLqfSbSWsCFUXj1IQBpWYM0ts=;
        b=cX997hzoFs+cq932qs0XK8mSoAWF7DJYlYnNBTEceaxkbYhEsfE11aNW9n/WlC217i
         GgptziPtR/FROak5n2QuWqjTcBSMMBr2g8NHBQTlcPyatPdPkvO8U1aJgIMhEt8L11Ep
         Vf5qhDS9vsyR2xVFnfECBtcVomhLpllSYUpaqx3Ml/4FZUY7j9PH0O2ybMUEvUYKKftM
         9bgLe0fllfR6/t52yzk1Ht23UMlyicjZgfUI1vhg8IqeuYE6hmim/VMtUJlyEdSoIkvR
         2Qo1jlWvu9bGxwjWRSRxW8FDXC5K2cQ8R02jpLoFcHVMEG1ufLyUOZ1lMX4R8plq5TTR
         IfXQ==
X-Gm-Message-State: AOAM5310vcFod9GNtM7Y8JA3CnCYzoFiXBDPg+GTsQCGupdjX4MaT0Bn
	n8arSRlKm5EG6HLJb64JyMw=
X-Google-Smtp-Source: ABdhPJymXxsrngrTgJcwC1rZrqmuNQR+PcysFvJfwU7RP5opn8hl/0wvGxsmX9HrgCtIuXRzChyb3Q==
X-Received: by 2002:a1c:a98a:: with SMTP id s132mr14185665wme.12.1617384636584;
        Fri, 02 Apr 2021 10:30:36 -0700 (PDT)
Received: from agape ([5.171.81.4])
        by smtp.gmail.com with ESMTPSA id x12sm3894409wrr.7.2021.04.02.10.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 10:30:36 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v2 12/30] staging: rtl8723bs: fix null check conditions
Date: Fri,  2 Apr 2021 19:29:54 +0200
Message-Id: <dbb5f33f55441a4ea296da685a31833d7990bf6b.1617384172.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617384172.git.fabioaiuto83@gmail.com>
References: <cover.1617384172.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix post-commit hook issues:

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

