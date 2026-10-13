Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326B7542EEF
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 20:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922550; cv=none; b=sxqDeK14HoMLaR1/5dfzd2yCLnT1Dq5O1AO2jIG4O6bfh6lMStFt2Fn2nCpxwjJW5mjFkJx+0ISEXTjbMrAnuy80sV/spAROb7j/Xk2rGPmql1+6TkA8yrNygONg5lfrfythmTzx+xEEVvvM4uUPvg12UKyj/CDboJVVgkgahK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922550; c=relaxed/simple;
	bh=/4sN80egNkOhp7Y0xA7GlnS2ylBeKF+0+kjrQt9XOkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdaLu8I4tnQCC9ZY+R14WoQk/exCRyTADdz7nDN8EXoS6sLVthIJSTNaclhCqzRP2aUcqsHUVZmNQf9DU4xdUobSeAJwt2UC8vzMaYG8JXjSrQKK5nctx67V6KUSZ9S6VtLtGUlrIfDTSwbQt66hq2xkTtd3XJHvz4QM9zF3Lys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmtyF5r5; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmtyF5r5"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-822ddb835fbso2491229a34.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 13:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922545; x=1792527345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PtkALnml1BFj40cO4YIh2d4PtMJJuv1aPw/IiEsjms=;
        b=GmtyF5r54yrKE/s7LDHWuWp+huEoNjHf2/ReQmfZzUbMjcd9X1NM7WvyZvVYJr4zvb
         HWGUA6Nwe23Ey3ULztdl1cmy3+dOpyzFAwxN7h/lO6SlckV0Ib01yPKODf5AFl8yhtBq
         0sguU4G4h9zBIbil4qL97Gqpaf22TuZ32CmypyFjKxvifHHFJrh1lK01BrR1pAy4d/TO
         YGI8z1bnaLi58KzH9X9oovTP/mMLyCKkmac7/zHgX0hrJ3y5LwkYATOGOy2FP1G5wmMR
         US5C+0BZ+SCMiwdKuufvhgm1md+61HtQi1IGIe25Hqr8W6c/gIYgifO8d1sDhkGQmG4I
         UqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922545; x=1792527345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PtkALnml1BFj40cO4YIh2d4PtMJJuv1aPw/IiEsjms=;
        b=EBjMzYgAzDGDB7gp6VDZXvHM7TwTa0VHY34S/ENLfMsfkm6ErunK5nZ2akNU9UXT5G
         0tIxqoEw43rTsFGToqxCMWz1pOOVglUf8d3WvygkJRrRD1XymRlbkMeryhVqjlXRFiAA
         x+OqxRtoEViZ8akfHrqWTfcK96t3dF56zJiGBo6xW3X6d2+9zgUOZLfLeT9qmT5BPj4U
         8beufnucuDiSjxaD0yN7NkMf1gk7ZNIxsXQ+VfOOMYY5/0DdvwDjq1TxQAcwe5cvDB2e
         xxBqB/0u+XWA5u3fcxF3YdFgcKUYFKhR3o1C2MbqhwEvb+M8xCQdOcf54d1ehPO3roTp
         Bi9w==
X-Gm-Message-State: AFq9FYIgHVsyoZCgHNW2Z1GxTFNhK0OQBHCSfv12GEEU49EFjZA6KBz9
	Q4P/pnW60c5maqOIR7v3RqaM9wfIcFtS5gCas7BWZENOUReiU8bCbLD8lP506bYdsp0=
X-Gm-Gg: AYBFou2NM/xJffxeA1PFyNOgpSdINWaOPMqnGdImtnAl0cHmifLv/hnX/J7zBYbqEfM
	u0nZ6PXyKsf3f1rKWAsI8KTR5tC3xHvQoyD7yo9n2LpjVF62GNm2sOA+eYY9D+Wuggu43Fc3pkS
	i6h79b4L6fW4a3rYrgXObM+TCX7kHQHbD/tlf8LwOg7J2AxnPvmJRDhQ9qvO6qRhbIg8LynL0pl
	mq5xKfh8B3/+bjA/tQ8iWohO9VZyj9dDpPwtcTd0Yn8ZqBBDKS+jCAmPd1S8LRNwbqJzK1jGCLK
	/klhxRkPPD5qlfw6/03+SpB9qfKQR47NF+awTbTC8wJQ1AwEESoZsoLK96ssySFqKEu9yLsPHFP
	R7R4Z4vZw7a4pmK1sKHZ2CkxFkvpkz0EnmIzs7m1KEs/EiQ2k7qLf9zr7v8Poj+JxtBFTZi9up0
	teQQnOJZ1XIcP0nCVInBBy7N9CbjAd6qOfh6BT+qlJHjFVkC3wATMQr26V8/syDcCYnl65gx64/
	+g=
