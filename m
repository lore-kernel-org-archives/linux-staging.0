Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D94395AC7
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 18:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954818; cv=none; b=sZ4IdmM4JcWkHEXITeCfQdmCrosYRxAW9OwVkz2NJzc9KaQMzQymFcfjrV374XQFZeJNh9i0mNjEyF+btxCvpZc+A6H8mtjsCW7er5Qupn3x9iLeRpMctzxwznVT/s2tBcqm59eE7iCiYnlHz8LEPNOTiyq6ljtb4fa/Ud5VBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954818; c=relaxed/simple;
	bh=KEOWHPmqazn3Rc2NhfWr6RTXphnDCqGYzb+wdac0Md8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PU08Wo/0fAzL5p6a8Fur0kEOji55uc+I1Adc4nlghwgqTn043v3yGwmbYsidkJMJJ/DaPD69+i8WngZgNOVXWojVxGAbmLB0/wcvkqBioS5CLz8CQwfpxjafa9QDZQPDLjDTDSgGaDUp93f/t3hEAEcgDH9Xvj1ft9TN5BjkjX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWNYgFw/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWNYgFw/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caea3f742bso19811565ad.0
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 11:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785954816; x=1786559616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ll1BDnueTToIDv1UsG/EHfYj5A1zeconA3K3v4tzltY=;
        b=WWNYgFw/agCduF+Rsn8zqrxu4Wv2Ql+0ZdluycKvOj6te0L0Be6zwNOD+uxFS4R4lF
         EcQEBk/fyiCQ35wOseY+4zBU6vUGtuQMUZhNhaGGATuqsIx8zIeo8RPv7PYhfsprtlHA
         Afwg1h24NA+8wxgUdoObY98MG4WVHup0Oa7ooEg/6vw5fdgfMNe588t6PVvrxb9n2NUZ
         LXUlQfqGIGQR61T5GcMqR08h8FEs5k9ffdKUiQKJXCVjkC+3nKB+/gTMCCIo5v7VJT6k
         GcJuHVluu1RnifriacC1T3AZHLM/HaRrrAPOXRqYhpwI/fW0/syfSf3FNQqZELEOfrkJ
         aGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785954816; x=1786559616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ll1BDnueTToIDv1UsG/EHfYj5A1zeconA3K3v4tzltY=;
        b=FTstXhoyDHmZvmB2vFc4vtHGu5WNR/PJwI0mW9BSz9pighv8Iwgp6AkpkmvnVYCXJl
         6971VM81OwQ8jtskUzCp4MZLokhNYwVXMygQPTbUz0mkgROs7ih/7TyNnrG0U3+HB+5+
         WZmhwrIABwYCzvKmb4UVPJj7j3+4j9dluSdOR/vt1ti7U7wT5N0Hc4JDT7rM7PartkFL
         Cc2FmMeqcg4nUG3UHaGXBhJ+9eAOHiavyQGPqUhLRIy2mDOemSocPkK1YqgK8qvpW81t
         Khr//ArxEG3NgAHQo/QXfVsq8ilm/pqayJdHJUlGRs/eb7MJVv2z0UxaDwAk5cDj+C9w
         r21g==
X-Gm-Message-State: AOJu0YwypIfAf3JEd4XT45OjIvW+xhuHp7Pp+49IszSRTcDqRIhDG1/S
	HLklf3qR+y0pmI5QzKynRZAhf8b+FSMkvlJf3aUd/ShCgFw6WP+6VfjD
X-Gm-Gg: AR+sD10rp2FJ8sqAZ3HEKiq4Ap4WeFjNCEWzRKMiY6HQrmtPyvHYrkQPn8BgAe/vHm8
	w81nAd+wghnmTeX78zbwL9wkGk5r5KjSdOZ7UTPOGxcWkjCVDyQF/Lf03H8P4lPwswR1laJ6VSY
	g1c9NlfsKHl/2uw0TBthvy9sBoD8wjGn2o0JwMMKFaWJRoQGPAjy1JzQhhzeQGTTrOP+e9025Xp
	ccODdEBlCQ5ZYxR4uwjWphNskBu/M7Mv/ryWiOM1echzhs7rr7vFcTrthR3aY7lyNe+eKtzqfUa
	AKgkrJCqj6pC0O3ESVB0l9cxAmVD3p4rXQO/g3TNb+uEUyJZxRtDkbExi3xgJRQhzeOxpBNuUbL
	Ic5Wte9N1yHYdL9WSS8fw2P99vBa0lar7q6fJguWuZR0/ltwP9kpNkLi0izSRI5kplN+Xhe6G6q
	EB41nNqoKYX/hv5WOot8rKYINSqdGkC1IHt6ufp0QJbfZzYi2wobShcGN62qThT5fqv+8m5gxIA
	jJ6o3LP
