Received: from cvsmtppost36.nm.naver.com (cvsmtppost36.nm.naver.com [114.111.35.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4922CBD9
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 07:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188742; cv=none; b=S3s5+JhRrOBVZmm7U604oK79pSZrclkgZLsQYLcWJuJWTqG6QZ/lf0dAwi/2KYXF5Gm9eLgC4SOGgDzrE0niLrXlJx7BWK/q95R1waIBI6jRNz/yPjyiwo5y7slFJ5mL89xpwI3Gxemj/Vc/GTbQlPvFVYt75x80mEaEjFIxi20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188742; c=relaxed/simple;
	bh=J93l7Sg0K0MUOx+zYJG7dOMsAa0nvX8MI/vf92Ne9Z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CfNgB9cON6ATQocBqlJ/fatHBrO0g/QhIyVA1HhRNKvDN/E9eHanFNOgZ4kdfxHtp7RqXSecfOGbghRCciKYAiMKmD7a6XCHjiB/nX3bB4acg2QuTMNHurG9x+CVtwK0WhERVYz1BMYC9D+SrCttdDLiSPoCDeZhXMZ5iv04mOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=G3l3IVei; arc=none smtp.client-ip=114.111.35.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="G3l3IVei"
Received: from cvsendbo035.nm ([10.112.22.38])
  by cvsmtppost36.nm.naver.com with ESMTP id oneQ9achSImHlSRdokYo8g
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 06:45:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770187525; bh=J93l7Sg0K0MUOx+zYJG7dOMsAa0nvX8MI/vf92Ne9Z0=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=G3l3IVeiRmolADMLb0byyzSm/UgWn66YlRUz41BmfyDZsdotSiHjPTGhoN/ogpScq
	 ATxabx7e7bPlaJhSTkrAIujPxD+KrmmvGbM7wVP/j1DESkJJ+3bp4DKx7pt5oZVi22
	 fV+PrXFjGqoOFWWbw3/GrF3LaGy7hXZVZYZ/2JZAnbTlGdC0FxwknDhcAB58PAXRMH
	 pi8KyOvUfem6oMyiz3/HmjatptwDyEw6+KeIgTDe1W6PnFynQ4rVpQslEf1J7utkPS
	 OoWGoof455v7MFCZEtgGD8mUyC44396t4m8PtNS4l6wkJv4BNfHx68QJyWGGo42KXa
	 4xwxlndFZddwg==
X-Session-ID: Qozn+1tjSzS05u3e4gwztQ
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: 9Zb9KxgXFqJZ+Hm9Kou9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp001.nm.naver.com with ESMTP id Qozn+1tjSzS05u3e4gwztQ
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 06:45:25 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v5 5/5] staging: rtl8723bs: remove unused allocation wrapper functions
Date: Wed,  4 Feb 2026 15:44:54 +0900
Message-ID: <20260204064455.1379342-6-s9430939@naver.com>
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

Remove the custom memory allocation wrapper functions and macros from
osdep_service.c and osdep_service.h as they are no longer used.

Signed-off-by: Minu Jin <s9430939@naver.com>
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

