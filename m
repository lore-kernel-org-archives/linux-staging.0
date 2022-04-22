Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEC2F25
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 19:32:44 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id i63so8079293pge.11
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 12:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BUpSqOzVYiFBHHL5wyZniliWxqmPr3GRK8w6NgSpN5Y=;
        b=XcmVK7JwNu54yeoZvUVgRE4ycDDruCjbj+O5/cIqn5LV67XjhrDem/poh9j9WGzYTq
         LnUDaJvHfOKnKPlTahgjH/qcg22qtd5Ff1o4h3AgL+7IUtNgRfd71+gL6T35uZxuSGE/
         0cl58yjKwbyagr1pWsEYjmcGKECgKksbTZEzCqO1gUMr8ksXXPPnbQNTSIM3eRUCdtfN
         /Qb8DAB56KwthFkmyNNza4ZsncLT3Xlal8f6W70u74xt5+hlKR3zpY9dT+FBJOi9/3Oc
         QvMOpyk26Nc9Q+j17urh7MTZvzuJAbyRiftOILa9thZn7wEV4+ua/tcuTjW+BZYloL5v
         mKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BUpSqOzVYiFBHHL5wyZniliWxqmPr3GRK8w6NgSpN5Y=;
        b=BU1UbyooOF40+kpFFXTHAPhHUQGqIQZia5O903gd5Gs4uC233FmAlnUERHYySf4m4D
         i1XWYt03zCiU6HLqVnObzYn7ulwANOJZ6V1CIGbLsXU3ji6MEWfcK1eK/NRPJwNaU+zA
         rz1WaCKNvcMTaZhHIP0ZTgQYBftN+UhQlcDftqZ02awhRXVjgaTLumGCfBYPI17gQ0OP
         Od9QpDazJf5uFkXGxxKpbwWDaJqv+yQfwn2J6kmjq+tZ6zsAAAh1NPlI3eIjwnpHG74e
         QP/Kn9pMqzxcEGUXpWQWPsl3cXUv8gkq0tqcgXYDh93DUjMBYtOAo6DggGswIDA5CuLX
         v4/g==
X-Gm-Message-State: AOAM531qnQVRzldcjT/f8tUgJnZEB4scbbqJ3JJLTq/e9KfyHxl6+e9C
	eDiED7tmd4XIlmLP19JJ2Vc/U0gSB0iu/A==
X-Google-Smtp-Source: ABdhPJzUh4luMNplztXSuP6L7uMw2SWA7GRGbpG/TNQKBppwZ6TtQARW2I6z2+myuIpakDIbUiI0Xw==
X-Received: by 2002:a63:2c4c:0:b0:398:997d:b5b8 with SMTP id s73-20020a632c4c000000b00398997db5b8mr5303391pgs.86.1650655964090;
        Fri, 22 Apr 2022 12:32:44 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:bfe0:e8c0:bea6:ee63])
        by smtp.gmail.com with ESMTPSA id z5-20020a056a00240500b004e15d39f15fsm3518932pfh.83.2022.04.22.12.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:32:43 -0700 (PDT)
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
Subject: [PATCH v3 3/7] staging: r8188eu: drop unnecessary wrapper _rtw_init_evt_priv
Date: Sat, 23 Apr 2022 01:02:19 +0530
Message-Id: <20220422193223.11948-4-makvihas@gmail.com>
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

Drop unnecessary wrapper _rtw_init_evt_priv and move its logic to
rtw_init_evt_priv.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 27 +++++++++-----------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index fc955fce2..512896b86 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -17,22 +17,6 @@
 
 static void c2h_wk_callback(struct work_struct *work);
 
-static int _rtw_init_evt_priv(struct evt_priv *pevtpriv)
-{
-	int res = _SUCCESS;
-
-	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
-	atomic_set(&pevtpriv->event_seq, 0);
-
-	INIT_WORK(&pevtpriv->c2h_wk, c2h_wk_callback);
-	pevtpriv->c2h_wk_alive = false;
-	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
-	if (!pevtpriv->c2h_queue)
-		res = _FAIL;
-
-	return res;
-}
-
 void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	cancel_work_sync(&pevtpriv->c2h_wk);
@@ -133,9 +117,16 @@ u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 
 u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
 {
-	int	res;
+	u32 res = _SUCCESS;
+
+	/* allocate DMA-able/Non-Page memory for cmd_buf and rsp_buf */
+	atomic_set(&pevtpriv->event_seq, 0);
 
-	res = _rtw_init_evt_priv(pevtpriv);
+	INIT_WORK(&pevtpriv->c2h_wk, c2h_wk_callback);
+	pevtpriv->c2h_wk_alive = false;
+	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
+	if (!pevtpriv->c2h_queue)
+		res = _FAIL;
 
 	return res;
 }
-- 
2.30.2

