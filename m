Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449223FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:35 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id t8so20249165wri.1
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mrvQ0p7+b34ITxdOkKkNl0wjAhGlBKLvFTnzxnjmEVc=;
        b=ntK567MBYgBjHOQuT29qjH3GHHpcEakz5TY50mv0SfbJhH4gUdd0J0qFgunTQmxPTn
         ZyH43DYvniVIAIDy7SmsTv98dQCO9LOR4AE34P2YVr+OWw4cW+oGfvaRRI4ibukf0lZc
         4GJ2TA/X1gDaJ9XWC1Zkug1QcjWTiOYPAtvpUdjKSeL8n/Xl5iqgbp3HWI0i91UcEPVg
         wIDhoJoQV4ke4BvwEAKL80dyO3a05VnURv/IXvJTGSFMqlgmb6SpI+IIxhV/0Ekqs/ka
         ZCntL/0WPtLKCj11IeMiPKvFMxlGY5ffDONkoIdn3LgADxB55871XGAnEYduYfBTFkuF
         nlYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mrvQ0p7+b34ITxdOkKkNl0wjAhGlBKLvFTnzxnjmEVc=;
        b=kcKeGmv+QqG/BgxadYdpiognKD/5zZn8QB5W1bjwfNBkHjaVMdXY+wiyXXCuQRb2Xu
         GfweQkThRvglAWlTuxMkrev3gj12fEN5Jbro3ydRkcL1J6VA2TOBXsCjL1Yg7qNsQR3x
         DFWsDwsU4/tDEuIZJcMm9TDORF3Js8EVDoSZ+1zlw0DKtV/P4ScB+G8jd2tDrDTEJCy/
         xbTVPZvwDe5AcF+b78TskwJuFuG/fPuMB46JVDaoOLarOgqL3miS7Y9ZCCeVm9aYLmGf
         8CsEMqYFAdqu8dpqSopLIVbHpax/yAmbcNkvtN71PC3QMrRsRZFSi5Ev8Q5nipKJrTyA
         cW1Q==
X-Gm-Message-State: AOAM531eNbfsG8nX0AwPuDsUY5gE33mccdNeqB0YVjipAtEzc0mL+Dwd
	qTeVtKoDOUZOdn6o2K+G54M=
X-Google-Smtp-Source: ABdhPJyODI2iqR8cpGcVfPSQNtGf5kCUGlmCR7z/T+M0AJ2uD0ujLE12kazA84VIITfrSphlqrNXKA==
X-Received: by 2002:a05:600c:3209:: with SMTP id r9mr17674890wmp.132.1632424173762;
        Thu, 23 Sep 2021 12:09:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:33 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 05/17] staging: r8188eu: remove rtw_getrttbl_cmd()
Date: Thu, 23 Sep 2021 21:09:08 +0200
Message-Id: <20210923190920.3580-6-straube.linux@gmail.com>
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

Function rtw_getrttbl_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 37 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 38 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index f066858b84c9..df835d0afc19 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -981,43 +981,6 @@ u8 rtw_setrttbl_cmd(struct adapter  *padapter, struct setratable_parm *prate_tab
 	return res;
 }
 
-u8 rtw_getrttbl_cmd(struct adapter  *padapter, struct getratable_rsp *pval)
-{
-	struct cmd_obj *ph2c;
-	struct getratable_parm *pgetrttblparm;
-	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-	}
-	pgetrttblparm = kzalloc(sizeof(struct getratable_parm), GFP_KERNEL);
-
-	if (!pgetrttblparm) {
-		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
-	}
-
-/* 	init_h2fwcmd_w_parm_no_rsp(ph2c, psetrttblparm, GEN_CMD_CODE(_SetRaTable)); */
-
-	INIT_LIST_HEAD(&ph2c->list);
-	ph2c->cmdcode = GEN_CMD_CODE(_GetRaTable);
-	ph2c->parmbuf = (unsigned char *)pgetrttblparm;
-	ph2c->cmdsz =  sizeof(struct getratable_parm);
-	ph2c->rsp = (u8 *)pval;
-	ph2c->rspsz = sizeof(struct getratable_rsp);
-
-	pgetrttblparm->rsvd = 0x0;
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-exit:
-
-	return res;
-}
-
 u8 rtw_setassocsta_cmd(struct adapter  *padapter, u8 *mac_addr)
 {
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index 0d5c7ac5aa64..3a12ca83af00 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -762,7 +762,6 @@ u8 rtw_setbbreg_cmd(struct adapter * padapter, u8 offset, u8 val);
 u8 rtw_setrfreg_cmd(struct adapter * padapter, u8 offset, u32 val);
 u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
 u8 rtw_setrttbl_cmd(struct adapter  *padapter, struct setratable_parm *prate_table);
-u8 rtw_getrttbl_cmd(struct adapter  *padapter, struct getratable_rsp *pval);
 
 u8 rtw_gettssi_cmd(struct adapter  *padapter, u8 offset,u8 *pval);
 u8 rtw_setfwdig_cmd(struct adapter*padapter, u8 type);
-- 
2.33.0

