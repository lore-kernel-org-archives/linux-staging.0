Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D9A2F25
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 19:32:58 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c23so13013582plo.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 12:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IoveYgPzkVQxQlEHYjiT25fHGi8jPmqGfk3V2Lj3tG0=;
        b=p0+mBZk4Xc8pDoDk7SDXGalwSRX0py90m6dqVle4PP72Tn684vhS4UbdpKP/r96uic
         QggE8UqQZ9YOhfUPTqUM6wurtooEqpVGGKOYdIYTTBFda7K1kCjkhPPRlTSwJEI7/bQx
         RF8co3a7PaaO39iScZ0+oV7TUYl6pz+xzKjT+4QZHmO1jDscbZe6kzeD0fARclZ+NwH/
         bKagFH67K0/tJHT5i1YovY93R9hD/rOmbK+w3MhphPxW+8uIviqRF+DZnDi0iYH8DJnc
         ABPx4/Pzv1/pvnwxCI29X+reSydFwhJtAXkp71IPj9v8G6yylW7NDFQD8PClhukWhS/L
         jOVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IoveYgPzkVQxQlEHYjiT25fHGi8jPmqGfk3V2Lj3tG0=;
        b=iTH1WDfenvwN9YCV+XzXfv9S04umXwvfvygMhhFf92FrQ0Uj3qUl7p91qy1Ij1lQHH
         IE60TTMqLYpqkwDYx5uWQLKlA93Lv6zZ7tRexC7ufa0PHDZlOymy4NfBciVdxDPfxdsq
         ztiqPphcm6ZELRBm8nSUsDBV5p9RS+vrtJd10qkx5U2BAk2kLIVNyrQyGMKqBnQ40dUH
         vNdUiFaO0M/x+ckMq4SZPBgTd+2XFo258xsAFf1gDwAhRMvvlR5A3It5D5k/q9sueL7A
         eAthHl2BQRxxBtfZJO3kdqMjS/uXGHzFtD0YOMWBRod3er5Ebv4qE2nVWwbwrDdc3ALD
         0l5A==
X-Gm-Message-State: AOAM530GPGWJa2pGpb07xNRLkxrbpsBrzLXJse2mfuNHyvJZbOETRzbP
	yW/6QCYx/A4nC780QHMX0Yo=
X-Google-Smtp-Source: ABdhPJxLh3K98aNfOR6TCroIxTuAyj+Djkxy+F5QWbVMM7iEsJq/MJRfBO/lMAOzuPWZcmyKGXrAzQ==
X-Received: by 2002:a17:902:b692:b0:14c:935b:2b03 with SMTP id c18-20020a170902b69200b0014c935b2b03mr6057316pls.81.1650655978393;
        Fri, 22 Apr 2022 12:32:58 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:bfe0:e8c0:bea6:ee63])
        by smtp.gmail.com with ESMTPSA id z5-20020a056a00240500b004e15d39f15fsm3518932pfh.83.2022.04.22.12.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:32:58 -0700 (PDT)
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
Subject: [PATCH v3 7/7] staging: r8188eu: drop unnecessary wrapper _rtw_dequeue_cmd
Date: Sat, 23 Apr 2022 01:02:23 +0530
Message-Id: <20220422193223.11948-8-makvihas@gmail.com>
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

Drop unnecessary wrapper _rtw_dequeue_cmd and move its logic to
rtw_dequeue_cmd.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 34 ++++++++++----------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index ab462eb40..06881a871 100644
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

