Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89361363
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 10:22:20 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id t4so13799708pgc.1
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 03:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TVXrBloFtORkonGCujGmdgK1BPi5/BKdnl6pJMRy7hs=;
        b=Q40Tkt7prSxfeUG0mZFUtG9SRNWCCsWmxBgoXKMlowy/nXoUagFtxhayjTlYcgKWjh
         ozjjM9ZwuzkhlR+/XhGWKToKJf+deAihW7QXvFDeYp75aNXAPDLS0p8pNiR+l4H+qfgC
         1L8/QuPPUlszG1+VO3fnsdkM9xIf2TeSMFSGEhv1UnpzESEMblVaLuDF8CaOUyksMLPj
         byiXEqP3nA+hME6WWe/jRXCnHbvT1tlNhFB5avC3VkXa7xJxdIsOcVYXgXR012saBEDM
         3FU04QUm/8aGwV9czYBGjB2SNKbJC97JnlOjvsmcIK2GiTGVX0P+DnWNCd0q68PH4fWj
         hofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TVXrBloFtORkonGCujGmdgK1BPi5/BKdnl6pJMRy7hs=;
        b=aH7dsNtDOOV6HuGclvwDdAdQL0xq+2bglYcvz/oYpiPVZl+OC+/ZiQpSPscZPKSUwM
         jE6jDOfgPPUfWLsK6uM7PzMe2mAN2w3/Ygxl+oVJyGTYfTboupmg+bec4vhm8DZQL+jp
         6EEFe9cEIpnAGLmoaPdA4MBuFWpq5k9Wjb4nd4UyV/USMJnZOBNwiwRXTUrF3MBHwHJA
         1QIC8xnhthoSg7CQutXKvrWw53hWslLussNkTGKdlGcRkQHze28VZcPj2DgMrwn1KBnV
         KqVOw/oph9UfnMJ/96oLJndnaKJdvqGfbNNtB0FUZ0vABh51kLtt2GV55mm2keeqmrOL
         dxtA==
X-Gm-Message-State: AOAM530PHe0dGxtpDLPNdsUj7ejwiCxNy1LeQo3KJpRXyxNN6ilu9rjX
	rnX85SynM6Bk6mF/yWaXQjLRSn5KpmcVu7Jp
X-Google-Smtp-Source: ABdhPJyi/0jnHlVtNF5gztu7grts6sCy3pvGJMA1LOCs5u3Uq2KPFjULHgxllvbbDe9Mxa8xuqXUQw==
X-Received: by 2002:a05:6a00:1701:b0:505:c49b:d2eb with SMTP id h1-20020a056a00170100b00505c49bd2ebmr3991648pfc.12.1649672540250;
        Mon, 11 Apr 2022 03:22:20 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:4376:c658:ae1e:1781])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001cb7e69ee5csm4886318pjd.54.2022.04.11.03.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:22:19 -0700 (PDT)
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
Subject: [PATCH v2 7/7] staging: r8188eu: drop unnecessary wrapper _rtw_dequeue_cmd
Date: Mon, 11 Apr 2022 15:51:36 +0530
Message-Id: <20220411102136.14937-8-makvihas@gmail.com>
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

Drop unnecessary wrapper _rtw_dequeue_cmd and move its logic to
rtw_dequeue_cmd.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 34 ++++++++++----------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 959b69be5..06523d919 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -56,24 +56,6 @@ static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	return _SUCCESS;
 }
 
-static struct cmd_obj *_rtw_dequeue_cmd(struct __queue *queue)
-{
-	struct cmd_obj *obj;
-	unsigned long flags;
-
-	spin_lock_irqsave(&queue->lock, flags);
-	if (list_empty(&queue->queue)) {
-		obj = NULL;
-	} else {
-		obj = container_of((&queue->queue)->next, struct cmd_obj, list);
-		list_del_init(&obj->list);
-	}
-
-	spin_unlock_irqrestore(&queue->lock, flags);
-
-	return obj;
-}
-
 u32	rtw_init_cmd_priv(struct cmd_priv *pcmdpriv)
 {
 	u32 res = _SUCCESS;
@@ -180,11 +162,21 @@ u32 rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 
 struct	cmd_obj	*rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
 {
-	struct cmd_obj *cmd_obj;
+	struct cmd_obj *obj;
+	struct __queue *queue = &pcmdpriv->cmd_queue;
+	unsigned long flags;
+
+	spin_lock_irqsave(&queue->lock, flags);
+	if (list_empty(&queue->queue)) {
+		obj = NULL;
+	} else {
+		obj = container_of((&queue->queue)->next, struct cmd_obj, list);
+		list_del_init(&obj->list);
+	}
 
-	cmd_obj = _rtw_dequeue_cmd(&pcmdpriv->cmd_queue);
+	spin_unlock_irqrestore(&queue->lock, flags);
 
-	return cmd_obj;
+	return obj;
 }
 
 void rtw_free_cmd_obj(struct cmd_obj *pcmd)
-- 
2.30.2

