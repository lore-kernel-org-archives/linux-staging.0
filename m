Received: from cvsmtppost21.nm.naver.com (cvsmtppost21.nm.naver.com [114.111.35.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474F22641FC
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 14:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609415; cv=none; b=jrYSpaaOkYZ3xPbsIa7bhb8T1id2HdStmWyuUUVfGR6ItEhdw6r2SDieUFg3ro9H1BmzpVJo3E4IdfG3TJyKXVau9SuJxkIsbLd3SZjJZVDKjs+hZscRY0T3idW1vOTwC8N99CkZ5UNXHjVe4KUSh7Rc3DuZvx4IfvfoeFDipoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609415; c=relaxed/simple;
	bh=RiYaY/Ik60M0u/kli8XKSH4I/cht/77hTOTHqVJ24e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d6hGfkbZAyBxbMzAVD7VAzrNfO0F6Yqyw7KmN94BagIwqWv/B7kIukgrbTBYzE6znny9b9jjs2j5vjifHjrYqe/mPnr9QzRRAjUWIgbUybNLLQssajxsPQOpBAaCe4DQS3tHeAKFll6k+fNHJRxti/+L1F8Cbswn9PUfF1y9DW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=sMonLxyS; arc=none smtp.client-ip=114.111.35.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="sMonLxyS"
Received: from mvsendbo32.nm ([10.179.40.214])
  by cvsmtppost21.nm.naver.com with ESMTP id RzD3wzEiQwKLKorNyQiqRA
  for <linux-staging@lists.linux.dev>;
  Wed, 28 Jan 2026 14:10:03 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769609403; bh=RiYaY/Ik60M0u/kli8XKSH4I/cht/77hTOTHqVJ24e0=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=sMonLxySQXpbunlj14eSg/3IQaoOzdAV8VgWCv/Gi/7Gt2xKp+ay3iheLpYbsuYQu
	 BiBL5Lmlp46WLmpLNM8EMp/S1FT3LmKoO11BKPHCQBMqwsuy6+S+yWYsMVrLYSKbGc
	 6lA99g4jLkug/1+xj+IYvVtxnQH7qaEA6CMFruIAlZvdBjW3dO6lypkT0O7aUnkZV/
	 A/ZTHce3HcyBw9NE7VkoFFDGY/jA6RWQ41D5Y3FwLd3aA4nrJc3Iu03ct+XkQ/CUNG
	 kA6DwuRWSezbOnZ6Q5ZQmJQ0/BstqXHXFrOyR0ELs+Actun0FPIzElc6DxATGckMBr
	 BAfB0am9fgTbw==
X-Session-ID: BKV7Y9CoRFiaMIbuk9hWyA
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: AwbXFxvrFqJZ+HmZKAgX+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp004.nm.naver.com with ESMTP id BKV7Y9CoRFiaMIbuk9hWyA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 28 Jan 2026 14:10:02 -0000
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
Subject: [PATCH v3 1/4] staging: rtl8723bs: replace _rtw_malloc with kmalloc
Date: Wed, 28 Jan 2026 23:09:51 +0900
Message-ID: <20260128140954.1065382-2-s9430939@naver.com>
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

Remove wrapper function _rtw_malloc and macro rtw_malloc.
Replace all rtw_malloc with kmalloc.

All call sites are reviewed to select GFP_KERNEL or GFP_ATOMIC.

1. GFP_KERNEL:
   Used in paths that are executed in process context and are allowed to sleep.

   - Driver initialization and probe paths.
   - Workqueue callbacks and cfg80211 configuration callbacks.

2. GFP_ATOMIC:
    Used in paths that must not sleep because they operate in atomic contexts.

   - Interrupt handlers and SoftIRQ contexts.
   - Functions called while holding spinlocks.
   - Low-level I/O operations (SDIO) (eg, sdio_read32())

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           |  4 ++--
 drivers/staging/rtl8723bs/core/rtw_cmd.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c          | 14 +++++++-------
 drivers/staging/rtl8723bs/include/osdep_service.h |  2 --
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  6 +++---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c  | 11 +++--------
 8 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3ff5daf1e5aa..7e87ac13d1d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -115,7 +115,7 @@ static void update_BCNTIM(struct adapter *padapter)
 	}
 
 	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
+		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_ATOMIC);
 		if (pbackup_remainder_ie && premainder_ie)
 			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
 	}
@@ -1441,7 +1441,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	remainder_ielen = ielen - wps_offset - wps_ielen;
 
 	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
