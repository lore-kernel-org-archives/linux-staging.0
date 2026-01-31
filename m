Received: from cvsmtppost06.nm.naver.com (cvsmtppost06.nm.naver.com [114.111.35.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC3436AB4D
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 19:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769888423; cv=none; b=UqyT67JWT1PJIbvc70G9o9PBqeGBDDndkovA44Gp3JHNWp3Kb3d/vzhnbows921QMvRUkepqmPHb7TMBilUFXvsn5yDOc+7l5iuBeSzfsA1Xt4XnLlPlUZhRV/UrdlUKGtAw5BUDBmbYAoSlUL0HFW+wE72yof+5QJmq+fw9RQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769888423; c=relaxed/simple;
	bh=Eraob/47GFv92oo77yPdKg6r0OEtzAih5CiW9zDiTKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glfWAlctkZ2NGoJwjfQNLQrJJzVeEhyPUL39VHFEVjI8bwcjcseSFO/v+GvEOVz3WTsS8DdBppfWjD9OiFccIBvJoG8uHiJo6Hp9s30O16DOQYa03ToYqjaU+/6ptsfx779cleRSlt6R7iNKJWdECV6PyzKWsIyTNpUOp9pWaOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=Gx/Fubjz; arc=none smtp.client-ip=114.111.35.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="Gx/Fubjz"
Received: from cvsendbo016.nm ([10.112.24.39])
  by cvsmtppost06.nm.naver.com with ESMTP id B704551vRfqkM39G8gWong
  for <linux-staging@lists.linux.dev>;
  Sat, 31 Jan 2026 19:30:13 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769887813; bh=Eraob/47GFv92oo77yPdKg6r0OEtzAih5CiW9zDiTKg=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Gx/FubjzBGaJKZUVVsc4RGRE673QZLX8sBH08u+iQGVqL7bRJUwENYOnWbXLz8ZeM
	 JWrgeoKUkSbewCRF/8LNLQfYmnindtl9qp9HmRuYbirLMuUrWZVJv6XGpmftcF3BDC
	 cz8ditojCnWwAYLX6SVR5KQVLAtuoDYj6EhJtiyvgpq95KZIdFDb5Bs7HZywTWWtSI
	 J3br4bG9g5rzO9y4EjuAz5JXBUIN5s/G1yyvMt0kA4FvMT0w2EjaK0FBhSKWwxD4tK
	 qJ36QFeJNuFqHorTFa680TGAbxT7hGYPDLoRDDsRHG5AZVc4k23BDtO4QLUr5QumO8
	 ZECb7sBCkfHtQ==
X-Session-ID: oV5fkIzWRJ6hjKXGchaUYQ
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: uZK9aAvrFqJZ+HmZKxt9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp011.nm.naver.com with ESMTP id oV5fkIzWRJ6hjKXGchaUYQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 31 Jan 2026 19:30:12 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	andy@kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v4 4/4] staging: rtl8723bs: remove unused allocation wrapper functions
Date: Sun,  1 Feb 2026 04:30:01 +0900
Message-ID: <20260131193001.303307-5-s9430939@naver.com>
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

All memory allocation call sites have been migrated to kernel
APIs (kmalloc, kzalloc, and skb functions). Therefore, the custom
wrapper layer is no longer necessary.

This patch removes all redundant wrapper functions and macros from
osdep_service.c and include/osdep_service.h, including unused macros
like rtw_skb_alloc_f.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 .../staging/rtl8723bs/include/osdep_service.h | 11 ---------
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 24 -------------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 6458ff95ff9d..955e8678dc26 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -54,21 +54,10 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
-void *_rtw_zmalloc(u32 sz);
-void *_rtw_malloc(u32 sz);
 void _kfree(u8 *pbuf, u32 sz);
 
-struct sk_buff *_rtw_skb_alloc(u32 sz);
-struct sk_buff *_rtw_skb_copy(const struct sk_buff *skb);
 int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
-#define rtw_malloc(sz)			_rtw_malloc((sz))
-#define rtw_zmalloc(sz)			_rtw_zmalloc((sz))
-
-#define rtw_skb_alloc(size) _rtw_skb_alloc((size))
-#define rtw_skb_alloc_f(size, mstat_f)	_rtw_skb_alloc((size))
-#define rtw_skb_copy(skb)	_rtw_skb_copy((skb))
-#define rtw_skb_copy_f(skb, mstat_f)	_rtw_skb_copy((skb))
 #define rtw_netif_rx(ndev, skb) _rtw_netif_rx(ndev, skb)
 
 extern void _rtw_init_queue(struct __queue	*pqueue);
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 770d7c1b41b0..a9febe1efc83 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -14,30 +14,6 @@ inline int RTW_STATUS_CODE(int error_code)
 	return _FAIL;
 }
 
-void *_rtw_malloc(u32 sz)
-{
-	return kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
-void *_rtw_zmalloc(u32 sz)
-{
-	void *pbuf = kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-	if (pbuf)
-		memset(pbuf, 0, sz);
-
-	return pbuf;
-}
-
-inline struct sk_buff *_rtw_skb_alloc(u32 sz)
-{
-	return __dev_alloc_skb(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
-inline struct sk_buff *_rtw_skb_copy(const struct sk_buff *skb)
-{
-	return skb_copy(skb, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
 inline int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb)
 {
 	skb->dev = ndev;
-- 
2.43.0