X-Received: by 2002:a17:903:3c27:b0:2c2:bd7f:ccd4 with SMTP id d9443c01a7336-2d0ca961e12mr110253755ad.21.1785954816436;
        Wed, 05 Aug 2026 11:33:36 -0700 (PDT)
Received: from Vicious.localdomain ([106.211.56.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315a1e0b5cesm2369772eec.5.2026.08.05.11.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:33:36 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: gregkh@linuxfoundation.org,
	mchehab@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: Replace custom rtw_cbuf with kfifo
Date: Wed,  5 Aug 2026 18:33:16 +0000
Message-ID: <20260805183317.85489-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8723bs driver implemented its own custom circular buffer
(rtw_cbuf) for c2h event handling. The kernel already provides a standard,
lockless circular buffer implementation in <linux/kfifo.h>.

This patch replaces the custom rtw_cbuf struct and its associated
functions with the standard kfifo API (kfifo_alloc, kfifo_put,
kfifo_get, kfifo_is_empty, kfifo_free), simplifying the driver code
and relying on the robust kernel infrastructure. Furthermore, the allocation
size is simplified to C2H_QUEUE_MAX_LEN, dropping the vestigial + 1 that
the original naive ring buffer required to disambiguate full from empty.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Ashmit Kumar <work.ashmitkumar@gmail.com>
---
Changes in v4:
 - Abandoned ternary operator style fixes in favor of completely
   replacing the custom rtw_cbuf ring buffer with the standard Linux
   kfifo API, as suggested by Greg Kroah-Hartman.

Changes in v3:
 - Formatted as a standalone patch (removed 1/3 series numbering).

Changes in v2:
 - Fixed patch formatting and versioning issues.

Changes in v1:
 - Initial submission addressing ternary operator style issues in rtw_cbuf.

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 16 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
 .../staging/rtl8723bs/include/osdep_service.h | 14 ----
 drivers/staging/rtl8723bs/include/rtw_cmd.h   |  3 +-
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 77 -------------------
 5 files changed, 11 insertions(+), 101 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fee26..424aa180eecc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -202,8 +202,7 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 	_init_workitem(&pevtpriv->c2h_wk, c2h_wk_callback, NULL);
 	pevtpriv->c2h_wk_alive = false;
-	pevtpriv->c2h_queue = rtw_cbuf_alloc(C2H_QUEUE_MAX_LEN + 1);
-	if (!pevtpriv->c2h_queue)
+	if (kfifo_alloc(&pevtpriv->c2h_queue, C2H_QUEUE_MAX_LEN, GFP_KERNEL))
 		return -ENOMEM;
 
 	return 0;
@@ -211,17 +210,17 @@ int rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
+	void *c2h;
+
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
 		fsleep(10 * USEC_PER_MSEC);
 
-	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
-		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-
+	while (kfifo_get(&pevtpriv->c2h_queue, &c2h)) {
 		if (c2h && c2h != (void *)pevtpriv)
 			kfree(c2h);
 	}
-	kfree(pevtpriv->c2h_queue);
+	kfifo_free(&pevtpriv->c2h_queue);
 }
 
 void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
@@ -1695,12 +1694,13 @@ static void c2h_wk_callback(struct work_struct *work)
 	struct evt_priv *evtpriv = container_of(work, struct evt_priv, c2h_wk);
 	struct adapter *adapter = container_of(evtpriv, struct adapter, evtpriv);
 	u8 *c2h_evt;
+	void *c2h_ptr;
 	c2h_id_filter ccx_id_filter = rtw_hal_c2h_id_filter_ccx(adapter);
 
 	evtpriv->c2h_wk_alive = true;
 
-	while (!rtw_cbuf_empty(evtpriv->c2h_queue)) {
-		c2h_evt = (u8 *)rtw_cbuf_pop(evtpriv->c2h_queue);
+	while (kfifo_get(&evtpriv->c2h_queue, &c2h_ptr)) {
+		c2h_evt = (u8 *)c2h_ptr;
 		if (c2h_evt) {
 			/* This C2H event is read, clear it */
 			c2h_evt_clear(adapter);
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index da2d9088ab5a..e39faed1f195 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -763,7 +763,7 @@ void sd_int_dpc(struct adapter *adapter)
 			}
 		} else {
 			/* Error handling for malloc fail */
-			rtw_cbuf_push(adapter->evtpriv.c2h_queue, NULL);
+			kfifo_put(&adapter->evtpriv.c2h_queue, NULL);
 			_set_workitem(&adapter->evtpriv.c2h_wk);
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 2f5011a8210c..6feeb1351faa 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -36,18 +36,4 @@ extern void rtw_free_netdev(struct net_device *netdev);
 void rtw_buf_free(u8 **buf, u32 *buf_len);
 void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len);
 
-struct rtw_cbuf {
-	u32 write;
-	u32 read;
-	u32 size;
-	void *bufs[];
-};
-
-bool rtw_cbuf_full(struct rtw_cbuf *cbuf);
-bool rtw_cbuf_empty(struct rtw_cbuf *cbuf);
-bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf);
-void *rtw_cbuf_pop(struct rtw_cbuf *cbuf);
-struct rtw_cbuf *rtw_cbuf_alloc(u32 size);
-
-
 #endif
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 2e791da7e815..62e6b9011625 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -8,6 +8,7 @@
 #define __RTW_CMD_H_
 
 #include <linux/completion.h>
+#include <linux/kfifo.h>
 
 #define C2H_MEM_SZ (16*1024)
 
@@ -58,7 +59,7 @@
 	struct	evt_priv {
 		struct work_struct c2h_wk;
 		bool c2h_wk_alive;
-		struct rtw_cbuf *c2h_queue;
+		DECLARE_KFIFO_PTR(c2h_queue, void *);
 		#define C2H_QUEUE_MAX_LEN 10
 
 		atomic_t event_seq;
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 4cfdf7c62344..1db1c5aff530 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -122,80 +122,3 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-/**
- * rtw_cbuf_full - test if cbuf is full
- * @cbuf: pointer of struct rtw_cbuf
- *
- * Returns: true if cbuf is full
- */
-inline bool rtw_cbuf_full(struct rtw_cbuf *cbuf)
-{
-	return (cbuf->write == cbuf->read - 1) ? true : false;
-}
-
-/**
- * rtw_cbuf_empty - test if cbuf is empty
- * @cbuf: pointer of struct rtw_cbuf
- *
- * Returns: true if cbuf is empty
- */
-inline bool rtw_cbuf_empty(struct rtw_cbuf *cbuf)
-{
-	return (cbuf->write == cbuf->read) ? true : false;
-}
-
-/**
- * rtw_cbuf_push - push a pointer into cbuf
- * @cbuf: pointer of struct rtw_cbuf
- * @buf: pointer to push in
- *
- * Lock free operation, be careful of the use scheme
- * Returns: true push success
- */
-bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
-{
-	if (rtw_cbuf_full(cbuf))
-		return _FAIL;
-
-	cbuf->bufs[cbuf->write] = buf;
-	cbuf->write = (cbuf->write + 1) % cbuf->size;
-
-	return _SUCCESS;
-}
-
-/**
- * rtw_cbuf_pop - pop a pointer from cbuf
- * @cbuf: pointer of struct rtw_cbuf
- *
- * Lock free operation, be careful of the use scheme
- * Returns: pointer popped out
- */
-void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
-{
-	void *buf;
-
-	if (rtw_cbuf_empty(cbuf))
-		return NULL;
-
-	buf = cbuf->bufs[cbuf->read];
-	cbuf->read = (cbuf->read + 1) % cbuf->size;
-
-	return buf;
-}
-
-/**
- * rtw_cbuf_alloc - allocate a rtw_cbuf with given size and do initialization
- * @size: size of pointer
- *
- * Returns: pointer of srtuct rtw_cbuf, NULL for allocation failure
- */
-struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
-{
-	struct rtw_cbuf *cbuf;
-
-	cbuf = kzalloc_flex(*cbuf, bufs, size);
-	if (cbuf)
-		cbuf->size = size;
-
-	return cbuf;
-}
-- 
2.51.0.windows.1

