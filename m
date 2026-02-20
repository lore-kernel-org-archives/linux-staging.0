Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1E433120A
	for <linux-staging@lists.linux.dev>; Fri, 20 Feb 2026 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771604229; cv=none; b=u9iPDGcZZISTZtq1Tk3qXzIulWlUgJjBxPUCKgGYxw4NlLAODLhzJMrreS7POy9ifpx8dkCPCZ2RT4t5DRYr2xP8drCqoyVpIx4lpETVjb+AfXy3f6Xv7l63qvoUPGxr9OzjXF41yo1g9TrgoahNNKdvhcveO/DSRmMJVLkDC1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771604229; c=relaxed/simple;
	bh=jFGelnjMca7glIg2sJ1oEhWCCIR9ah0EBx5OtZTkm6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mue/lAjh9xBQ/U6Kyxm+zp6X2SKdipR56aqtWZ5wIAB6zu6IK1imRl0LE7I3lZzymq/VYldKO3G0GIE4+8+IzsiS2E74JpO1Tc/2enbGE6XrAU6BTcLzZCnwEp84N0S4jvLbhhJFNCtc1urT1pQ/OdiMr1hQ+OgRWYRbWfWwxfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=AMNkqUlm; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="AMNkqUlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771604227; bh=jFGelnjMca7glIg2sJ1oEhWCCIR9ah0EBx5OtZTkm6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AMNkqUlmnRMI1zNjVYZJBVLRlEpnPcEOKnmGghGVqQqUrikTDQRQAN0WHKHKFsGjP
	 AoZJ6GVWRu4xYwq6m02ETHdFzj3cJ9QOXcEzD61JWRxPuo0mM0oav1kPGzP0gmayhA
	 0iM9I6J/YtJZ8FEv1RqX0umOJvyN9ZlafH6+apaV6FXSufni47c2+E0Jn+2f9sJ+xL
	 ymKqDZd9o0LjkXMA7k60YYdr3jxjxcT1TupvkUWQS0bKCYCdwtMwj9iO+AC6f52mae
	 xd/Bv0k0pivtGhM6XW5yVIO2pU9gw3TmE7q/BRNTossQvnQvoSK9hy64lyHR3KfV6h
	 BeSnprcvE+fuA==
Received: from localhost (0b7f-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::b7f])
	by mail.plaes.org (Postfix) with ESMTPSA id 25DCE4068A;
	Fri, 20 Feb 2026 16:17:07 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Michael Straube <straube.linux@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Minu Jin <s9430939@naver.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Karthikey D Kadati <karthikey3608@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Milos Puric <milospuric856@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] staging: rtl8723bs: Get rid of unused _rtw_init_queue
Date: Fri, 20 Feb 2026 18:15:17 +0200
Message-ID: <20260220161611.2398915-7-plaes@plaes.org>
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

Remove all the mentions of `_rtw_init_queue`. All the uncommented code
calling this function has been converted few years earlier.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c         | 3 ---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c      | 1 -
 drivers/staging/rtl8723bs/core/rtw_xmit.c         | 4 ----
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 --
 4 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f..e0c901a5459e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -21,9 +21,6 @@ void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 
 	spin_lock_init(&psta_recvpriv->lock);
 
-	/* for (i = 0; i<MAX_RX_NUMBLKS; i++) */
-	/* _rtw_init_queue(&psta_recvpriv->blk_strms[i]); */
-
 	INIT_LIST_HEAD(&psta_recvpriv->defrag_q.queue);
 	spin_lock_init(&psta_recvpriv->defrag_q.lock);
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index bdd4b6d8fd2e..76d32ae8ac9e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -67,7 +67,6 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 
 	spin_lock_init(&pstapriv->sta_hash_lock);
 
-	/* _rtw_init_queue(&pstapriv->asoc_q); */
 	pstapriv->asoc_sta_count = 0;
 	INIT_LIST_HEAD(&pstapriv->sleep_q.queue);
 	spin_lock_init(&pstapriv->sleep_q.lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 222851e8d985..c2833f3cd10b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -43,10 +43,6 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	init_completion(&pxmitpriv->xmit_comp);
 	init_completion(&pxmitpriv->terminate_xmitthread_comp);
 
-	/*
-	 * Please insert all the queue initialization using _rtw_init_queue below
-	 */
-
 	pxmitpriv->adapter = padapter;
 
 	INIT_LIST_HEAD(&pxmitpriv->be_pending.queue);
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 59fc2cdb195d..37e8ddb01dcd 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -53,8 +53,6 @@ int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
 #define rtw_netif_rx(ndev, skb) _rtw_netif_rx(ndev, skb)
 
-extern void _rtw_init_queue(struct __queue	*pqueue);
-
 static inline void flush_signals_thread(void)
 {
 	if (signal_pending(current))
-- 
2.53.0