X-Received: by 2002:a05:6830:270d:b0:810:521f:3033 with SMTP id 46e09a7af769-8309506c445mr12813593a34.10.1791922544604;
        Tue, 13 Oct 2026 13:15:44 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:44 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 04/10] staging: rtl8723bs: use ieee80211_is_*() for frame type tests
Date: Tue, 13 Oct 2026 15:15:32 -0500
Message-ID: <20261013201538.43156-5-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several functions test whether a received or transmitted frame is of
one particular type or subtype by comparing the result of
GetFrameType() or GetFrameSubType() against the driver's WIFI_*
constants. <linux/ieee80211.h> provides ieee80211_is_*() helpers that
perform the same tests on the frame_control member of
struct ieee80211_hdr.

Replace these single comparisons with the corresponding helpers:

  GetFrameType() == WIFI_MGT_TYPE    -> ieee80211_is_mgmt()
  GetFrameType() == WIFI_CTRL_TYPE   -> ieee80211_is_ctl()
  GetFrameType() == WIFI_DATA_TYPE   -> ieee80211_is_data()
  GetFrameSubType() == WIFI_BEACON   -> ieee80211_is_beacon()
  GetFrameSubType() == WIFI_PSPOLL   -> ieee80211_is_pspoll()
  GetFrameSubType() == WIFI_ASSOCREQ -> ieee80211_is_assoc_req()
  GetFrameSubType() == WIFI_DEAUTH   -> ieee80211_is_deauth()
  GetFrameSubType() == WIFI_DISASSOC -> ieee80211_is_disassoc()

The QoS data test in sta2ap_data_frame() is replaced with
ieee80211_is_data_qos(). The helper additionally checks that the frame
type is data, which is always the case on this path since the frame
has already been classified as a data frame by validate_recv_frame().

Remove IsFrameTypeCtrl(), whose only caller is converted by this
change.

The remaining users of GetFrameType() and GetFrameSubType() are
converted separately.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c         | 11 ++++++-----
 drivers/staging/rtl8723bs/core/rtw_xmit.c         |  3 ++-
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c    |  5 +++--
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  3 ++-
 drivers/staging/rtl8723bs/include/wifi.h          |  5 -----
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  6 +++---
 7 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 842c3d39c..dfe4f6210 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -436,7 +436,7 @@ void mgt_dispatcher(struct adapter *padapter, union recv_frame *precv_frame)
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, hdr->addr2);
 
-	if (GetFrameType(pframe) != WIFI_MGT_TYPE)
+	if (!ieee80211_is_mgmt(hdr->frame_control))
 		return;
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 43452f50d..3dcb4c8b5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -859,6 +859,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 		       struct sta_info **psta)
 {
 	u8 *ptr = precv_frame->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)ptr;
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct sta_priv *pstapriv = &adapter->stapriv;
 	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -882,7 +883,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 
 		process_pwrbit_data(adapter, precv_frame);
 
