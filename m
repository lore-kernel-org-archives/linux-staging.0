Received: from cvsmtppost09.nm.naver.com (cvsmtppost09.nm.naver.com [114.111.35.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C32277CB8
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211445; cv=none; b=R+zrYl8Agh7VkAt1ZhI0L0GDRGhIJUknCUfjczuZFemN00Lq/23SNdDaw7/l94InfkYCfefSfaIfKCblBCeIa4RFU2/qDFwxOzuDjNN1byjBJZn5eYWOKWwrJ+7IUt+LTaFAtG7eNYGT3dUxCVBsayVWqm4aouKqNoJF4oQhK0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211445; c=relaxed/simple;
	bh=oLcFFlXb4pyQeNcjT9SCzpOBhr+qButvS+vc6PoKcno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LIDkEoiIVeNfji07yG521Bw0+//2pZJDS/ouUFm9UPzgKR1nRRuxSXEI4lSwajlDp1oS4U4FuiAmQtZkdVAuwESkKk0FO4MEPZRm3yfD/MtCzmZijFkkE2rFPWw2zzBpO134HsxXpTKD50kfBS6we+PoUhSDjCil+EFYNCqBjjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=V8cmRkuW; arc=none smtp.client-ip=114.111.35.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="V8cmRkuW"
Received: from cvsendbo011.nm ([10.112.22.32])
  by cvsmtppost09.nm.naver.com with ESMTP id DZdD6RDCRLuPYdTx8QcYNA
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 13:13:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770210835; bh=oLcFFlXb4pyQeNcjT9SCzpOBhr+qButvS+vc6PoKcno=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=V8cmRkuWcd30XEvH5bLjgAyfE5VkveUbFmhMZXZGK+IABl8+LEGCU8QDQ0YZTUIxC
	 +VdcbJi46iwrYmJcKskMiJzdy66+6gpsJcFLkMnv/oTsDDIgskIW6NUkB8Rm4nATpW
	 vquAkKevwhdJkEq+pTd8OgPOVx4Qg3rMgtFocbQ9RNuYFBDyR0nTUBL6A8drgAJk26
	 PxtvcmtmUVWflqbvb3ysb19ilUWIrHA8lbNgIYt18gbNQjIkQwmZWjuINJaBzwQe9e
	 wMgfYnL5x7YkWpE60L4E0L6sdX/rDEWeylCaAvmJoRFpY4vHEBuEJ7jfKTkNnRAYzj
	 i/WHXPNuBohNQ==
X-Session-ID: jOGtsZDkS-mlfb52bIpN8w
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: XdKXKxgXFqJZ+Hm9Kqt/+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp008.nm.naver.com with ESMTP id jOGtsZDkS-mlfb52bIpN8w
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 13:13:55 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org,
	andy@kernel.org
Cc: dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v6 1/5] staging: rtl8723bs: introduce kmemdup() where applicable
Date: Wed,  4 Feb 2026 22:13:43 +0900
Message-ID: <20260204131347.3515949-2-s9430939@naver.com>
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

Replace memory allocation followed by memcpy() with kmemdup() to simplify
the code and improve readability.

About GFP Flags:
- GFP_ATOMIC is used for allocations in atomic contexts such as
  spinlock-protected sections, tasklets, and timer handlers.
- GFP_KERNEL is used for process contexts where sleeping is allowed.

Specifically, in OnAssocReq(), GFP_ATOMIC is used because
the allocation is performed while holding a spin lock.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           | 14 ++++----------
 drivers/staging/rtl8723bs/core/rtw_mlme.c         |  3 +--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  7 +++----
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    |  4 +---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  3 +--
 drivers/staging/rtl8723bs/os_dep/osdep_service.c  |  6 ++----
 6 files changed, 12 insertions(+), 25 deletions(-)

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
index 884fcce50d9c..c7c63009f779 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1333,11 +1333,10 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		spin_lock_bh(&pstat->lock);
 		kfree(pstat->passoc_req);
 		pstat->assoc_req_len = 0;
-		pstat->passoc_req =  rtw_zmalloc(pkt_len);
-		if (pstat->passoc_req) {
-			memcpy(pstat->passoc_req, pframe, pkt_len);
+		pstat->passoc_req = kmemdup(pframe, pkt_len, GFP_ATOMIC);
+		if (pstat->passoc_req)
 			pstat->assoc_req_len = pkt_len;
-		}
+
 		spin_unlock_bh(&pstat->lock);
 
 		/* 3-(1) report sta add event */
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

