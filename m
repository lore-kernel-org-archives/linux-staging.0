Received: from cvsmtppost34.nm.naver.com (cvsmtppost34.nm.naver.com [114.111.35.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6951736AB5A
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 19:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769888425; cv=none; b=XMUbHC3DmYnioWV+eyYM4Pt5NNMxPoNDl3b7D5V3fLwHfKjqGBVuUuQ9JOlJlRLuCeLzB7PSINJQVbja4OHIHMsJgG6OGXT9QebyW5LcEopH9MX9mhMN6D6sVuUiTRqd6LIqT/iguGaQaxiiUlGm8/rLZ+xO2tqQsrbE/3ODFdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769888425; c=relaxed/simple;
	bh=LEXeYcwQ6R6n0PDgeqbYfUcDECMlGQhF5l0t5sapTmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nsgh59aSO3j247NHfS3WtErxVla1qml50iFC+y7v+q/PB7tB1FcmIbsDOhSuVLxjKXq+zblFtRAadF/RNqx8aQbtx4BXCjpnYWMJi9k+WJuqp3GuL3SHbwVz89V54qHlLn1Jw9IEiN+cEmex5shXRM9aC6VTHt40ut9qmkNL/v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=EbZ51MV0; arc=none smtp.client-ip=114.111.35.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="EbZ51MV0"
Received: from cvsendbo022.nm ([10.112.20.47])
  by cvsmtppost34.nm.naver.com with ESMTP id fY86CGtJTuOMy5nRPn4Pvw
  for <linux-staging@lists.linux.dev>;
  Sat, 31 Jan 2026 19:30:09 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1769887809; bh=LEXeYcwQ6R6n0PDgeqbYfUcDECMlGQhF5l0t5sapTmQ=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=EbZ51MV0lJs25f107+eoYiJ9k8hbokEqktwcpR46QYFEH1PnngyQCTAy7nmcNkmSG
	 AM2Dt6BZqwIkaZ90pPodSI1BHTEJvNQ3HZWrdPpjxzbTvlGls14N0vx3tybIUB6l51
	 PnzJDQ6RR3fza9HulIjx0b0vw9wEaD0sOvq+AdDRy5Eeau12rd6cwk64plHb8XnF24
	 xZFnKgjlkQNqGwfVGoKw0IPce35xCr3Zu1pyMW8h45A+m7U6r5UDAahWTqGo4Sb4z4
	 gd3iOEflohQ/KaO9X6Ar3ovE00u8TsyJ/yCZHIBho5uMo2rpyXfSIu11qY8t3YZR2T
	 gKLI/h6e0Jl+Q==
X-Session-ID: nwPvzEAjSDmjJARsqQe+Tg
X-Works-Send-Opt: p/Y/jAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: uqb9aAvrFqJZ+Hm/KAt9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp011.nm.naver.com with ESMTP id nwPvzEAjSDmjJARsqQe+Tg
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 31 Jan 2026 19:30:08 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	andy@kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 1/4] staging: rtl8723bs: replace rtw_malloc() with kmalloc()
Date: Sun,  1 Feb 2026 04:29:58 +0900
Message-ID: <20260131193001.303307-2-s9430939@naver.com>
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

Remove wrapper function _rtw_malloc() and macro rtw_malloc().
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

Replace kmalloc()/memcpy() with kmemdup() where possible.
Replace sizeof(struct val) with sizeof(*ptr).
Remove blank line after kmalloc().

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c           | 12 ++++--------
 drivers/staging/rtl8723bs/core/rtw_cmd.c          |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c          | 14 +++++++-------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  7 +++----
 drivers/staging/rtl8723bs/os_dep/osdep_service.c  |  8 +++-----
 7 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3ff5daf1e5aa..bfe520a7c549 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -114,10 +114,8 @@ static void update_BCNTIM(struct adapter *padapter)
 		dst_ie = pie + offset;
 	}
 
-	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
-		if (pbackup_remainder_ie && premainder_ie)
-			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
+	if (remainder_ielen > 0 && premainder_ie) {
+		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
 	}
 
 	*dst_ie++ = WLAN_EID_TIM;
@@ -1440,10 +1438,8 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 
 	remainder_ielen = ielen - wps_offset - wps_ielen;
 
-	if (remainder_ielen > 0) {
-		pbackup_remainder_ie = rtw_malloc(remainder_ielen);
-		if (pbackup_remainder_ie)
-			memcpy(pbackup_remainder_ie, premainder_ie, remainder_ielen);
+	if (remainder_ielen > 0 && premainder_ie) {
+		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
 	}
 
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
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
index fa1e3ad59254..04542219752c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -589,7 +589,7 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 	if (!memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN)) {
 		if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
 			/* we should update current network before auth, or some IE is wrong */
-			pbss = rtw_malloc(sizeof(struct wlan_bssid_ex));
+			pbss = kmalloc(sizeof(*pbss), GFP_ATOMIC);
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
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 476ab055e53e..b4bc6c345fbe 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -841,7 +841,7 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	param_len = sizeof(struct ieee_param) + params->key_len;
-	param = rtw_malloc(param_len);
+	param = kmalloc(param_len, GFP_KERNEL);
 	if (!param)
 		return -1;
 
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
@@ -1715,7 +1714,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 			wep_key_len = wep_key_len <= 5 ? 5 : 13;
 			wep_total_len = wep_key_len +
 				offsetof(struct ndis_802_11_wep, key_material);
-			pwep = rtw_malloc(wep_total_len);
+			pwep = kmalloc(wep_total_len, GFP_KERNEL);
 			if (!pwep) {
 				ret = -ENOMEM;
 				goto exit;
diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 01ca423faf87..770d7c1b41b0 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -21,8 +21,7 @@ void *_rtw_malloc(u32 sz)
 
 void *_rtw_zmalloc(u32 sz)
 {
-	void *pbuf = _rtw_malloc(sz);
-
+	void *pbuf = kmalloc(sz, in_interrupt() ? GFP_ATOMIC : GFP_KERNEL);
 	if (pbuf)
 		memset(pbuf, 0, sz);
 
@@ -129,7 +128,7 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		goto keep_ori;
 
 	/* duplicate src */
-	dup = rtw_malloc(src_len);
+	dup = kmalloc(src_len, GFP_ATOMIC);
 	if (dup) {
 		dup_len = src_len;
 		memcpy(dup, src, dup_len);
@@ -220,8 +219,7 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
 {
 	struct rtw_cbuf *cbuf;
 
-	cbuf = rtw_malloc(struct_size(cbuf, bufs, size));
-
+	cbuf = kmalloc(struct_size(cbuf, bufs, size), GFP_ATOMIC);
 	if (cbuf) {
 		cbuf->write = 0;
 		cbuf->read = 0;
-- 
2.43.0

