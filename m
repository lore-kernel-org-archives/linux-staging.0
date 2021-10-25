Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372492CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:36:08 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id l186so4677086pge.7
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=t4OQ66ZvBHAyhJ9uVXpAWQYYGEql5QgeKqi/VqWJk5A=;
        b=ns7WA1FnYweLTagGyjWNWbcw/2lrTx9JxiO/LTCLl5ud8GGsBGFhNc1covjTQoCyhc
         fMRzqFPA9+9qjWToypMCQU1oxCmhueld5xoARON/OTXMpfkFNtw/pEoWvzazch4EQlYW
         q5Mvad7YuoLqaUy9C7PaQxpR24y/NSOh28hDh19t3B8PzdpTcgPN7RpO15j0mi/KuHsR
         eAhnzyP4zN/DazCZFxnP0CHMPhHtvLjLvMfULrM9Zl07eb5EocL7y+HLzR8eJIxHs0mV
         Qh8NaDK2tJdL0qVpcn55LY1mV9yrUXgnpN54NxRIh+JkW0Os1K/jn2j6qPa47085cwej
         b1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=t4OQ66ZvBHAyhJ9uVXpAWQYYGEql5QgeKqi/VqWJk5A=;
        b=Khhm4P0h3a8mSC0+s+7QuosH2rfzJ7Ha7Xn4YCIjwKJcAsK6Nq7uOYP2//5CIzPyiZ
         mTZj6ow0jo7lLEjdZuYFIzMUxW7ZriRr6BhTDiWZ7rM6pmRdQ9Vms3IJ+QsN5NmyzBAc
         JoPAEMZ8jtjxTLdiNNWBsyRz5aO4Ms2j083/4vfqAchzqQuEog2yrR9U9PPacqSvsvVS
         FWvc2TtbBV8JpAnbyL/sxbhqtFfUZ7zv22IpjeUUlrLcKhjcSE9orlCJagjqzinLUKFP
         +mS3UkkN75cTBuNvzUD+PxWruFNAuceNcS3/2Fq95s0gyU+7bDIuV2i0gl3QTxr4aovO
         UCLA==
X-Gm-Message-State: AOAM531mVIMUxLqfDBSakVZ2aERQUjeQz60OiKsWYz2K+7trJjjCUfur
	SLuL9iGmAnRCK234sSpX6mU=
X-Google-Smtp-Source: ABdhPJxCyITT8b6HYMi39pH3t62DjoZV7i4NB5MGXRnJ8apjStyMCwhEVmSOglqnd2Jp2IWLbrnAxA==
X-Received: by 2002:a63:9212:: with SMTP id o18mr14147341pgd.392.1635172567564;
        Mon, 25 Oct 2021 07:36:07 -0700 (PDT)
Received: from Sauravs-MacBook-Air.local ([59.95.95.35])
        by smtp.gmail.com with ESMTPSA id d19sm1320789pgk.81.2021.10.25.07.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:36:07 -0700 (PDT)
Date: Mon, 25 Oct 2021 20:06:00 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH v2] staging: r8188eu: avoid use of goto statement
Message-ID: <YXbA0BgvKZKXApaW@Sauravs-MacBook-Air.local>
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
goto statement with return statement local variable "res" is also not
required. As on goto label exit, function only return it is not
performing any cleanup. Avoiding goto statement will simplify the function.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---

ChangeLog V2:

	-Add space after line end on changelog.
	-Remove addition blank link after the local variable res
	 as per the coding guidelines for linux kernel.

ChangeLog V1:

	-Remove the goto statement from _rtw_init_cmd_priv(). In this
	 function goto statement can be replace by return statement.
	 By replacing the goto statement with return statement local
	 variable "res" is also not required. As on goto label exit,
	 function only return it is not performing any cleanup.
	 Avoiding goto statement will simplify the function.

 drivers/staging/r8188eu/core/rtw_cmd.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index e17332677daa..c94b9559b5e4 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -19,8 +19,6 @@ No irqsave is necessary.

 static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
-	int res = _SUCCESS;
-
 	sema_init(&pcmdpriv->cmd_queue_sema, 0);
 	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
 	sema_init(&pcmdpriv->terminate_cmdthread_sema, 0);
@@ -34,28 +32,23 @@ static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
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