-		if ((GetFrameSubType(ptr) & WIFI_QOS_DATA_TYPE) == WIFI_QOS_DATA_TYPE)
+		if (ieee80211_is_data_qos(hdr->frame_control))
 			process_wmmps_data(adapter, precv_frame);
 
 		if (GetFrameSubType(ptr) & BIT(6)) {
@@ -915,7 +916,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	struct sta_info *psta = NULL;
 
-	if (GetFrameType(pframe) != WIFI_CTRL_TYPE)
+	if (!ieee80211_is_ctl(hdr->frame_control))
 		return _FAIL;
 
 	/* receive the frames that ra(a1) is my address */
@@ -930,7 +931,7 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	psta->sta_stats.rx_ctrl_pkts++;
 
 	/* only handle ps-poll */
-	if (GetFrameSubType(pframe) == WIFI_PSPOLL) {
+	if (ieee80211_is_pspoll(hdr->frame_control)) {
 		u16 aid;
 		u8 wmmps_ac = 0;
 
@@ -1128,9 +1129,9 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 	psta_addr = pfhdr->attrib.ta;
 	psta = rtw_get_stainfo(pstapriv, psta_addr);
 	if (!psta) {
-		u8 type = GetFrameType(pfhdr->rx_data);
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pfhdr->rx_data;
 
-		if (type != WIFI_DATA_TYPE) {
+		if (!ieee80211_is_data(hdr->frame_control)) {
 			psta = rtw_get_bcmc_stainfo(padapter);
 			pdefrag_q = &psta->sta_recvpriv.defrag_q;
 		} else {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index db75ff51f..2e1a4b483 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1231,7 +1231,8 @@ int rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		memset(MME, 0, 18);
 
 		/* other types doesn't need the BIP */
-		if (GetFrameSubType(pframe) != WIFI_DEAUTH && GetFrameSubType(pframe) != WIFI_DISASSOC)
+		if (!ieee80211_is_deauth(pwlanhdr->frame_control) &&
+		    !ieee80211_is_disassoc(pwlanhdr->frame_control))
 			goto xmitframe_coalesce_fail;
 
 		MGMT_body = pframe + sizeof(struct ieee80211_hdr_3addr);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index a62b845c6..79d6d7431 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -82,6 +82,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 		(struct odm_phy_info *)(&pattrib->phy_info);
 
 	u8 *wlanhdr = precvframe->u.hdr.rx_data;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)wlanhdr;
 	u8 *my_bssid;
 	u8 *rx_bssid;
 	u8 *rx_ra;
@@ -101,7 +102,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 
 	my_bssid = get_bssid(&padapter->mlmepriv);
 	rx_bssid = get_hdr_bssid(wlanhdr);
-	pkt_info.bssid_match = ((!IsFrameTypeCtrl(wlanhdr)) &&
+	pkt_info.bssid_match = (!ieee80211_is_ctl(hdr->frame_control) &&
 				!pattrib->icv_err && !pattrib->crc_err &&
 				ether_addr_equal(rx_bssid, my_bssid));
 
@@ -111,7 +112,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 		ether_addr_equal(rx_ra, my_hwaddr);
 
 	pkt_info.is_beacon = pkt_info.bssid_match &&
-		(GetFrameSubType(wlanhdr) == WIFI_BEACON);
+		ieee80211_is_beacon(hdr->frame_control);
 
 	sa = get_ta(wlanhdr);
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 6ba004aa8..eb8b73fba 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -426,6 +426,7 @@ s32 rtl8723bs_mgnt_xmit(
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 	u8 *pframe = (u8 *)(pmgntframe->buf_addr) + TXDESC_OFFSET;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
 	u8 txdesc_size = TXDESC_SIZE;
 
 	rtl8723b_update_txdesc(pmgntframe, pmgntframe->buf_addr);
@@ -441,7 +442,7 @@ s32 rtl8723bs_mgnt_xmit(
 
 	pxmitbuf->priv_data = NULL;
 
-	if (GetFrameSubType(pframe) == WIFI_BEACON) { /* dump beacon directly */
+	if (ieee80211_is_beacon(hdr->frame_control)) { /* dump beacon directly */
 		ret = rtw_write_port(padapter, pdvobjpriv->Queue2Pipe[pxmitbuf->ff_hwaddr], pxmitbuf->len, (u8 *)pxmitbuf);
 		if (ret != _SUCCESS)
 			rtw_sctx_done_err(&pxmitbuf->sctx, RTW_SCTX_DONE_WRITE_PORT_ERR);
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index bfc985870..558e734a2 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -216,11 +216,6 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 	return sa;
 }
 
-static inline int IsFrameTypeCtrl(unsigned char *pframe)
-{
-	return GetFrameType(pframe) == WIFI_CTRL_TYPE;
-}
-
 /*-----------------------------------------------------------------------------
 			Below is for the security related definition
 ------------------------------------------------------------------------------*/
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 9d203810e..150469cda 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1897,10 +1897,11 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 	struct wireless_dev *wdev = padapter->rtw_wdev;
 
 	{
+		struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pmgmt_frame;
 		struct station_info sinfo = {};
 		u8 ie_offset;
 
-		if (GetFrameSubType(pmgmt_frame) == WIFI_ASSOCREQ)
+		if (ieee80211_is_assoc_req(hdr->frame_control))
 			ie_offset = _ASOCREQ_IE_OFFSET_;
 		else /*  WIFI_REASSOCREQ */
 			ie_offset = _REASOCREQ_IE_OFFSET_;
@@ -1908,8 +1909,7 @@ void rtw_cfg80211_indicate_sta_assoc(struct adapter *padapter, u8 *pmgmt_frame,
 		sinfo.filled = 0;
 		sinfo.assoc_req_ies = pmgmt_frame + WLAN_HDR_A3_LEN + ie_offset;
 		sinfo.assoc_req_ies_len = frame_len - WLAN_HDR_A3_LEN - ie_offset;
-		cfg80211_new_sta(wdev, ((struct ieee80211_hdr *)pmgmt_frame)->addr2,
-				 &sinfo, GFP_ATOMIC);
+		cfg80211_new_sta(wdev, hdr->addr2, &sinfo, GFP_ATOMIC);
 	}
 }
 
-- 
2.43.0

