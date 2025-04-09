Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B1625DAE7;
	Wed,  9 Apr 2025 10:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193068; cv=none; b=o+Lcvz9SaX+Lhu6Z4N09itiPpc5fum+GY/Y26n4D/ZEq9Gpp5ACBQnGx0ZAHKi57t/l3jPsswbK2pOTF7vybnSjEfo3d+7dxcKS9Z0QWgPX1A2qBr76yt4xKIk3OCB3IJAyn3+pxfHpIh/fbgljzeqRs5cB89q7vPTUtj+GGt+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193068; c=relaxed/simple;
	bh=Y7aoilTHEAEiwViUts1s9DCkd38iWetjcqoy20zyZOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nQtWGNOZ/bBHjOZu07XJZeCOf7pcvnNZO+mC9muOPEeGQJNhjt4MEKC16oTpVh7zhNPjCUY3xo7Wzc995q2MBcDm+Y6vbJc8zsg2E/OUrUS3WtblEhjcrCE5zQGzvmAixUF0SQFDhXI8vN+fd2G6R/afB8fgKHfPRRMV1KuSJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEOeh2V2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEOeh2V2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so33422335e9.1;
        Wed, 09 Apr 2025 03:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744193065; x=1744797865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCzI50zVqiA5SSz6j5vbBxTst8NskylefZbAbeCkJRs=;
        b=EEOeh2V2mGEnMqAF7sA4eJIUo1xDeBscIBjYzecl0RjUZfbBRA+pt9iqPUfQiyvrip
         Z+Qoz5v+ZRpcawQat6lGr97cEHp5Maze3ESJTxPGUsS0nSsMeOhmyw8yFR1MZjREm2D3
         WRkr48sdkhirJC7elhqOBHKcUi7VvZWbC4wKwjHVBTDpv7lNm8ehOLxFjTWHifWpymzV
         e8r5cl5lJzIx7ySUjwQm1XHmxZMOLfMPP5LMRcxAi2niSruE/0beARTHIEu6gOsEy3EK
         XQAF53lfZH8uv6O2SliM4U7JguSYVqhDAiUB/YeEKbGSi5J8RXKqEA/tTdgAw9cDlSfo
         Wg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744193065; x=1744797865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCzI50zVqiA5SSz6j5vbBxTst8NskylefZbAbeCkJRs=;
        b=pQW8ZRqMETwBnsQwO6sQ21Gm8OH/4P6F3qPiVzJSntlJyLLXWQev0iIHvJ7DjieVPw
         j989M3Iq7vqcnnxM8nCmb02fQo1vKPITYJRaRuOk35cNXsLbiV8mUJUDSP7qLjgv8MN+
         wMFIUHEVKDgI1Xto8KH9p+/ncYG/kpNfw1EU90QhJZgoAHQ6AppZ7XJJh3vy3igQEjt5
         rJIQoejjWUfT/jUr/M8pIg5TRU7SfMaNI7EyhTMcsifgHaxemJFCFI+S/fFDH17yw4Rg
         0nuYuq5R6qLslufjSTdFhkRNJg2dUkqkZLXya5OjfujZLDgDZ3I7Lp1FLgwobIDxFLr2
         lIEw==
X-Forwarded-Encrypted: i=1; AJvYcCU81A/yiOMzJzFKsU9+wcNHJPt//EjIXV3EA+wwjoS1cAJSPdinUVmOkXGztsEExzA4ogn/9XWMrUUZ@lists.linux.dev, AJvYcCWf5ii4m4yq66Lz0/jrDBcjNVjqwEzrVFMM9TECddgp9tIYUgY/HEUX39b4aH4G+XHmgX1ILqXIgZgXjNLY@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Gir9F6OT8HgGhFiaadckF16Vpey913dmLm+v98CBI+b8Fp7/
	9hz+vIN1A6uSv/CtqElaeXggQsQr74B8ZT4JsISAi107m4N714x1JEymrJUg
X-Gm-Gg: ASbGnct7gi7Uojd/yZ3Ok/WOLYLCfvAsCx/x8IauncMksAkg6HP4ksjS0SnJLIPOC3e
	4B/NTGlLc1GBnrL04yoSTLTrd1WAv+46wMcuAEZl9gwGqoDHxFt2Xs6HWcovHiatZmm706oO6bz
	7JsTfZEDcaoalMj+I4aBTbZYHN0OEDdHpXb+Xx7Ph1R5QTy1eC0fYtfsN1JVFev9oqJr1xqNJKD
	wBC9XCrxj32FZb/PdyEqHNOIaG4MDlNcd6FZQG+CckZ8QCf2c0Iv6ijthN6RpuzcdX11UjkiLxW
	igZlyJrXizf1ORJ2eZ5GYMxUxNGMS0YqiG+Aag==
