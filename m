Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD91C259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 14:10:11 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id k128so4593908wmk.4
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fwdqSVIbe15EmqulmndVdLGM1V+ZcYJqDXqI1hmDV28=;
        b=VBer9f3DAOxB1cCPffZZLO2RR3/J0z3qlkX43eJRedsZ6IrEH3y7gUYjVZ8wVi3Oj7
         EZ6JTqhBbi54cr+hgBDo8E1ewiDTUdZKMI/K+w4xVxowXXPFUdcuTXXX0AejKrSqbWdT
         FeVULcbxNuAL1HrsdPUKW3ttgyfA3qAEj3WLGmKHSR29ZH6HWID6t7nBDfIQV77pEKwB
         qN9I2HGHI2Pqiye6MFpGp5MynKHpcGiJc32YWtnrHsz6lHGVgxg9Wd0PzTbNcobPFNud
         Gtplx+8tkaSU0BpSezhUVkcAS2Mg/QbaggDuP4MzisWy67LKMM7eDOImRFhmv4QUlWCp
         ieAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fwdqSVIbe15EmqulmndVdLGM1V+ZcYJqDXqI1hmDV28=;
        b=mzgA5sOo9lZYpxVH+7K7/9U5f/CXPiB+ZljX/lQHR9354W1AWunDG9KCWYjs7JR7mk
         I3ITjRSIo4NK9DT9SP0P8b6eaUxSniiOUNDiludj8ugxhSNM1PrToAJQjItLbJHiwnF1
         Cx69HrKkonHrrgabYzdLie+ns6UjtrcvQODYu8Tf25IO4lAx24JMrnwkGHQ7yFxn8mdy
         XlrPF33kconj/aDH4V66mzdao9u0nlqJ3FztglAN1moudOV0LplldyxbQnEyc+3CLjBK
         zzHpVCP/Bzy9X00Ffh8beZkxL0V02vvedqjioeYym0NeONl1En/ahZKzRRl3UyrNoWo7
         Wr4w==
X-Gm-Message-State: AOAM530kfb9waUlV1iqe79G8X+20Wfb1BqUe2BehqIpTt2Bv3XZf9edC
	Sg+DVzZSpP4L0ET4qiLh5Kk=
X-Google-Smtp-Source: ABdhPJzF+Yig3TAyX1vKL9bvoUUusKxnfp833KBbej5ymuHrpgUeVKSri3ZLwa4t9OPGonmYJSUR1A==
X-Received: by 2002:a05:600c:4d13:: with SMTP id u19mr5400406wmp.16.1617545410337;
        Sun, 04 Apr 2021 07:10:10 -0700 (PDT)
Received: from agape ([5.171.81.112])
        by smtp.gmail.com with ESMTPSA id l9sm18106041wmq.2.2021.04.04.07.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 07:10:10 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH v4 12/30] staging: rtl8723bs: fix null check conditions in core/rtw_cmd.c
Date: Sun,  4 Apr 2021 16:09:28 +0200
Message-Id: <03e36e1710ea4dfd07c3753d9a8df5746e59bc18.1617545239.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617545239.git.fabioaiuto83@gmail.com>
References: <cover.1617545239.git.fabioaiuto83@gmail.com>
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

