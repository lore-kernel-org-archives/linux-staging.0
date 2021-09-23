Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727A23FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:33 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t18so20222819wrb.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=doDk7RUtFMDUp7hgyLWsA1aVYygB5CnnTWl9G24Whkk=;
        b=RhqiiZKtQ+IRDox4XlAjdw+RWey5oYfQ1+3ISFjYRCTg8tC4x0aicIGhs6GFHdWGQi
         WE0zPwOtP9KdwyrpkjIdDLRtwph9mEOtc1mXlj2Wc4VICVqnJaNy7u/iHqfk1YgabQRw
         9ZUkWcQsu4KcHN9UrW8MrUHV+FReruxUqdiouM9rjkI5nRnxBG6ucMMiKBat/8VJ5dbK
         PtfZzWaton6q/ExcosJW3E2AP97QtcQEneFbWG6uphXjohoD5tgMshTMXiifbdk/CY2B
         yl1DTN8qYffKl7kBvUOZThVbIZht/AQ562nrmGC6WvBUTXJrdoeOw3J/QZ1mNnFk5Ypg
         QYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=doDk7RUtFMDUp7hgyLWsA1aVYygB5CnnTWl9G24Whkk=;
        b=5+fPFS+XnnUal7QNjKJUunRyr6EAODmd/VmghoV/JqQFUpiCCnumLBWvabKbDNwDbX
         GdwRcrefnyDXql+LywOzeaEgUcO+57tg0GC7Hbw3ohw0cYI/ItoPvEz0H8SDjOQ1KCt1
         DS+lHJSoS9B6YCLx/7x3H6PYKaZGmU24KVXyC0FaZYLU8LAWYg4y+DxrieOtASGe7uNz
         T/pYG83hDwiaf15NujUJD1npNSuZKyUjyF97d34Mcg2UYPtPqgZ0cLii7e39cdx6ihoa
         VO8Q3tRp7AJZASabMC3TCFIZ2/SPsum9L4iIVf7MU0vl5FtYVwRjAfCpOXjkIJurbaMA
         QLFA==
X-Gm-Message-State: AOAM5335S5xnoZW6Che2DO7MzRdB8R2j0NXv2Ycpl+5xcL89FxL1kYdW
	TdzOqcxhdVzeQZYdg4PMUWE=
X-Google-Smtp-Source: ABdhPJy5quB4fAo1r1ALhknN3vt5PekwbZOfvLGItiSUAibr/jOhUh1AUeKJZmL0opEjncySqnCSFQ==
X-Received: by 2002:a05:600c:2d45:: with SMTP id a5mr6193115wmg.39.1632424171879;
        Thu, 23 Sep 2021 12:09:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 03/17] staging: r8188eu: remove rtw_getbbreg_cmd()
Date: Thu, 23 Sep 2021 21:09:06 +0200
Message-Id: <20210923190920.3580-4-straube.linux@gmail.com>
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

Function rtw_getbbreg_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 34 -----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  1 -
 2 files changed, 35 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 972c47136b1c..3a3a56078138 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -574,40 +574,6 @@ u8 rtw_setbbreg_cmd(struct adapter *padapter, u8 offset, u8 val)
 	return res;
 }
 
-u8 rtw_getbbreg_cmd(struct adapter  *padapter, u8 offset, u8 *pval)
-{
-	struct cmd_obj *ph2c;
-	struct readBB_parm *prdbbparm;
-	struct cmd_priv	*pcmdpriv = &padapter->cmdpriv;
-	u8	res = _SUCCESS;
-
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
-	if (!ph2c) {
-		res = _FAIL;
-		goto exit;
-		}
-	prdbbparm = kzalloc(sizeof(struct readBB_parm), GFP_ATOMIC);
-
-	if (!prdbbparm) {
-		kfree(ph2c);
-		return _FAIL;
-	}
-
-	INIT_LIST_HEAD(&ph2c->list);
-	ph2c->cmdcode = GEN_CMD_CODE(_GetBBReg);
-	ph2c->parmbuf = (unsigned char *)prdbbparm;
-	ph2c->cmdsz =  sizeof(struct readBB_parm);
-	ph2c->rsp = pval;
-	ph2c->rspsz = sizeof(struct readBB_rsp);
-
-	prdbbparm->offset = offset;
-
-	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
-exit:
-
-	return res;
-}
-
 u8 rtw_setrfreg_cmd(struct adapter  *padapter, u8 offset, u32 val)
 {
 	struct cmd_obj *ph2c;
diff --git a/drivers/staging/r8188eu/include/rtw_cmd.h b/drivers/staging/r8188eu/include/rtw_cmd.h
index ce47ad21c087..fca02454c8d1 100644
--- a/drivers/staging/r8188eu/include/rtw_cmd.h
+++ b/drivers/staging/r8188eu/include/rtw_cmd.h
@@ -760,7 +760,6 @@ u8 rtw_setdatarate_cmd(struct adapter  *padapter, u8 *rateset);
 u8 rtw_setbasicrate_cmd(struct adapter  *padapter, u8 *rateset);
 u8 rtw_setbbreg_cmd(struct adapter * padapter, u8 offset, u8 val);
 u8 rtw_setrfreg_cmd(struct adapter * padapter, u8 offset, u32 val);
-u8 rtw_getbbreg_cmd(struct adapter * padapter, u8 offset, u8 * pval);
 u8 rtw_getrfreg_cmd(struct adapter * padapter, u8 offset, u8 * pval);
 u8 rtw_setrfintfs_cmd(struct adapter  *padapter, u8 mode);
 u8 rtw_setrttbl_cmd(struct adapter  *padapter, struct setratable_parm *prate_table);
-- 
2.33.0

