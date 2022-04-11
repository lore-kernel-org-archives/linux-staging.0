Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA711363
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 10:22:02 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id bo5so14210673pfb.4
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 03:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UDJwfC4bXVfds8p9uj2dvjrmmyg7JkvC30fvf514tUw=;
        b=atCReM7GsEniNQu0eCNJ6aQxRV2SMOdKBHn4gjkvwZaPYYBYmaAoAA09Ho6TWsw2lJ
         UlepctMkONgP33D7RXbn7vHddoESrb/UmCTLYuJ+ZdXlAh8V7eeiSdhkGSP12UPKuy1f
         L+z9Wd8pchqmYJIiU2FxlrVE3kVYIMcrpBiB+iCROQctDLErcjO1bZlp3Za/t7npcBW+
         l6vzKDo+UGuFFfwONCgp78q30rWiwNojvQ/T74pqyUY+6/DkNIaOZt00lhNlicmd01/C
         Rhpaa6Co/kxuSfiWCuRSjJgCnRfrQlqHpMaa8XNj1V4QzunLH6Z4EFGrD22OsEuRBEF3
         ZTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UDJwfC4bXVfds8p9uj2dvjrmmyg7JkvC30fvf514tUw=;
        b=Tfll61Kwam+nM/M7833WxuxLeoddvGTN6u+H51JCCVKYE+4cuPsoWv9GSegP1XAA5c
         U52e9YWESiOT9vQ/OpPz2Lolhg+ObsyQO9GoLwQqP67PGEGgvo3hiqMWT9sYTIPMdR7V
         Uqbj+mcCmyVAG6qUMEc0f94lUmYENcUtkl9dfPNkRCgjS00mAsXLklwOyAe5McrXstOZ
         1cvwL0uLkja8x3tMxkFdDLEG0uJAcRfrqrAoK1K1HW/5SUzc+1J4BucCPcp3a8A8YQSo
         ldnSxwS/NWzn2hejuAAEsOxBkoLvPCadCeKNmLOpCxiMH/KwVhVq3dFjvSyH+iF4+e6x
         PCcQ==
X-Gm-Message-State: AOAM532fPzQQo6dRiFlvY++sBceiazr6TZXz5DNzW6e1Uzu/mMyJdHFz
	wvjYsxnSgMtLOr2G/RshRb0=
X-Google-Smtp-Source: ABdhPJzNPJjwDfyVPTKLgVA7IrxOrALdvl+BXQbDiROT9w1bmwz9EZklAQiEYiv+as26Osv/zA5eNw==
X-Received: by 2002:a63:f048:0:b0:39d:6f6d:47ad with SMTP id s8-20020a63f048000000b0039d6f6d47admr1130450pgj.494.1649672522385;
        Mon, 11 Apr 2022 03:22:02 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:4376:c658:ae1e:1781])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001cb7e69ee5csm4886318pjd.54.2022.04.11.03.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:22:02 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v2 2/7] staging: r8188eu: drop unnecessary wrapper _rtw_init_cmd_priv
Date: Mon, 11 Apr 2022 15:51:31 +0530
Message-Id: <20220411102136.14937-3-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411102136.14937-1-makvihas@gmail.com>
References: <20220411102136.14937-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary wrapper _rtw_init_cmd_priv and move its logic to
rtw_init_cmd_priv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 77 ++++++++++++--------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index d53217900..3d1fdc852 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -15,47 +15,6 @@
  * No irqsave is necessary.
  */
 
-static int _rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
-{
-	int res = _SUCCESS;
-
-	init_completion(&pcmdpriv->enqueue_cmd);
-	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
-	init_completion(&pcmdpriv->start_cmd_thread);
-	init_completion(&pcmdpriv->stop_cmd_thread);
-
-	rtw_init_queue(&pcmdpriv->cmd_queue);
-
-	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
-
-	pcmdpriv->cmd_seq = 1;
-
-	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ,
-					      GFP_KERNEL);
-
-	if (!pcmdpriv->cmd_allocated_buf) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((size_t)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));
-
-	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);
-
-	if (!pcmdpriv->rsp_allocated_buf) {
-		res = _FAIL;
-		goto exit;
-	}
-
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((size_t)(pcmdpriv->rsp_allocated_buf) & 3);
-
-	pcmdpriv->cmd_done_cnt = 0;
-	pcmdpriv->rsp_cnt = 0;
-exit:
-
-	return res;
-}
-
 static void c2h_wk_callback(struct work_struct *work);
 
 static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
@@ -133,9 +92,41 @@ static struct cmd_obj *_rtw_dequeue_cmd(struct __queue *queue)
 
 u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
-	u32	res;
+	u32 res = _SUCCESS;
+
+	init_completion(&pcmdpriv->enqueue_cmd);
+	/* sema_init(&(pcmdpriv->cmd_done_sema), 0); */
+	init_completion(&pcmdpriv->start_cmd_thread);
+	init_completion(&pcmdpriv->stop_cmd_thread);
+
+	rtw_init_queue(&pcmdpriv->cmd_queue);
+
+	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
+
+	pcmdpriv->cmd_seq = 1;
+
+	pcmdpriv->cmd_allocated_buf = kzalloc(MAX_CMDSZ + CMDBUFF_ALIGN_SZ,
+					      GFP_KERNEL);
+
+	if (!pcmdpriv->cmd_allocated_buf) {
+		res = _FAIL;
+		goto exit;
+	}
+
+	pcmdpriv->cmd_buf = pcmdpriv->cmd_allocated_buf  +  CMDBUFF_ALIGN_SZ - ((size_t)(pcmdpriv->cmd_allocated_buf) & (CMDBUFF_ALIGN_SZ - 1));
+
+	pcmdpriv->rsp_allocated_buf = kzalloc(MAX_RSPSZ + 4, GFP_KERNEL);
+
+	if (!pcmdpriv->rsp_allocated_buf) {
+		res = _FAIL;
+		goto exit;
+	}
 
-	res = _rtw_init_cmd_priv(pcmdpriv);
+	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf  +  4 - ((size_t)(pcmdpriv->rsp_allocated_buf) & 3);
+
+	pcmdpriv->cmd_done_cnt = 0;
+	pcmdpriv->rsp_cnt = 0;
+exit:
 
 	return res;
 }
-- 
2.30.2

