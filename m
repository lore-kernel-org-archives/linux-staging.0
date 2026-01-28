Received: from cvsmtppost17.nm.naver.com (cvsmtppost17.nm.naver.com [114.111.35.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE9C25F99F
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 14:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609418; cv=none; b=GXHVZ64qvoYR/qAkU++s5PPGzQ5LmZCBLYcKsJQYT+mzZcKlMNGVgpMLPPgfSenSvnsAHy2eAQXJWAxVw/vj7NCUiZi81NilKur7uUbKxF4F8uWy97ztFnW0gqKsTXRkcj4ShdoUQOAu9nUGd8yaHs5T2jsV6NWY6e/HYtWNi/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609418; c=relaxed/simple;
	bh=YiptIzsG4pEE5JyXTbZn6ncJmdvsqg1aXZzSIujK+j8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBe1U/AgCD+LBzHowIQhVrckbXAfudm9UyEvVq+wWq1eyyt7Tx5m/sR86/cPvp8dvJ4owGfOoX94hCD+0H9mZn/PKGnUfuTi3M9vmt3kagdVxO6DCL2n6sNn0fHZBNp1PguGfgahXqeOCzsJfvi8v+BCDuGPJFE1iTkCF4Teyik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=pbk/amMv; arc=none smtp.client-ip=114.111.35.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="pbk/amMv"
Received: from mvsendbo19.nm ([10.179.40.211])
  by cvsmtppost17.nm.naver.com with ESMTP id 57I31sVIQB6vk6IoCc-rCw
  for <linux-staging@lists.linux.dev>;
  Wed, 28 Jan 2026 14:10:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769609407; bh=YiptIzsG4pEE5JyXTbZn6ncJmdvsqg1aXZzSIujK+j8=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=pbk/amMvznJNVYxt1h6zjbPj4n/2WSfp9WV3Kda/NzSL65X1bnkf69kXGRGGCmjz0
	 p4bOHgtjr+lhTauC80nYbgu3P7E3pa6q3WzBBiaywqug9NbO6t8feN2Mn25EVIIhcE
	 FQboQI7SO6Fk5EM6mPo5gxJdJd17B2u3gMQvVnSN6cc+hp1ooJB/lewy+85A1dEIah
	 bkbtiIrLV2dOxZEMf3QUGJ550q/2Rq0ENIZRPWWpqhvkqzIhI0YlfkvwImwOXOHj0W
	 Db5ehs82kjYmSE90Z+qG3vkjHfqGLbYqU+a2bUQLjfTLtCvy9U0jq4H1MbCkHUHpAV
	 cwB6JmKul+0xg==
X-Session-ID: MymJGPoHQQqjv-DUKosfAw
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: AZbXFxvrFqJZ+HmrKAgX+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp004.nm.naver.com with ESMTP id MymJGPoHQQqjv-DUKosfAw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 28 Jan 2026 14:10:06 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	andy@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v3 3/4] staging: rtl8723bs: replace skb allocation wrappers and fix build
Date: Wed, 28 Jan 2026 23:09:53 +0900
Message-ID: <20260128140954.1065382-4-s9430939@naver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260128140954.1065382-1-s9430939@naver.com>
References: <20260128140954.1065382-1-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the wrapper functions rtw_skb_alloc and rtw_skb_copy with
kernel APIs __dev_alloc_skb and skb_copy.

Additionally, this patch restores the definitions of _rtw_malloc and
_rtw_zmalloc that were prematurely removed in previous commits. This
ensures that the driver remains buildable, fixing git bisect issues
until all wrappers are fully migrated and can be safely removed in
the final cleanup step.

I used GFP_ATOMIC for the network data paths  because these
functions are called in contexts where the driver cannot sleep.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c         |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    |  4 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c          |  2 +-
 drivers/staging/rtl8723bs/include/osdep_service.h |  4 ++++
 drivers/staging/rtl8723bs/os_dep/osdep_service.c  | 15 +++++++++++++++
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c     |  2 +-
 6 files changed, 24 insertions(+), 5 deletions(-)

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
 
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 4e628c19b400..ed0ba892e902 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -54,12 +54,16 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
+void *_rtw_zmalloc(u32 sz);
+void *_rtw_malloc(u32 sz);
 void _kfree(u8 *pbuf, u32 sz);
 
 struct sk_buff *_rtw_skb_alloc(u32 sz);
 struct sk_buff *_rtw_skb_copy(const struct sk_buff *skb);
 int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
+#define rtw_malloc(sz)                 _rtw_malloc((sz))
+#define rtw_zmalloc(sz)                        _rtw_zmalloc((sz))
 #define rtw_skb_alloc(size) _rtw_skb_alloc((size))
 #define rtw_skb_alloc_f(size, mstat_f)	_rtw_skb_alloc((size))
 #define rtw_skb_copy(skb)	_rtw_skb_copy((skb))
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 46d0b9e6fa7a..c69318c4e9b0 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -14,6 +14,21 @@ inline int RTW_STATUS_CODE(int error_code)
 	return _FAIL;
 }
 
+void *_rtw_malloc(u32 sz)
+{
+	return kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
+}
+
+void *_rtw_zmalloc(u32 sz)
+{
+	void *pbuf = kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
+
+	if (pbuf)
+		memset(pbuf, 0, sz);
+
+	return pbuf;
+}
+
 inline struct sk_buff *_rtw_skb_alloc(u32 sz)
 {
 	return __dev_alloc_skb(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
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

