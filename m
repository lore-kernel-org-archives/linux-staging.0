Received: from mvsmtppost20.nm.naver.com (mvsmtppost20.nm.naver.com [61.247.196.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD08261B96
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 07:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.247.196.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188737; cv=none; b=Py4V2x+cwbu/LQ+M9+YcQQu8LiO7Qcj7D9wB8IlEV/vJsRn8xuYCyoVYvpCtLTr3Tr1+fks7FsQGqRRkKTBywpVWEkQRHKRO+E5K09MtgO6xaw0DWKW1CZKAYv6lrgZ1/yL0D3C4S5QSLPp+a7W3nwrTlhab0SEQ136fvtQ+YtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188737; c=relaxed/simple;
	bh=WXKLIXQF4NkfrC0120lJJNVQ4xU9vbyUmaXr2vzxQ+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H6En4kmyILy+xigTODX9K6cWdSRn0i1hoBZdFFK1HDiqy9s/bU3GYIyOumpSlUbsU+sczNLF62lXPVlWWDr8P0XUhIjCs38Z+g6viZtbjBkHgcbyeZegkdSEZWu/+6idY+gpZjQd+VzSFrXGwMkfQw7qOPSD1EUNKjzTWIXHS8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=Z8j10I7h; arc=none smtp.client-ip=61.247.196.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="Z8j10I7h"
Received: from cvsendbo005.nm ([10.112.18.54])
  by mvsmtppost20.nm.naver.com with ESMTP id pDrdNnYaQzaJ-OTrB5VjWg
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 06:45:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770187520; bh=WXKLIXQF4NkfrC0120lJJNVQ4xU9vbyUmaXr2vzxQ+U=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=Z8j10I7hY//96eAN4dTS9Vmf6ZHwtWspgS5eLPEQ/e+qZNGI3Nq0OOcP8DwAIBECS
	 lnFETbjS2mCJTlN+xg99fuRGXMJaMQqvSHQdkNbRhrEBqhKwDxGBje0CS+ZM/xtLj6
	 5Rw+RcbzV/AE7FGILpzkQ9DM7FyR5KX3rUjoOC9n35E/jcrpaqNnai77szY+VDamel
	 Apfsi0PXMRXOCB5fUj+ouxCJkP1BDROUTONOQPOTo5bGaPtFEO+uFIloHRP8zQKbD1
	 ulJoPV9NzTquhS+jWMbTXUmeZ5KhLJO3oB/L0GeCoBtuk6BooAJvXLQe2QiiRuQ5gk
	 1x3lne2jd4BOQ==
X-Session-ID: ZdIjQ8OlSlu3NDLj54TOqA
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: 9qK9KxgXFqJZ+HmlKxu9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp001.nm.naver.com with ESMTP id ZdIjQ8OlSlu3NDLj54TOqA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 06:45:19 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v5 1/5] staging: rtl8723bs: introduce kmemdup() where applicable
Date: Wed,  4 Feb 2026 15:44:50 +0900
Message-ID: <20260204064455.1379342-2-s9430939@naver.com>
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

Replace memory allocation followed by memcpy() with kmemdup() to simplify
the code and improve readability.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           | 14 ++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  3 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  3 +--
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    |  4 +---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  3 +--
 drivers/staging/rtl8723bs/os_dep/osdep_service.c  |  6 ++----
 6 files changed, 10 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 477fe238add4..94f0e439abae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -114,11 +114,8 @@ static void update_BCNTIM(struct adapter *padapter)
 		dst_ie = pie + offset;
 	}
 
-	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
-		if (pbackup_remainder_ie && premainder_ie)
-			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
-	}
+	if (premainder_ie && remainder_ielen)
+		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
 
 	*dst_ie++ = WLAN_EID_TIM;
 
@@ -1440,11 +1437,8 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 
 	remainder_ielen = ielen - wps_offset - wps_ielen;
 
-	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
-		if (pbackup_remainder_ie)
-			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
-	}
+	if (premainder_ie && remainder_ielen)
+		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
 
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 8e1e1c97f0c4..2bbf2b17e3ba 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1337,10 +1337,9 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 			/* report to upper layer */
 			spin_lock_bh(&psta->lock);
 			if (psta->passoc_req && psta->assoc_req_len > 0) {
-				passoc_req = rtw_zmalloc(psta->assoc_req_len);
+				passoc_req = kmemdup(psta->passoc_req, psta->assoc_req_len, GFP_ATOMIC);
 				if (passoc_req) {
 					assoc_req_len = psta->assoc_req_len;
-					memcpy(passoc_req, psta->passoc_req, assoc_req_len);
 
 					kfree(psta->passoc_req);
 					psta->passoc_req = NULL;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884fcce50d9c..fb16febec151 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1333,9 +1333,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		spin_lock_bh(&pstat->lock);
 		kfree(pstat->passoc_req);
 		pstat->assoc_req_len = 0;
-		pstat->passoc_req =  rtw_zmalloc(pkt_len);
+		pstat->passoc_req = kmemdup(pframe, pkt_len, GFP_ATOMIC);
 		if (pstat->passoc_req) {
-			memcpy(pstat->passoc_req, pframe, pkt_len);
 			pstat->assoc_req_len = pkt_len;
 		}
 		spin_unlock_bh(&pstat->lock);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 399edfbf8ec6..0980fa4718b1 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -159,12 +159,10 @@ static void rtl8723bs_c2h_packet_handler(struct adapter *padapter,
 	if (length == 0)
 		return;
 
-	tmp = rtw_zmalloc(length);
+	tmp = kmemdup(pbuf, length, GFP_ATOMIC);
 	if (!tmp)
 		return;
 
-	memcpy(tmp, pbuf, length);
-
 	res = rtw_c2h_packet_wk_cmd(padapter, tmp, length);
 
 	if (!res)
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 476ab055e53e..3cc3faba8ce2 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1163,11 +1163,10 @@ static int rtw_cfg80211_set_probe_req_wpsp2pie(struct adapter *padapter, char *b
 				pmlmepriv->wps_probe_req_ie = NULL;
 			}
 
-			pmlmepriv->wps_probe_req_ie = rtw_malloc(wps_ielen);
+			pmlmepriv->wps_probe_req_ie = kmemdup(wps_ie, wps_ielen, GFP_KERNEL);
 			if (!pmlmepriv->wps_probe_req_ie)
 				return -EINVAL;
 
-			memcpy(pmlmepriv->wps_probe_req_ie, wps_ie, wps_ielen);
 			pmlmepriv->wps_probe_req_ie_len = wps_ielen;
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 01ca423faf87..c999071cadde 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -129,11 +129,9 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		goto keep_ori;
 
 	/* duplicate src */
-	dup = rtw_malloc(src_len);
-	if (dup) {
+	dup = kmemdup(src, src_len, GFP_ATOMIC);
+	if (dup)
 		dup_len = src_len;
-		memcpy(dup, src, dup_len);
-	}
 
 keep_ori:
 	ori = *buf;
-- 
2.43.0

