Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404483FD1
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:39 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id i23so20217781wrb.2
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qpY4lAn9+8GdFlEaQagQeHPY8znyBrcDih9HJ8uepwk=;
        b=Kq5bbdmqHwTtulLagybwfLm8WUr8jQYtqR2XM9rkZ46pgoMWv7yjrOHBtdqf0JVs6Y
         I7csBTvELQgfGyHYbyrSLOAYGHBQHJtpOatjdn+9OD73RpC87fRCy8ZvrhDoJM9n/BBA
         cLI25g5vU4YFOY+sWH3tn08S9CLFkCGDm35rUwEZUvuB1Hv1MZTEEa14PF27M8AqqdfF
         NsvTHRnS8H6JnGT5iBwTrt8+3Yc9KF65vK7niju7lGdrfuJsON3ZTSQ9dkME70luYkPD
         hc1JiCgAr5+ChwfJ4tHAzbZRuYF9+sP0wPf7rC8CmgLKicB4qXjD6uZkZkwWtWIxoH63
         RWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qpY4lAn9+8GdFlEaQagQeHPY8znyBrcDih9HJ8uepwk=;
        b=JyX1GGQNjxy1Hj3YSURsQXLHzEwTxoXV5OVgMA1YaHnYZ39aTT1o8DyXz+gIgd2/iM
         6SL5mtrRzT8fDHFM8MAi7hBTMLwyxoY0xcdest7hfJgf29lhH8oYUiMuHCZwgFoxk/ro
         GIJUMIzbJsWgvtW/Zvxx7qrZ4sMpCyBI8Wph8YrxMAYWHRH9zwcZmHFo4+CgqV0PUr7z
         hFAfEcjlQOSgR2LonL1y92UW2bIsTMvGSUnUY5G2U1Qi9JioqL8c3beNIGeY4NvEPksB
         HsZQf00yvZyf4MHob9lOa3DB/55sVRo2+xygmbCM7AZNx3gjpeXuU6YqyvqA9hoI5bQJ
         5wfg==
X-Gm-Message-State: AOAM530ljQWCo0T05kRQiExs1jP2c7iVk/OkU3ovv2eJ0P6s5Ugt1CGQ
	pnUUFEpf1MAw0nrAc0LPZp0=
X-Google-Smtp-Source: ABdhPJzzrFV0ZOZ4xjAggpSY0OQDV1EfA95LoECilRK7hbAgL3F+PKGly+jeRWitazQ8tz/Y5PRslw==
X-Received: by 2002:a05:600c:241:: with SMTP id 1mr17865120wmj.170.1632424177455;
        Thu, 23 Sep 2021 12:09:37 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/17] staging: r8188eu: remove rtw_setassocsta_cmd()
Date: Thu, 23 Sep 2021 21:09:13 +0200
Message-Id: <20210923190920.3580-11-straube.linux@gmail.com>
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

Function rtw_setassocsta_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 42 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 43 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index c7ac4a100367..c2be84b474f9 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -975,48 +975,6 @@ u8 rtw_setrttbl_cmd(struct adapter  *padapter, struct setratable_parm *prate_tab
 	return res;
 }
 
-u8 rtw_setassocsta_cmd(struct adapter  *padapter, u8 *mac_addr)
-{
-	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-	struct cmd_obj *ph2c;
-	struct set_assocsta_parm *psetassocsta_para;
-	struct set_stakey_rsp *psetassocsta_rsp = NULL;
-
-	u8	res = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	psetassocsta_para = kzalloc(sizeof(struct set_assocsta_parm), GFP_ATOMIC);
-	if (!psetassocsta_para) {
-		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
-	}
-
-	psetassocsta_rsp = kzalloc(sizeof(struct set_assocsta_rsp), GFP_ATOMIC);
-	if (!psetassocsta_rsp) {
-		kfree(ph2c);
-		kfree(psetassocsta_para);
-		return _FAIL;
-	}
-
-	init_h2fwcmd_w_parm_no_rsp(ph2c, psetassocsta_para, _SetAssocSta_CMD_);
-	ph2c->rsp = (u8 *)psetassocsta_rsp;
-	ph2c->rspsz = sizeof(struct set_assocsta_rsp);
-
-	memcpy(psetassocsta_para->addr, mac_addr, ETH_ALEN);
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-
-exit:
-
-	return res;
- }
-
 u8 rtw_addbareq_cmd(struct adapter *padapter, u8 tid, u8 *addr)
 {
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 0881c9b99dac..6a8dbfdf0bc4 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -744,7 +744,6 @@ struct TDLSoption_param
 #define H2C_CMD_OVERFLOW	0x06
 #define H2C_RESERVED		0x07
 
-u8 rtw_setassocsta_cmd(struct adapter  *padapter, u8 *mac_addr);
 u8 rtw_setstandby_cmd(struct adapter *padapter, uint action);
 u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 		      int ssid_num, struct rtw_ieee80211_channel *ch,
-- 
2.33.0

