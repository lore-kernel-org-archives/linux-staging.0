Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA11363
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 10:22:06 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id mm4-20020a17090b358400b001cb93d8b137so2540573pjb.2
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 03:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+lgjywWBVQmpZrn9ZKLreOJoALlRHPio16ACwlfnaJI=;
        b=d7rxJ+WZDC/jumO0M6nhsIm/EvJFwzJlyjaIVOFxY4HjphZSBQxsdtT960isCe5iit
         K6iZXL1Vq+bP1qtBM8muP7wtGOE2jbM0pgK7d5g6hwbXyMdtJwf3o4f1GIO3sa7tAd5d
         nvw2lWVy+CtXSVi1a76Pz7tA6qmTnAdlX0oiKJ0FqWOnbPDp1mjPViotd/ICEasQHM6c
         Y9NCQYx5wlY8LGhchJofcdURg7hU6eu8982d0nLflSfIm6P2O9IFUaIkhWH3hPgtIWSg
         a6QS9DeawegMypCz3ZvxhiYktBMRl4Nq/IYmp+25x1Ot4cVNs7TTw1pFUiEcGIdw2CbR
         nWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+lgjywWBVQmpZrn9ZKLreOJoALlRHPio16ACwlfnaJI=;
        b=SytaxeubipNp+hLkS+C4gBSWKFtbFvfOOkhRogRcgPNfvobCk/U8e4PkLz88ny/6v4
         3qM35tU3N7N2BD0R1/kJexhWmfR4vAez2g4g1AxIhKJeP3hyz1Tw3L//LIELSv6Nq9Xt
         dZw4nWgYt7wz6G/TtREwodwxW2jE9YhWlIW2/a3I+djTeDHMomA7a1//Dpl6pnYWC7Xt
         fw2eKh8nEVc0PltQDJGE44FLa+sVLbtAWuxOSQ1gqZQgNhDBhjkQJF65yxwn/yQVU2m8
         iAdMwY05i+cgzh6ivLNJ+VBcmbEN8IgNn4t2gySsUXPlADuKPvstvPoatwI6XeBwcaEW
         oISg==
X-Gm-Message-State: AOAM531NXQL70xN5X7g1Pzh0WFaLO9GsMV1QgWQWSEas/pSpax6klPmq
	4fLqf4mKGLGuKznM4pDk2a8=
X-Google-Smtp-Source: ABdhPJyeaS1sxH+615n08xEVAzTOHEZPU/3I6q1yhe6Wg0OVgR5ePq0jgn/eRBNwPrt9PVkSdvsKBg==
X-Received: by 2002:a17:902:cf05:b0:156:2aa:6e13 with SMTP id i5-20020a170902cf0500b0015602aa6e13mr31406752plg.137.1649672525858;
        Mon, 11 Apr 2022 03:22:05 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:4376:c658:ae1e:1781])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001cb7e69ee5csm4886318pjd.54.2022.04.11.03.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:22:05 -0700 (PDT)
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
Subject: [PATCH v2 3/7] staging: r8188eu: drop unnecessary wrapper _rtw_init_evt_priv
Date: Mon, 11 Apr 2022 15:51:32 +0530
Message-Id: <20220411102136.14937-4-makvihas@gmail.com>
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

Drop unnecessary wrapper _rtw_init_evt_priv and move its logic to
rtw_init_evt_priv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 27 +++++++++-----------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 3d1fdc852..3781706f7 100644
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

