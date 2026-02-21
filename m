Received: from mail.plaes.org (mail.plaes.org [188.166.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DED32566E9
	for <linux-staging@lists.linux.dev>; Sat, 21 Feb 2026 19:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.166.43.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771700986; cv=none; b=FSJrSkjYDAhoPL5ZZtJg7l1KvY6p2qIc3FrIiFYO8lp7Nrku7xnFdjLJa6sFPj/N0TV1NLwwt4WZu8cO2YXdZRsBWqGaPJjrEP/aqTkfso8PKT1z+IKdG3n3395HAtOfHAmSNCXG94p/98g5cVjEYKgDs3MD5dGSN/Y9I3rRGL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771700986; c=relaxed/simple;
	bh=CTiPD3Zm3FY+6eVc0GtVeyPiweg4pLYt7+jWqj0vv7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hfkzEjyZwNLBCxnhSMipKpR/+3HAEJMYZ6j9idDhQPEZV+mFk0KTvb8QvKq+HgMvXs7tHCX30RDIV2cjL8lLN25GOY0jXo2zb+IrjPk8Dp3ss0Zo8HpvII8McyBybMnr6UNXYFwajTRPBcp53qCrecf0nyDvpKVKYf7OwtCnDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org; spf=pass smtp.mailfrom=plaes.org; dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b=ldSdW76E; arc=none smtp.client-ip=188.166.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=plaes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plaes.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plaes.org header.i=@plaes.org header.b="ldSdW76E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=plaes.org; s=mail;
	t=1771700982; bh=CTiPD3Zm3FY+6eVc0GtVeyPiweg4pLYt7+jWqj0vv7M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ldSdW76EvUmJu1TUEHTz7+GctlEHVG9EeFi+hbmgChpn6gm0pzP+aKqHzY79wv4AC
	 8cSrvhHvEGSfhXV42WmtIPSffIOprl0wg/D0uLEJsX1UI6UcK5y8GfPFJKI3st5LR8
	 TNVDYC88nmpxLxB6wVeGLJGWyOYvk340hiqShd1iOJv/nUq3V2TccBdHDKMviVPxzF
	 6nz7sQxNwIhIVd5f2wsL/7dwFh/p4i4ciT6ybZKc45i9ru6aE7wSFvgHwmk1RHaE4l
	 9Mbok3XGj90xG8ggRet4tzwUsZwUyH2xSxoQggCV9Qz1WofOmj8qMAFAEy8/raGx/g
	 rGWQK7fVd/81A==
Received: from localhost (0bd2-0000-0000-0000-6400-8cb1-07d0-2001.dyn.estpak.ee [IPv6:2001:7d0:8cb1:6400::bd2])
	by mail.plaes.org (Postfix) with ESMTPSA id BBA81400D2;
	Sat, 21 Feb 2026 19:09:42 +0000 (UTC)
From: Priit Laes <plaes@plaes.org>
To: 
Cc: Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philip Thayer <thayerscirez@gmail.com>,
	JJ Strnad <strnad.jj@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Michael Huang <tehsiu.huang@gmail.com>,
	Nino Zhang <ninozhang001@gmail.com>,
	=?UTF-8?q?Rog=C3=A9rio=20Fernandes=20Pereira?= <rfp2005@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	Diksha Kumari <dikshakdevgan@gmail.com>,
	yingche <zxcv2569763104@gmail.com>,
	Milos Puric <milospuric856@gmail.com>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Erick Karanja <karanja99erick@gmail.com>,
	SeungJu Cheon <suunj1331@gmail.com>,
	Akiyoshi Kurita <weibu@redadmin.org>,
	Sun Jian <sun.jian.kdev@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/11] staging: rtl8723bs: Get rid of unused _rtw_init_queue
Date: Sat, 21 Feb 2026 21:01:36 +0200
Message-ID: <20260221190628.50273-7-plaes@plaes.org>
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

While `_rtw_init_queue` function was reworked ~4 years ago,
there were still some leftovers in commented out code and also
header file.

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

