Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C60315772
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771701067; cv=none; b=KpwPbLXkRcdXFEqzP2ifL49ZrPuSjYQ3glBdcZ3R3uJa/NLDbum1SfzFpvfNtU/8hjxtdwMCWJ+YWFsJn4uCZ0qtOGeEhVr0RC06PqNwWkolaR+Ny/EdEXfFLpuz9W+TIMapSZzpr/SyA4rUezXY2lH/ltPbwQ2brfIpDDISNBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771701067; c=relaxed/simple;
	bh=V0ffyhAwxWSZNSENcuj90HHm3R5vaHjc8Gev7V1Rywc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LwHGAcL4arJaeP5jc0UMCe9YoJo5O7S5OIQvlTWW6NRROhMH6Vy/Jtasqq17UN3sT7FEyzFnl4cRZ26qfNqlpv5uFQZbafAyllfI1goQERreIJntldXoTeahZA58e4uHxijDeab1ON/4OqahDJWmNpQm2cIji8GypVonkVOAwo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=LxZuYRfI; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="LxZuYRfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771701064; bh=V0ffyhAwxWSZNSENcuj90HHm3R5vaHjc8Gev7V1Rywc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LxZuYRfIc1jN0e/elTzlQUUYT0WacO/0s08iHQltTwQQiO80ceEwgrhbA8Y1a7khC
	 vBiDfXICbNoyYxs6Hsg8DxzjGBnt7US5Bmj0o5e/LCJjIvNfVDnd11PHOQpsX906ie
	 V5CSu9LdosZGN3v+TGNqjFD7s0QJ3g2TX5BP2AMLQ28qvO6HvQjNoeVUcc5R6XLBed
	 1Ed2075KNuEr2I7CZGOhYLm007eEAoK60uszdFMRoKav5dUADAKQTBf8mz+pgKTnJO
	 jQYfLdztRb8Kb4dpgGI9Yn25bNrH+UqhKc8Gq5JXi9T1kXaFQ/GHV0W6/TtBZqWbOh
	 f83wb+xqcHqeg==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id C147F400D2;
	Sat, 21 Feb 2026 19:11:03 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Philip Thayer <thayerscirez@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Erick Karanja <karanja99erick@gmail.com>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/11] staging: rtl8723bs: Clean up wrapper functions
Date: Sat, 21 Feb 2026 21:01:40 +0200
Message-ID: <20260221190628.50273-11-plaes@plaes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221190628.50273-1-plaes@plaes.org>
References: <20260221190628.50273-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove wrapper functions in cmd queue handling.

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

