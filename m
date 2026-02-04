Received: from mvsmtppost22.nm.naver.com (mvsmtppost22.nm.naver.com [61.247.196.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008CF277CB8
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211450; cv=none; b=ZLEFN+ldHX+62VZBCHv4HbJDh1aPyV0mZXti5fXqsNlpGGZT8eD3GVYn6uWwQUswbEhI8gjtEYiqO4B0uuQ7ul8fm/XPRhK6VYDsjG7qmi37ViXw0KekVGnEfJFPpZj0yMjPnFYHzdurAfH3NM8cQ/S4ULSvUqVdtdjHnv11ybc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211450; c=relaxed/simple;
	bh=i6WNelNiFRmSFKlIfQ9TXiiYoUpR4QbGf8zV8RYzVJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P02eHNhYxOIR2v5o4cVF7SwVpk/21ZgxXOF8vq85Gl+PHz0UE8FHOq4ydwzEnTU0l7HAXHQztNJ9IAV9otGG3/f5miEMldhXHMonJ4tSbYAKolOINBQHxwJgyeL6SYSoAm8UAUP9hk5Q7Oa6ObcecROBy2yaHmsQ6fWhbPuI4L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=Q/RZ/Thn; arc=none smtp.client-ip=61.247.196.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="Q/RZ/Thn"
Received: from cvsendbo025.nm ([10.112.18.59])
  by mvsmtppost22.nm.naver.com with ESMTP id zoy+gKt8QD2OFpwdQw0cVQ
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 13:14:00 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770210840; bh=i6WNelNiFRmSFKlIfQ9TXiiYoUpR4QbGf8zV8RYzVJk=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Q/RZ/Thn+JBB5pL5Lq3R0c6CTpCsAjBe0LS3JC5n2sah5hxi75HxqS/K0J0g1UqMw
	 CtuOxrtYjwtgnUGFh41t7OYoOWhLRYBvs2YRe+uDQbySpZ5/q4KfralJfKdBreqM2p
	 vjaoQbwfruMrCxRsH7bGxN26unl5G0r2IurSLUBQhQWckdn693JX2ZwW2pGgNzh382
	 JjwJ0QnLa8n70mgZMaE4QjPFLV0Lcebef9JQ6IUoMrSh2SjhEesnBoWjYDp+cnSQ5r
	 pXNoD3pE33PkBmRmgIpNHeeH0pl+IGsqjP0JEgcsmxBX5SoieEIxQg027YxJtPDcLN
	 Oywbxxe8fqMqg==
X-Session-ID: yAquAJlxT3eBm5mfTdc1PA
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: XqKXKxgXFqJZ+HmmFAt/+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id yAquAJlxT3eBm5mfTdc1PA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 13:14:00 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org,
	andy@kernel.org
Cc: dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v6 4/5] staging: rtl8723bs: use standard skb allocation APIs
Date: Wed,  4 Feb 2026 22:13:46 +0900
Message-ID: <20260204131347.3515949-5-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204131347.3515949-1-s9430939@naver.com>
References: <20260204131347.3515949-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace custom wrappers rtw_skb_alloc() and rtw_skb_copy() with
standard kernel APIs __dev_alloc_skb() and skb_copy().

About GFP Flags:
- GFP_ATOMIC is used for allocations in atomic contexts such as
  spinlock-protected sections, tasklets, and timer handlers.
- GFP_KERNEL is used for process contexts where sleeping is allowed.

Signed-off-by: Minu Jin <s9430939@naver.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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

