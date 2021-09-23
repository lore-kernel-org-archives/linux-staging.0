Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395C73FCF
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:43 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id i24so4198347wrc.9
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pXCipzl9B56mKxod5ijOn6eiX+PEO+AJkhtqSl6kGI4=;
        b=ZJzST3r+CA9lBGzY3CaQqlpPJx/tgcQlZpizV1JlmMNPOENwdZxOqZRHI81+0L1fd9
         ATgQne5y0bS0a3y5j6vSkxcgEHBUVfaWZuKOmRIjSOU52YucmLCkdNsPr+m3nT3jL/ZB
         9kfAsESrfYYi71qoW7cZkVLrgba8Hw+Qt6B0ubus5YKrRT7+koeaCI1xvHhTdL4o/Num
         +A1aiGyZ08YdOMd/RH6qYS2X6CKf/hz8LNlhDgk5FaEQn//BAexgDhG9IlJRLPg/t6qg
         jhrFJ1C25WdrN/1JD0W43e7tkMaTo2edroqUKKCr/BwisY2Cx4QJtuQnhHH2N69NSR/X
         AREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pXCipzl9B56mKxod5ijOn6eiX+PEO+AJkhtqSl6kGI4=;
        b=wXRgMpnkY5h7G2fJyWRj9A33gcfiapPZsDv5kTePEZP+zBsrM7jOOr1+xAwNURuWd3
         K5fxHAUwaaWqPvIznziIME+OVLGsxQXXEWIBb+4evg4XDNDcVze9ggiDnRioliI4PE/b
         ek1fXwRPlXMbIdJ0OwQdsqPv85czyePBkX8Kx1UP8qvVX8YDbrVgVk9oz+Df55CwI3zO
         cLdtBPJkQePasxUkEsdCsxwjf5wX0hnfAiCWoqqcnQkoiLaOISV7RlTMLj+mF/KJFlpT
         oNtN5UQIzHgerZ7QKKQbjD7UR2QjEqDG5KIQmfmPjhvot+pqjD/ZEeeKuoTZPqFAu4Du
         8wqQ==
X-Gm-Message-State: AOAM531Hxdu+jRVr2EOk+6Q0PgWXt3508FfuG0iL1+NJE0RRL0+hEIq5
	p1LkEDqPrVbYtXtWvTN7nxE=
X-Google-Smtp-Source: ABdhPJwEve5TqBZzzuhVP3S+YKCIlu/pqB2yEWi+lrVE6jFUbCD/aCs2n+Uost4KUD7uZqe/18WTWw==
X-Received: by 2002:a05:600c:2046:: with SMTP id p6mr18334524wmg.88.1632424181658;
        Thu, 23 Sep 2021 12:09:41 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 15/17] staging: r8188eu: remove rtw_setrttbl_cmd()
Date: Thu, 23 Sep 2021 21:09:18 +0200
Message-Id: <20210923190920.3580-16-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923190920.3580-1-straube.linux@gmail.com>
References: <20210923190920.3580-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_setrttbl_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 30 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 31 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 52edf3def405..d8acc6701248 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -815,36 +815,6 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, u8 *psta, u8 entry, u8 enqueue)
 	return res;
 }
 
-u8 rtw_setrttbl_cmd(struct adapter  *padapter, struct setratable_parm *prate_table)
-{
-	struct cmd_obj *ph2c;
-	struct setratable_parm *psetrttblparm;
-	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-	}
-	psetrttblparm = kzalloc(sizeof(struct setratable_parm), GFP_KERNEL);
-
-	if (!psetrttblparm) {
-		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
-	}
-
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psetrttblparm, GEN_CMD_CODE(_SetRaTable));
-
-	memcpy(psetrttblparm, prate_table, sizeof(struct setratable_parm));
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-exit:
-
-	return res;
-}
-
 u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 {
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 9ec0332e96f4..8895874a654b 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -756,7 +756,6 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 u8 rtw_setopmode_cmd(struct adapter  *padapter, enum ndis_802_11_network_infra networktype);
 u8 rtw_setdatarate_cmd(struct adapter  *padapter, u8 *rateset);
 u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
-u8 rtw_setrttbl_cmd(struct adapter  *padapter, struct setratable_parm *prate_table);
 
 u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset,u8 *pval);
 u8 rtw_setfwdig_cmd(struct adapter*padapter, u8 type);
-- 
2.33.0

