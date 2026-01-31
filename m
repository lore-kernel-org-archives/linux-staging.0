Received: from cvsmtppost30.nm.naver.com (cvsmtppost30.nm.naver.com [114.111.35.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCECF36A036
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 19:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769888422; cv=none; b=Q3a5zQQ3jEgV6U7YLZkvwM1lPbCSHhBSVT8Lz4aCurXwiOdPKb2716KrJQHc4vbNAZZopwGPJ4ykclgloyiIEoBfokx2E+jG6TdG5+mmnhko/zBYnYcq0OfrWdGgP70WKpDKQ/10mm6A9QQPWEJD1rqv1MYVbraBT8l8zNAP28w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769888422; c=relaxed/simple;
	bh=tNoYdz9W3wRd7hLkyrf+Fd2gOEeIXZMTZHcKUrrmNZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5qn8Ee/kkHFErsGo+ewOnWnYNcDmLC05YxqsTGfHfX3fm4Vnkg625OVbQx9V8Os+i7Xo79dtW9p4gnnt2ooDunZV+iyy90t+m3bjcdyKNg5WuOGBBYT3BJJrwDmpeHBeNtK1ZBeCSlwOKyiNEht4+LUxWZqS94Iu6VZsb5+gCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=l7Q9s27x; arc=none smtp.client-ip=114.111.35.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="l7Q9s27x"
Received: from cvsendbo019.nm ([10.112.22.34])
  by cvsmtppost30.nm.naver.com with ESMTP id gtoFThviRmqTJbu4pDiuMA
  for <linux-staging@lists.linux.dev>;
  Sat, 31 Jan 2026 19:30:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769887812; bh=tNoYdz9W3wRd7hLkyrf+Fd2gOEeIXZMTZHcKUrrmNZg=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=l7Q9s27xGSkjwe2ZSc5nyt1endDPEQ+oFJKONChgtjP5r2weFBp7DD0+uHa8+1x6/
	 Addj7kmJs84rduaKntfT+ZdhcJy3hJEiyDQ+JGpkT4zsbq2TzmdonfSVnRUuUJJFzQ
	 /2TkaZ6CoAJp3OtgtgvyMrs665kM6elnlbyPhuOVz1bMIA75o7B4TmidwJEbefg54i
	 ZOLmhZPXwhBugZOs+nU5TB5EstV7m19wZc1SdD6M2+daVK6qOTVgfxW1p9QW9kexom
	 vlbsS/pTvlzkEcqkf7e9298g1u/yU1ALhKjmNdDQv2LkftuHtO+503hEKONqSYQgjm
	 R2YNTtKiknjVw==
X-Session-ID: YGyHlPdDQR6Mt1yat6fNgA
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: uwY9aAvrFqJZ+HmwKxt9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp011.nm.naver.com with ESMTP id YGyHlPdDQR6Mt1yat6fNgA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 31 Jan 2026 19:30:11 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	andy@kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v4 3/4] staging: rtl8723bs: replace skb allocation, copy wrappers
Date: Sun,  1 Feb 2026 04:30:00 +0900
Message-ID: <20260131193001.303307-4-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260131193001.303307-1-s9430939@naver.com>
References: <20260131193001.303307-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the wrapper functions rtw_skb_alloc() and rtw_skb_copy() with
kernel APIs __dev_alloc_skb() and skb_copy().

I used GFP_ATOMIC for the network data paths  because these
functions are called in contexts where the driver cannot sleep.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 4 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c       | 2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 36798e23a650..a4250c49b9b4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1630,7 +1630,7 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 
 	pattrib = &prframe->u.hdr.attrib;
 
-	sub_skb = rtw_skb_alloc(nSubframe_Length + 12);
+	sub_skb = __dev_alloc_skb(nSubframe_Length + 12, GFP_ATOMIC);
 	if (!sub_skb)
 		return NULL;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index e739f55ba34d..2f2ce91ca113 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -292,7 +292,7 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 					alloc_sz += 14;
 				}
 
-				pkt_copy = rtw_skb_alloc(alloc_sz);
+				pkt_copy = __dev_alloc_skb(alloc_sz, GFP_ATOMIC);
 				if (!pkt_copy) {
 					rtw_free_recvframe(precvframe, &precvpriv->free_recv_queue);
 					break;
@@ -399,7 +399,7 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 			SIZE_PTR tmpaddr = 0;
 			SIZE_PTR alignment = 0;
 
-			precvbuf->pskb = rtw_skb_alloc(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ);
+			precvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
 
 			if (precvbuf->pskb) {
 				precvbuf->pskb->dev = padapter->pnetdev;
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index ad1f01ffbc87..a0d3451ffd0d 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -810,7 +810,7 @@ static struct recv_buf *sd_recv_rxfifo(struct adapter *adapter, u32 size)
 		SIZE_PTR tmpaddr = 0;
 		SIZE_PTR alignment = 0;
 
-		recvbuf->pskb = rtw_skb_alloc(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ);
+		recvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
 		if (!recvbuf->pskb)
 			return NULL;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 20d2926a4480..8372b72b53b3 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -159,7 +159,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 		    !memcmp(psta->hwaddr, bc_addr, 6))
 			continue;
 
-		newskb = rtw_skb_copy(skb);
+		newskb = skb_copy(skb, GFP_ATOMIC);
 
 		if (newskb) {
 			memcpy(newskb->data, psta->hwaddr, 6);
-- 
2.43.0

