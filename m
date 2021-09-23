Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8893FD1
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:34 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id t18so20223020wrb.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/3E7auhPAOpnBUAf/gz+eWqHtqh/fGf8iCkUoUwRi70=;
        b=blm2VO59OO5q3YGfKyDkmIKoAcXaMrh3mx+SwQ/F5v+7gdVaVd0u5+oGEuMmeBUB0H
         eEKt1NNmXTPdc30XXP6yUBU6ZiKD/QghxlQeNilGj46KWfyfvrwJliGL6bBoQx/W4oeZ
         1sdEzT9ZjilLrmWoh0fTIOYrtJOlgOPUhZMn0hNXdMPwx8m3S3R2Rw1zE+zGDQXjh9eZ
         WrcyYom+/7Xy3GexEwnN6KZrWK20GkVTOKeBNzlVFlAFXGQvDRSOc4YVYXiYk7QMpvAQ
         IbRvsmY4XIaK9fGpMwWSLt/5u70GOZODSl1nbvEGULxQm9/NY/w2g2bu4alOPQPLntnq
         nvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3E7auhPAOpnBUAf/gz+eWqHtqh/fGf8iCkUoUwRi70=;
        b=K9JpsB+zIXwU/yzdZm5Rzmo4mgHhnlD/X/RXoORaSquTLETx/LgXt0Uys++ao2ftAX
         H7mBAYGPRp89/34O81tSMd54Je40joCQFKIpXGLA6/kYAuoyBhBiAv9BbP4f9yqJQ7EJ
         HffRQvSO+IPgKMwq85/HRdgIDhL8E+yj1dDlKimtH93Y/9C1steLaW51K5dQ87NDGrvp
         wLbh8XFPLyxrA0aARykoptWLOTyrCNjfXi/6nTavg+KBHA17RuiVeB0cpZrXt1bzusZb
         fYCq7wnZd7Pyf+zHyZ5pmYgXhYrlEBsvPOe48jUrv+fM3mUNvBY9Cg9SH6s9dnM0ud7M
         ThdA==
X-Gm-Message-State: AOAM5326utzlaKERk03QBSKRoN4qwL2R/ICsXSjfb0wQBTspqeS01lqI
	QjvYnh1Wa8Qz3anQS7S04j8=
X-Google-Smtp-Source: ABdhPJxpJ6cjq5P0pffIq2ICUJpFHbWinVw3TeMWTHt2878YLUrGpvDmiS2KYqaGM+b7Uhqlf7R1nA==
X-Received: by 2002:a05:600c:a08:: with SMTP id z8mr6297420wmp.52.1632424172962;
        Thu, 23 Sep 2021 12:09:32 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:32 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 04/17] staging: r8188eu: remove rtw_getrfreg_cmd()
Date: Thu, 23 Sep 2021 21:09:07 +0200
Message-Id: <20210923190920.3580-5-straube.linux@gmail.com>
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

Function rtw_getrfreg_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 36 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 37 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 3a3a56078138..f066858b84c9 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -605,42 +605,6 @@ u8 rtw_setrfreg_cmd(struct adapter  *padapter, u8 offset, u32 val)
 	return res;
 }
 
-u8 rtw_getrfreg_cmd(struct adapter  *padapter, u8 offset, u8 *pval)
-{
-	struct cmd_obj *ph2c;
-	struct readRF_parm *prdrfparm;
-	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	prdrfparm = kzalloc(sizeof(struct readRF_parm), GFP_ATOMIC);
-	if (!prdrfparm) {
-		kfree(ph2c);
-		res = _FAIL;
-		goto exit;
-	}
-
-	INIT_LIST_HEAD(&ph2c->list);
-	ph2c->cmdcode = GEN_CMD_CODE(_GetRFReg);
-	ph2c->parmbuf = (unsigned char *)prdrfparm;
-	ph2c->cmdsz =  sizeof(struct readRF_parm);
-	ph2c->rsp = pval;
-	ph2c->rspsz = sizeof(struct readRF_rsp);
-
-	prdrfparm->offset = offset;
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-
-exit:
-
-	return res;
-}
-
 void rtw_getbbrfreg_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index fca02454c8d1..0d5c7ac5aa64 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -760,7 +760,6 @@ u8 rtw_setdatarate_cmd(struct adapter  *padapter, u8 *rateset);
 u8 rtw_setbasicrate_cmd(struct adapter  *padapter, u8 *rateset);
 u8 rtw_setbbreg_cmd(struct adapter * padapter, u8 offset, u8 val);
 u8 rtw_setrfreg_cmd(struct adapter * padapter, u8 offset, u32 val);
-u8 rtw_getrfreg_cmd(struct adapter * padapter, u8 offset, u8 * pval);
 u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
 u8 rtw_setrttbl_cmd(struct adapter  *padapter, struct setratable_parm *prate_table);
 u8 rtw_getrttbl_cmd(struct adapter  *padapter, struct getratable_rsp *pval);
-- 
2.33.0

