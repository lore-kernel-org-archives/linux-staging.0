Received: from cvsmtppost03.nm.naver.com (cvsmtppost03.nm.naver.com [114.111.35.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD5F345CA5
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 13:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211451; cv=none; b=I/NAJ7XKd/TrFuv+0MGWRoSSwyBHP/dp1bXCyRjQ9K53ivwabonVgo4hK5zEgFqmd9oeBZoEiF9gHb3kv1W25K5b56ZhUC5EVpUG2VdS4ZxJcAkVtxC4CLsvJbA/GhFqw53/tiRNTkVhdQnBNX59zA1o9wuN6HiYGcyY7acXzwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211451; c=relaxed/simple;
	bh=ReLkNKICL7RjZJn8yNitBNNG9G+sk/JdI8veXJ8uPQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GtW4X49O8ZT7148oVXgGFN67iEgROAIgBnyqGOWcfQCGvuY95Imqvy0KnYHWcdICdZb4zqiSTnzH4/PNRwoy0w8dSnaPIozHAuNal+hulbWEJ+d1y0BWPy0i0OlCtiHtpVawxzvdn8kB1kReJvv65DgTqyz6RZo3s+SmrfeCBnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=PDqS5lkd; arc=none smtp.client-ip=114.111.35.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="PDqS5lkd"
Received: from cvsendbo019.nm ([10.112.22.34])
  by cvsmtppost03.nm.naver.com with ESMTP id AUcN06lWQGqNnbycAMRpuA
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 13:14:02 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770210842; bh=ReLkNKICL7RjZJn8yNitBNNG9G+sk/JdI8veXJ8uPQk=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=PDqS5lkdsEgoym5dvqbyN+Jwbc/I2jmrRHgQi3HV6Z5/K/8+MtF47ox2TZESXpiOU
	 P93YnZQKcR2/XqhMiDt4nSq2DVjm4gO4fWQ+Rt6PZgVSBfS/sqkhfI7XSIl3S/RAwE
	 mSydgc9ULgy6ObW7S4fi9AmyMQFWygexWfXNem6aSRmoOqF7lJd25axDCiNUI39JMT
	 A7x3uThyPF7P+FB3540z2sOn6TEf+NF3swww2+1+NYn8iF05N2G5GZb2eZW6gxYoTN
	 RySO3ZSRsEl1z34eoP+LbNQ7NtBD9yGJNiClT0t/tTGrlVkq9BMLmdym0lG9bbwx0G
	 6IcMEQxj6/Lag==
X-Session-ID: 7PvkJljZTyuf7SuHZQqghg
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: XqbXKxgXFqJZ+HmwFAt/+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id 7PvkJljZTyuf7SuHZQqghg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 13:14:01 -0000
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
Subject: [PATCH v6 5/5] staging: rtl8723bs: remove unused allocation wrapper functions
Date: Wed,  4 Feb 2026 22:13:47 +0900
Message-ID: <20260204131347.3515949-6-s9430939@naver.com>
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

Remove the custom memory allocation wrapper functions and macros from
osdep_service.c and osdep_service.h as they are no longer used.

Signed-off-by: Minu Jin <s9430939@naver.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../staging/rtl8723bs/include/osdep_service.h | 11 --------
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 25 -------------------
 2 files changed, 36 deletions(-)

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
index 5ff4ed73428a..2a8fdafefcd9 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -14,31 +14,6 @@ inline int RTW_STATUS_CODE(int error_code)
 	return _FAIL;
 }
 
-void *_rtw_malloc(u32 sz)
-{
-	return kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
-void *_rtw_zmalloc(u32 sz)
-{
-	void *pbuf = _rtw_malloc(sz);
-
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

