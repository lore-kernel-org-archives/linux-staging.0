Received: from cvsmtppost24.nm.naver.com (cvsmtppost24.nm.naver.com [114.111.35.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F3262FE7
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 14:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609422; cv=none; b=im57H8rNmzTvZnWt2W9xK5FBojIf7H2uOW5fJSk7JN0B3uKJ9xcwqW5eb/RurDEQZBaZRehQWxGFncH4QVU5g/P2L2DNZ3pQfYW0cMhnniFTTgK1u/Ibh74W7E88BH9roO6mjWxsZNxj4i+Y0WoioI37oeg74ZeUFI9/TvjdGcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609422; c=relaxed/simple;
	bh=5nh10fyw14gDsU8+EHJxjlHArUzA4x/WlklCucJg9ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCGEY/R+nmeUtj1naGw5bP+42LZoUGvkiagESHuAFDY83bAwyjy8qgCKwfgLif2sqSIlGTgKuWjUoZcRVCAdQGGuMEt8EnjU1iQ1Ve5f04fE9IxFt4Cggil4pXoyXUw9ALUWN4a1M7OxhpBmV575ot0HFyW+vRPxj/gTyPnv4IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=Rysrf3Ek; arc=none smtp.client-ip=114.111.35.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="Rysrf3Ek"
Received: from mvsendbo25.nm ([10.179.34.214])
  by cvsmtppost24.nm.naver.com with ESMTP id i5pYeCLsRluGI8GS96xT8w
  for <linux-staging@lists.linux.dev>;
  Wed, 28 Jan 2026 14:10:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769609409; bh=5nh10fyw14gDsU8+EHJxjlHArUzA4x/WlklCucJg9ZA=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Rysrf3EkqDf7FnFmrYbiaaPPZ6I4VARg7ykvUuQw3JrIsYC36LV1vAaE+O9U+9jIv
	 KcU+WKdDCTU/mtwe4dIURuwTu5lLfquVCasTcj1RAhAUjLByS0bIGu47NS04rm0qwt
	 bNyU7+PjlaClmRDLYItpZGhU40oqpRHYuJpdmQ8UsZogqZVthjB34kldtE9TBES1Qe
	 y7Cj1zkRz5MTQug6mdTAIFSk3J13J7CCyS8GcSfCCQUZPL7ge2LxBV3z5o8I5rOL3z
	 Mbkh/+iECkZ/JTUB8gLIy4tuD52bykisE1xtjPuBXgMRRaFLd16ZIIKeNRTLUi6H7j
	 UGkmqU8TR4ExA==
X-Session-ID: -ETuy5cvRq+S-2LDWW4xcw
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: AZYXFxvrFqJZ+Hm/KAgX+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp004.nm.naver.com with ESMTP id -ETuy5cvRq+S-2LDWW4xcw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 28 Jan 2026 14:10:08 -0000
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
Subject: [PATCH v3 4/4] staging: rtl8723bs: remove unused allocation wrapper functions
Date: Wed, 28 Jan 2026 23:09:54 +0900
Message-ID: <20260128140954.1065382-5-s9430939@naver.com>
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

All memory allocation call sites have been migrated to kernel
APIs (kmalloc, kzalloc, and skb functions). Therefore, the custom
wrapper layer is no longer necessary.

This patch removes all redundant wrapper functions and macros from
osdep_service.c and include/osdep_service.h, including unused macros
like rtw_skb_alloc_f.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 .../staging/rtl8723bs/include/osdep_service.h | 10 --------
 .../staging/rtl8723bs/os_dep/osdep_service.c  | 25 -------------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index ed0ba892e902..955e8678dc26 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -54,20 +54,10 @@
 
 extern int RTW_STATUS_CODE(int error_code);
 
-void *_rtw_zmalloc(u32 sz);
-void *_rtw_malloc(u32 sz);
 void _kfree(u8 *pbuf, u32 sz);
 
-struct sk_buff *_rtw_skb_alloc(u32 sz);
-struct sk_buff *_rtw_skb_copy(const struct sk_buff *skb);
 int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
-#define rtw_malloc(sz)                 _rtw_malloc((sz))
-#define rtw_zmalloc(sz)                        _rtw_zmalloc((sz))
-#define rtw_skb_alloc(size) _rtw_skb_alloc((size))
-#define rtw_skb_alloc_f(size, mstat_f)	_rtw_skb_alloc((size))
-#define rtw_skb_copy(skb)	_rtw_skb_copy((skb))
-#define rtw_skb_copy_f(skb, mstat_f)	_rtw_skb_copy((skb))
 #define rtw_netif_rx(ndev, skb) _rtw_netif_rx(ndev, skb)
 
 extern void _rtw_init_queue(struct __queue	*pqueue);
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index c69318c4e9b0..49aee33af220 100644
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
-	void *pbuf = kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
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

