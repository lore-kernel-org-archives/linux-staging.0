Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C9C2CA0
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 04:59:04 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id oa4so7320724pjb.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Oct 2021 21:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Oj6YG+UlK0BMEsdxLQ+T4Tix49m1GM1wb9CYFVKaWKs=;
        b=Xs/SmSSe9dVc+xLlPgbcLjZwe1Qt2jRxYUfaenKnlQLSWEzGYl3A3BQ0SeP4NRPhUL
         YwOpI5IJub93JnWyb3mmMobKtuTQjItwtU+Dl1Iv9Fb8VkILoohNNMkCwmgCQf71m+DS
         /powvxRclzw+zYfh2RFctqFzFPFGSootaFM9+A0ViRhGaPrAe/3NkXQAidATfPcVTGD7
         cvqlqpfo2ZzfOBlQBDq685ZHMZnU3ES/NoTprV2/+/pF007L/cdZTL2AvvYgfztTSXtD
         Armm+nUa1AZpAE5lmcSvFU0LXIFMdSEa/3WYDlkYGfc0gu8s+9aOdKRbrxS5nZw2sRMJ
         NS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Oj6YG+UlK0BMEsdxLQ+T4Tix49m1GM1wb9CYFVKaWKs=;
        b=aEDPUYlTTa0742LbWYnxQ6NrJcOTMofQPGGCvAJAdGngb++hQRvrIjTG00JCVLVHuy
         Md+6lQkl8VWAUoezD8AdxZhe5Htv0ffMDSuT6/Y5MBSWZMtXBptGS8lfoiauHNSTpY18
         6CkQwbH4un2n2oYiUMlzIb3CMF5jHkFJDRnQ+300m4C+ggPLW1AuZz0lSEED5YjxUQkd
         4e2Ai9ZhCNgC2gI0lHIVFQ8SMvJ/GzWXLLx8EDtjIsYLEY51abwC1KiNpkuLrMo6l1ss
         Hus/i67h8+FE6aMMVttG/YThjYnzaT4rAutO99ptLFDbkGhzKGlP1mnv75Slj/XcsmNR
         NWgg==
X-Gm-Message-State: AOAM532BAXCF1JH1vU2+dhYVfBcctdBrpgpAdUQuB+zqo4DvDIQq50WL
	TvUKbg8QezSGhmpQMD1mjis=
X-Google-Smtp-Source: ABdhPJyjYb/DGDbMmIHgrxoGNgXujXBJlrSpqm+WDbSqOpr/weri4sUBP3gcRbXO6tA98JtdfOJz5g==
X-Received: by 2002:a17:90a:7e93:: with SMTP id j19mr33055907pjl.172.1635137944352;
        Sun, 24 Oct 2021 21:59:04 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.95.3])
        by smtp.gmail.com with ESMTPSA id q16sm19639434pfu.36.2021.10.24.21.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 21:59:04 -0700 (PDT)
Date: Mon, 25 Oct 2021 10:28:54 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: avoid use of goto statement
Message-ID: <YXY5jtR6neQ+ad+C@Sauravs-MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove the goto statement from _rtw_init_cmd_priv(). In this function
goto statement can be replace by return statement. By replacing the
goto statement with return statement local variable "res" is also
not required.As on goto label exit, function only return it is not
performing any cleanup.Avoiding goto will simplify the function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e17332677daa..22046bd5cf82 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -19,7 +19,6 @@ No irqsave is necessary.

 static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
-	int res = _SUCCESS;

 	sema_init(&pcmdpriv->cmd_queue_sema, 0);
 	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
@@ -34,28 +33,23 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ,
 					      GFP_KERNEL);

-	if (!pcmdpriv->cmd_allocated_buf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!pcmdpriv->cmd_allocated_buf)
+		return _FAIL;

 	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((size_t)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));

 	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);

-	if (!pcmdpriv->rsp_allocated_buf) {
-		res = _FAIL;
-		goto exit;
-	}
+	if (!pcmdpriv->rsp_allocated_buf)
+		return _FAIL;

 	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((size_t)(pcmdpriv->rsp_allocated_buf) & 3);

 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
 	pcmdpriv->rsp_cnt = 0;
-exit:

-	return res;
+	return _SUCCESS;
 }

 static void c2h_wk_callback(struct work_struct *work);
--
2.33.0

