Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F62C80
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 19:32:41 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id g9so8093367pgc.10
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 12:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MEpHLec1VfOXZ957xfGm8Ejr+pJnneWUL+vw0yvfhv4=;
        b=Y21IM1rnk46dBDp5zwaK/T1TXHMTuGORzT5eW8AYSStysCesIgFjYOHUFUS15e5bWT
         OLlD0gyAbpiz3KkteHv1Nqwc8wpCCdvufOl4o/J+QKzULC0QgvH1e5eQBYT1LUnNJah7
         thkLfoYy48I+ubx7Bx8rYchaUA1fXXvWxObBe+lyquCKt9butEJZM7mj9YSLjaPBBK3U
         xWCvbV4wpd1gNa1Mo6SVgRePSZjUVQ4r3jhUqxKO/hO9oSq7Qv/UOc3/MbLx8+qiQhww
         2iWMgYvLS1emJhluirYzm6HwZKBJU9uKVhxf0+uCrs7OCVKMI+g6Jfjk/kgQggOrILNp
         bTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MEpHLec1VfOXZ957xfGm8Ejr+pJnneWUL+vw0yvfhv4=;
        b=MUiLUrI2hc2Y5/au6ODNb/aXINUEpYN1QAJrmD7vAffcPre2oRi0GPhm7sJiv7wbAU
         f3wSghnrQUCtQqd13CVJWO1WK/ja5a2LXo1B1UoWnHYgyHwyS0d+chM8JZRDWaen32Us
         XOtCbI2zWsgEDBkwOOsrhXUoXMZinTp3//BE12ys3OqSPSy8gp6cQhyOR9hlJJ4t8JzZ
         fl6Btc01yl6iTCKTHiE0kJpJJTLCfuY0H0zXWLELfErE6xBysQXm6Yyf6Jgh0ck8Hyj9
         Mf+673vGeVz1Uevl3RtdwAoyBv+YCzdBNThPsPtFcUfT5RdnFDpi2KZ+I4QfKjpZW+er
         k+Bw==
X-Gm-Message-State: AOAM531h+9WrWHbsspfPIP6sccaaOEg4YJikGkj7CJL7dFU+1uqapnVC
	D645YuKjEvoR6JvR5mzxkNA=
X-Google-Smtp-Source: ABdhPJyq6Pev+frdReFdEQoGFh0hjvvnByHxD+Yshmj8pigE+7KWpHfHfR2682kvF4p8GYrGMZxPzw==
X-Received: by 2002:a63:6ac5:0:b0:3aa:f01e:3280 with SMTP id f188-20020a636ac5000000b003aaf01e3280mr416174pgc.207.1650655960827;
        Fri, 22 Apr 2022 12:32:40 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:bfe0:e8c0:bea6:ee63])
        by smtp.gmail.com with ESMTPSA id z5-20020a056a00240500b004e15d39f15fsm3518932pfh.83.2022.04.22.12.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:32:40 -0700 (PDT)
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
Subject: [PATCH v3 2/7] staging: r8188eu: drop unnecessary wrapper _rtw_init_cmd_priv
Date: Sat, 23 Apr 2022 01:02:18 +0530
Message-Id: <20220422193223.11948-3-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220422193223.11948-1-makvihas@gmail.com>
References: <20220422193223.11948-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary wrapper _rtw_init_cmd_priv and move its logic to
rtw_init_cmd_priv.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 77 ++++++++++++--------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 32589e76e..fc955fce2 100644
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