+		pbackup_remainder_ie = kmalloc(remainder_ielen, GFP_ATOMIC);
 		if (pbackup_remainder_ie)
 			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index f80476946622..0cafa5326129 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1695,7 +1695,7 @@ static void c2h_wk_callback(struct work_struct *work)
 			/* This C2H event is read, clear it */
 			c2h_evt_clear(adapter);
 		} else {
-			c2h_evt = rtw_malloc(16);
+			c2h_evt = kmalloc(16, GFP_KERNEL);
 			if (c2h_evt) {
 				/* This C2H event is not read, read & clear now */
 				if (c2h_evt_read_88xx(adapter, c2h_evt) != _SUCCESS) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index fa1e3ad59254..18b43746e116 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -589,7 +589,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	if (!memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN)) {
 		if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
 			/* we should update current network before auth, or some IE is wrong */
-			pbss = rtw_malloc(sizeof(struct wlan_bssid_ex));
+			pbss = kmalloc(sizeof(struct wlan_bssid_ex), GFP_ATOMIC);
 			if (pbss) {
 				if (collect_bss_info(padapter, precv_frame, pbss) == _SUCCESS) {
 					update_network(&(pmlmepriv->cur_network.network), pbss, padapter, true);
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 054e2c2eab02..144094eeec30 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -642,7 +642,7 @@ static void hal_ReadEFuse_WiFi(
 	if ((_offset + _size_byte) > EFUSE_MAX_MAP_LEN)
 		return;
 
-	efuseTbl = rtw_malloc(EFUSE_MAX_MAP_LEN);
+	efuseTbl = kmalloc(EFUSE_MAX_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
@@ -730,7 +730,7 @@ static void hal_ReadEFuse_BT(
 	if ((_offset + _size_byte) > EFUSE_BT_MAP_LEN)
 		return;
 
-	efuseTbl = rtw_malloc(EFUSE_BT_MAP_LEN);
+	efuseTbl = kmalloc(EFUSE_BT_MAP_LEN, GFP_ATOMIC);
 	if (!efuseTbl)
 		return;
 
diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 454f2fabc116..7d211464cb2f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -181,7 +181,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	} else {
 		u8 *tmpbuf;
 
-		tmpbuf = rtw_malloc(8);
+		tmpbuf = kmalloc(8, GFP_ATOMIC);
 		if (!tmpbuf)
 			return SDIO_ERR_VAL32;
 
@@ -228,7 +228,7 @@ static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = rtw_malloc(n);
+		tmpbuf = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -1;
 
@@ -331,7 +331,7 @@ static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = rtw_malloc(n);
+		tmpbuf = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
 			return -1;
 		err = sd_read(intfhdl, ftaddr, 4, tmpbuf);
@@ -503,7 +503,7 @@ static s32 _sdio_local_read(
 		return _sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = rtw_malloc(n);
+	tmpbuf = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -1;
 
@@ -544,7 +544,7 @@ s32 sdio_local_read(
 		return sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = rtw_malloc(n);
+	tmpbuf = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -1;
 
@@ -583,7 +583,7 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = rtw_malloc(cnt);
+	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -1;
 
@@ -883,7 +883,7 @@ void sd_int_dpc(struct adapter *adapter)
 		u8 *status;
 		u32 addr;
 
-		status = rtw_malloc(4);
+		status = kmalloc(4, GFP_ATOMIC);
 		if (status) {
 			addr = REG_TXDMA_STATUS;
 			hal_sdio_get_cmd_addr_8723b(adapter, WLAN_IOREG_DEVICE_ID, addr, &addr);
diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 6458ff95ff9d..23bfc0789741 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -55,14 +55,12 @@
 extern int RTW_STATUS_CODE(int error_code);
 
 void *_rtw_zmalloc(u32 sz);
-void *_rtw_malloc(u32 sz);
 void _kfree(u8 *pbuf, u32 sz);
 
 struct sk_buff *_rtw_skb_alloc(u32 sz);
 struct sk_buff *_rtw_skb_copy(const struct sk_buff *skb);
 int _rtw_netif_rx(struct net_device *ndev, struct sk_buff *skb);
 
-#define rtw_malloc(sz)			_rtw_malloc((sz))
 #define rtw_zmalloc(sz)			_rtw_zmalloc((sz))
 
 #define rtw_skb_alloc(size) _rtw_skb_alloc((size))
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 476ab055e53e..dd32ceefd7e7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -841,7 +841,7 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	param_len = sizeof(struct ieee_param) + params->key_len;
-	param = rtw_malloc(param_len);
+	param = kmalloc(param_len, GFP_KERNEL);
 	if (!param)
 		return -1;
 
@@ -1163,7 +1163,7 @@ static int rtw_cfg80211_set_probe_req_wpsp2pie(struct adapter *padapter, char *b
 				pmlmepriv->wps_probe_req_ie = NULL;
 			}
 
-			pmlmepriv->wps_probe_req_ie = rtw_malloc(wps_ielen);
+			pmlmepriv->wps_probe_req_ie = kmalloc(wps_ielen, GFP_KERNEL);
 			if (!pmlmepriv->wps_probe_req_ie)
 				return -EINVAL;
 
@@ -1715,7 +1715,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 			wep_total_len = wep_key_len +
 				offsetof(struct ndis_802_11_wep, key_material);
-			pwep = rtw_malloc(wep_total_len);
+			pwep = kmalloc(wep_total_len, GFP_KERNEL);
 			if (!pwep) {
 				ret = -ENOMEM;
 				goto exit;
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 01ca423faf87..842199b23746 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -14,14 +14,9 @@ inline int RTW_STATUS_CODE(int error_code)
 	return _FAIL;
 }
 
-void *_rtw_malloc(u32 sz)
-{
-	return kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
-}
-
 void *_rtw_zmalloc(u32 sz)
 {
-	void *pbuf = _rtw_malloc(sz);
+	void *pbuf = kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
 
 	if (pbuf)
 		memset(pbuf, 0, sz);
@@ -129,7 +124,7 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		goto keep_ori;
 
 	/* duplicate src */
-	dup = rtw_malloc(src_len);
+	dup = kmalloc(src_len, GFP_ATOMIC);
 	if (dup) {
 		dup_len = src_len;
 		memcpy(dup, src, dup_len);
@@ -220,7 +215,7 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 {
 	struct rtw_cbuf *cbuf;
 
-	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
+	cbuf = kmalloc(struct_size(cbuf, bufs, size), GFP_ATOMIC);
 
 	if (cbuf) {
 		cbuf->write = 0;
-- 
2.43.0

