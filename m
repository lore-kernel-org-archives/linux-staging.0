Received: from cvsmtppost05.nm.naver.com (cvsmtppost05.nm.naver.com [114.111.35.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DD4389452
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188133; cv=none; b=N2nC8+40gFIyB0U/lgW77nlHI4QHU5J99LlLGPJl1gz+rQTNC/riJxL8/twFThmyYx9gZ9SUIZsKgyIZ0HHtOuhvXwTEYg4a2OEDeoqCUohFikIS+CGHmpF5vH8wqBqoXxBe58EcxsJk82otAujs0NxyDPeWH/RopEogT2bXgac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188133; c=relaxed/simple;
	bh=JcSGWsUh0YIxrhrgeG8v/bSeyrFOJs84EuIQeJgb7AE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rMpoKe+I/mSg8hDQOVQl1M/IKwt/u7WJ4FrEd8x7VU0Nj+pjuf+lJs+AIHVWHxb4HvVZq/bFjWiHJ3uaQqhd4NjgfPLABvH/AZMVF6VR9oOoemTH2qmHUvHVS1V/sLStCIbrmj3/PluOAtumUweJGp8C1UgZvKjw9sPEjwzbMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=JYqw84iD; arc=none smtp.client-ip=114.111.35.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="JYqw84iD"
Received: from cvsendbo013.nm ([10.112.18.56])
  by cvsmtppost05.nm.naver.com with ESMTP id 5tN0Y7GNSx+Nvq9duGth4w
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 06:45:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770187524; bh=JcSGWsUh0YIxrhrgeG8v/bSeyrFOJs84EuIQeJgb7AE=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=JYqw84iD3xPIVKGGUO4lG1dWYvymtBqB0e/6CdjkV95RfGLASr7hBGtSdmW+Y159s
	 Gx9YkacxrqE4ONCyYOV3gZTzP6r+LyJ7fGWUIosoXbGE1/DLDfUsOm5sjO0+QzYQUK
	 nuY6rwLltRLB557vGKP8p5aMatCaPvk8nbDgsw3+A7rcgAreEHqqkmOa/bXQ4HD83Z
	 T6ZXA1S3E+5iYCN5rL69ImjX11s6GE8q8jtukgV65tNkbZzI1w4jl6VXZspletUVDx
	 V3jvEWJSV3DTAsDtNDvASzch9ebImWhN+197KUzm8c3YVresQP1DQZTF4Olx0JCtw9
	 OsRAh/IhvShmg==
X-Session-ID: MjCixTokTR6cx7fexL-diA
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: 9wY9KxgXFqJZ+HmqKou9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp001.nm.naver.com with ESMTP id MjCixTokTR6cx7fexL-diA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 06:45:23 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v5 4/5] staging: rtl8723bs: use standard skb allocation APIs
Date: Wed,  4 Feb 2026 15:44:53 +0900
Message-ID: <20260204064455.1379342-5-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204064455.1379342-1-s9430939@naver.com>
References: <20260204064455.1379342-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom wrappers rtw_skb_alloc() and rtw_skb_copy() with
standard kernel APIs __dev_alloc_skb() and skb_copy().

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c      | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 5 ++---
 drivers/staging/rtl8723bs/hal/sdio_ops.c       | 2 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c  | 3 +--
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f599a867eb0b..9016465d5140 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1630,7 +1630,7 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 nSubfra
 
 	pattrib = &prframe->u.hdr.attrib;
 
-	sub_skb = rtw_skb_alloc(nSubframe_Length + 12);
+	sub_skb = __dev_alloc_skb(nSubframe_Length + 12, GFP_ATOMIC);
 	if (!sub_skb)
 		return NULL;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 4cff14fe5d7a..5faac9f28b02 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -290,7 +290,7 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 					alloc_sz += 14;
 				}
 
-				pkt_copy = rtw_skb_alloc(alloc_sz);
+				pkt_copy = __dev_alloc_skb(alloc_sz, GFP_ATOMIC);
 				if (!pkt_copy) {
 					rtw_free_recvframe(precvframe, &precvpriv->free_recv_queue);
 					break;
@@ -397,8 +397,7 @@ s32 rtl8723bs_init_recv_priv(struct adapter *padapter)
 			SIZE_PTR tmpaddr = 0;
 			SIZE_PTR alignment = 0;
 
-			precvbuf->pskb = rtw_skb_alloc(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ);
-
+			precvbuf->pskb = __dev_alloc_skb(MAX_RECVBUF_SZ + RECVBUFF_ALIGN_SZ, GFP_ATOMIC);
 			if (precvbuf->pskb) {
 				precvbuf->pskb->dev = padapter->pnetdev;
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index e0a676bc4e88..c9cb20c61a2b 100644
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
index 20d2926a4480..f394b2ea6116 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -159,8 +159,7 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
 		    !memcmp(psta->hwaddr, bc_addr, 6))
 			continue;
 
-		newskb = rtw_skb_copy(skb);
-
+		newskb = skb_copy(skb, GFP_ATOMIC);
 		if (newskb) {
 			memcpy(newskb->data, psta->hwaddr, 6);
 			res = rtw_xmit(padapter, &newskb);
-- 
2.43.0

