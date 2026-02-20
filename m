Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5BE314D06
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604247; cv=none; b=fDkF+IMDP2Vn5FwWyqH8WSozGUfHwcL0nTKVem4juWvVnxK8irBURSYRqvD87sA4YuBVY13R2whBKS7884tud6ILz4PifKq0zuXtZcwO2eJuSD8D5u7NLUS+5NpMHsv7wTyaybT8IT5z+yy36rlkejIYvPHGLohPc7Vf6K/gJYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604247; c=relaxed/simple;
	bh=Cb9Oykwn0QqLjybbvsNO1nqjUpoWiWtHH3pH2YjnEiU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iIANFW0WmiP5Fqb+j/7BEUa9+RqLpZe/sirzfuJPSFcCDs2LBKV23iLHtIxkieL2kREiPd/aCjCntnZGTgQq8nHG++ovCDdapUvDJshWXuTZx29JJxcFOMR0fOS8cCY1reugRLMde5EKrDmj1QuyAmJYnCz3I1z8QcOt0VTSSOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=gCNKs4j/; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="gCNKs4j/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604245; bh=Cb9Oykwn0QqLjybbvsNO1nqjUpoWiWtHH3pH2YjnEiU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gCNKs4j/zyal14BdO4xDEkMhzqeBBdh7SWfpXdp9+UNiGTShpqPiedQnzqlRqQQ8O
	 kryarVu1QQiVxwszBBq0Ml0SI9LUMmaE7JD593K+USSNFSGCRFSkSNv5LuOpElVZQs
	 YSYszqDCdvSchWBVDuwOIBV3hmhid/cPu3IfDbAhen2KNIf4LIDO4GcP8NfRySmKJf
	 tPcurrgEQOxSogQN9dQ7BJ5p7BSACxIciQOLYoX8OyuB/bax/PDhBY3kKMafB/d9vh
	 gSbPdYDw8o5g8sVEtHB5yFY46OiAniXsCay9QbZ+3Pnu5eY1OKD4sbhblqrmDbba6S
	 guXFXwwPMD1cA==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id 2B84E404CF;
	Fri, 20 Feb 2026 16:17:25 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Ignacio Pena <ignacio.pena87@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] staging: rtl8723bs: Remove useless wrapper functions in rtw_cmd.c
Date: Fri, 20 Feb 2026 18:15:21 +0200
Message-ID: <20260220161611.2398915-11-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260220161611.2398915-1-plaes@plaes.org>
References: <20260220161611.2398915-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 88 ++++++++-----------
 drivers/staging/rtl8723bs/include/cmd_osdep.h |  7 +-
 2 files changed, 39 insertions(+), 56 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index d0694a659259..60e2de7991d4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -210,32 +210,6 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 	return 0;
 }
 
-void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
-{
-	cancel_work_sync(&pevtpriv->c2h_wk);
-	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
-
-	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
-		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-
-		if (c2h && c2h != (void *)pevtpriv)
-			kfree(c2h);
-	}
-	kfree(pevtpriv->c2h_queue);
-}
-
-void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
-{
-	if (pcmdpriv) {
-		kfree(pcmdpriv->cmd_allocated_buf);
-
-		kfree(pcmdpriv->rsp_allocated_buf);
-
-		mutex_destroy(&pcmdpriv->sctx_mutex);
-	}
-}
-
 /*
  * Calling Context:
  *
@@ -246,7 +220,7 @@ void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
  *
  */
 
-int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
+static int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 {
 	unsigned long irqL;
 
@@ -265,38 +239,35 @@ int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj)
 	return _SUCCESS;
 }
 
-struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
+void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
-	unsigned long irqL;
-	struct cmd_obj *obj;
-
-	/* spin_lock_bh(&(queue->lock)); */
-	spin_lock_irqsave(&queue->lock, irqL);
-	if (list_empty(&queue->queue)) {
-		obj = NULL;
-	} else {
-		obj = container_of(get_next(&queue->queue), struct cmd_obj, list);
-		list_del_init(&obj->list);
-	}
+	cancel_work_sync(&pevtpriv->c2h_wk);
+	while (pevtpriv->c2h_wk_alive)
+		msleep(10);
 
-	/* spin_unlock_bh(&(queue->lock)); */
-	spin_unlock_irqrestore(&queue->lock, irqL);
+	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
+		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
 
-	return obj;
-}
+		if (c2h && c2h != (void *)pevtpriv)
+			kfree(c2h);
+	}
+	kfree(pevtpriv->c2h_queue);
 
-void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
-{
-	_rtw_free_evt_priv(pevtpriv);
 }
 
 void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
-	_rtw_free_cmd_priv(pcmdpriv);
+	if (pcmdpriv) {
+		kfree(pcmdpriv->cmd_allocated_buf);
+
+		kfree(pcmdpriv->rsp_allocated_buf);
+
+		mutex_destroy(&pcmdpriv->sctx_mutex);
+	}
+
 }
 
-int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
-int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
+static int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
 	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
 
@@ -337,7 +308,24 @@ int rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 
 struct	cmd_obj	*rtw_dequeue_cmd(struct cmd_priv *pcmdpriv)
 {
-	return _rtw_dequeue_cmd(&pcmdpriv->cmd_queue);
+	unsigned long irqL;
+	struct cmd_obj *obj;
+	struct __queue *queue = &pcmdpriv->cmd_queue;
+
+	/* spin_lock_bh(&(queue->lock)); */
+	spin_lock_irqsave(&queue->lock, irqL);
+	if (list_empty(&queue->queue)) {
+		obj = NULL;
+	} else {
+		obj = container_of(get_next(&queue->queue), struct cmd_obj, list);
+		list_del_init(&obj->list);
+	}
+
+	/* spin_unlock_bh(&(queue->lock)); */
+	spin_unlock_irqrestore(&queue->lock, irqL);
+
+	return obj;
+
 }
 
 void rtw_free_cmd_obj(struct cmd_obj *pcmd)
diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
index 5506f513dc01..b0ac41d2be24 100644
--- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
+++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
@@ -7,12 +7,7 @@
 #ifndef __CMD_OSDEP_H_
 #define __CMD_OSDEP_H_
 
-
-int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
+int rtw_init_cmd_priv(struct cmd_priv *pcmdpriv);
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
-extern void _rtw_free_evt_priv(struct	evt_priv *pevtpriv);
-extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
-int _rtw_enqueue_cmd(struct __queue *queue, struct cmd_obj *obj);
-extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
 
 #endif
-- 
2.53.0