X-Google-Smtp-Source: AGHT+IFeZKOFYB4CHU5SWnQx8exXAGvWWy5DD7UqI5Mdd/V8928schjgyY2lbkhbslyWyFRJVJ6G+g==
X-Received: by 2002:a05:6000:402c:b0:39c:12ce:67e with SMTP id ffacd0b85a97d-39d8855a42fmr1668006f8f.41.1744193064904;
        Wed, 09 Apr 2025 03:04:24 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecac8sm14930295e9.4.2025.04.09.03.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:04:23 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] staging: rtl8723bs: Initializing variables at declaration
Date: Wed,  9 Apr 2025 13:04:05 +0300
Message-ID: <0fb58ca930030af2a4c730b0f5328e64210b795b.1744192642.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1744192642.git.karanja99erick@gmail.com>
References: <cover.1744192642.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the code more readable by moving trivial
initializations up with the declarations instead
of wasting a line on that.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    | 39 ++++++-------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 5dc1c12fe03e..d134d185bfae 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -120,13 +120,10 @@ static s32 rtl8723_dequeue_writeport(struct adapter *padapter)
  */
 s32 rtl8723bs_xmit_buf_handler(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	u8 queue_empty, queue_pending;
 	s32 ret;
 
-
-	pxmitpriv = &padapter->xmitpriv;
-
 	if (wait_for_completion_interruptible(&pxmitpriv->xmit_comp)) {
 		netdev_emerg(padapter->pnetdev,
 			     "%s: down SdioXmitBufSema fail!\n", __func__);
@@ -242,8 +239,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 						/* pxmitbuf->priv_data will be NULL, and will crash here */
 						if (pxmitbuf->len > 0 &&
 						    pxmitbuf->priv_data) {
-							struct xmit_frame *pframe;
-							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+							struct xmit_frame *pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 							pframe->agg_num = k;
 							pxmitbuf->agg_num = k;
 							rtl8723b_update_txdesc(pframe, pframe->buf_addr);
@@ -326,8 +322,7 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 		/*  dump xmit_buf to hw tx fifo */
 		if (pxmitbuf) {
 			if (pxmitbuf->len > 0) {
-				struct xmit_frame *pframe;
-				pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+				struct xmit_frame *pframe = (struct xmit_frame *)pxmitbuf->priv_data;
 				pframe->agg_num = k;
 				pxmitbuf->agg_num = k;
 				rtl8723b_update_txdesc(pframe, pframe->buf_addr);
@@ -357,12 +352,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
  */
 static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	s32 ret;
 
-
-	pxmitpriv = &padapter->xmitpriv;
-
 	if (wait_for_completion_interruptible(&pxmitpriv->SdioXmitStart)) {
 		netdev_emerg(padapter->pnetdev, "%s: SdioXmitStart fail!\n",
 			     __func__);
@@ -408,13 +400,9 @@ static s32 rtl8723bs_xmit_handler(struct adapter *padapter)
 
 int rtl8723bs_xmit_thread(void *context)
 {
-	s32 ret;
-	struct adapter *padapter;
-	struct xmit_priv *pxmitpriv;
-
-	ret = _SUCCESS;
-	padapter = context;
-	pxmitpriv = &padapter->xmitpriv;
+	s32 ret = _SUCCESS;
+	struct adapter *padapter = context;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 
 	allow_signal(SIGTERM);
 
@@ -435,16 +423,13 @@ s32 rtl8723bs_mgnt_xmit(
 )
 {
 	s32 ret = _SUCCESS;
-	struct pkt_attrib *pattrib;
-	struct xmit_buf *pxmitbuf;
+	struct pkt_attrib *pattrib = &pmgntframe->attrib;
+	struct xmit_buf *pxmitbuf = pmgntframe->pxmitbuf;
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
 	u8 txdesc_size = TXDESC_SIZE;
 
-	pattrib = &pmgntframe->attrib;
-	pxmitbuf = pmgntframe->pxmitbuf;
-
 	rtl8723b_update_txdesc(pmgntframe, pmgntframe->buf_addr);
 
 	pxmitbuf->len = txdesc_size + pattrib->last_txcmdsz;
@@ -557,15 +542,13 @@ s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 
 void rtl8723bs_free_xmit_priv(struct adapter *padapter)
 {
-	struct xmit_priv *pxmitpriv;
+	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_buf *pxmitbuf;
-	struct __queue *pqueue;
+	struct __queue *pqueue = &pxmitpriv->pending_xmitbuf_queue;
 	struct list_head *plist, *phead;
 	struct list_head tmplist;
 
 
-	pxmitpriv = &padapter->xmitpriv;
-	pqueue = &pxmitpriv->pending_xmitbuf_queue;
 	phead = get_list_head(pqueue);
 	INIT_LIST_HEAD(&tmplist);
 
-- 
2.43.0

