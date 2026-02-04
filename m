Received: from cvsmtppost36.nm.naver.com (cvsmtppost36.nm.naver.com [114.111.35.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78D261B96
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 07:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770188738; cv=none; b=E5g6HAMjpsy/EWwm/XBLxnUoemrrtkJtPA3VNAf7+KnqRfkldwivbcbhWaR8qzqg9eokUoGmz3rChVq/ld2Kdx7CoXbZCDbZ7pkhLRCCJDMLEAJMPTKVTcDbOnqZJhcLWokLRnA8XbTKTXejZLX5pyI7Aufh0rZVIP5mL7nTvxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770188738; c=relaxed/simple;
	bh=7NBnlMM9B5JibxBl+iyEq+Gbv85ndsOYNMzc1yHaOqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cd1XCICc1Zff4RhkggWHBizrWiB7Eq6I2k4i46VYI5F6fsyoCk0K6GKdpg1LJ8bgi44bPR3fnGUsjE215Odt/uDX8BLMlP/ti1v+x2q8H+wfGzsEpoifeuaPiOGDWh9/KHDOhtdS2vP6mU9W3FqS7bh6fs5DsUoyX1p3LlmPaq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=ZB6dRFjr; arc=none smtp.client-ip=114.111.35.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="ZB6dRFjr"
Received: from cvsendbo027.nm ([10.112.22.36])
  by cvsmtppost36.nm.naver.com with ESMTP id UBLF7yKoR1mRtQ2ZtKEd9g
  for <linux-staging@lists.linux.dev>;
  Wed, 04 Feb 2026 06:45:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1770187521; bh=7NBnlMM9B5JibxBl+iyEq+Gbv85ndsOYNMzc1yHaOqk=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=ZB6dRFjrwphRCDqOBPEhW5yNQV+RmccQxCdfA8UezsUeQftTAv5tweYO3/xbOdsD7
	 BJiUWybJLQVvYpR14mACFAE/oYsKw3nqoWoB2pHYmpPnjr6XkiUKIgXuhj6Idofur8
	 HGcdVRinZSTqfPknAQ373fHy9WPcnsSNBNecWXDvLPdwSZXhUR+Pf6Nkw0pyygAlet
	 e5F7CudF0A1fIK1n9vQB/K6kbHjV1FFe5rbAhvCQm5USXd7VjKDO1RaI6AC5D/B0dZ
	 gHeqOc9Q7n4AR0VtM3sUGYvlTu6npIjlm7L6TJnbOGILJC9YGe2KhDzOLfadt7mNYp
	 kqH8lNOZTR5lA==
X-Session-ID: GKVr8FgyRTCwcPQDifKdtA
X-Works-Send-Opt: M/YXjAJYjHmwKo2qKqJYFquqFNwkx0eFjAJYKg==
X-Works-Smtp-Source: 9wb9KxgXFqJZ+HmwKou9+6E=
Received: from JMW-Ubuntu.. ([14.38.141.199])
  by cvnsmtp001.nm.naver.com with ESMTP id GKVr8FgyRTCwcPQDifKdtA
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Wed, 04 Feb 2026 06:45:21 -0000
From: Minu Jin <s9430939@naver.com>
To: gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	dan.carpenter@linaro.org,
	trohan2000@gmail.com,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minu Jin <s9430939@naver.com>
Subject: [PATCH v5 2/5] staging: rtl8723bs: replace rtw_malloc() with kmalloc()
Date: Wed,  4 Feb 2026 15:44:51 +0900
Message-ID: <20260204064455.1379342-3-s9430939@naver.com>
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

Replace the wrapper function rtw_malloc() with standard kmalloc().
Call sites were reviewed to use appropriate GFP flags (GFP_KERNEL or
GFP_ATOMIC) based on the execution context.

Also, convert error return codes from -1 to -ENOMEM where appropriate.

Signed-off-by: Minu Jin <s9430939@naver.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  4 ++--
 drivers/staging/rtl8723bs/hal/sdio_ops.c      | 24 +++++++++----------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 27da987d881f..edec2295b52d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1695,7 +1695,7 @@ static void c2h_wk_callback(struct work_struct *work)
 			/* This C2H event is read, clear it */
 			c2h_evt_clear(adapter);
 		} else {
-			c2h_evt = rtw_malloc(16);
+			c2h_evt = kmalloc(16, GFP_ATOMIC);
 			if (c2h_evt) {
 				/* This C2H event is not read, read & clear now */
 				if (c2h_evt_read_88xx(adapter, c2h_evt) != _SUCCESS) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index fb16febec151..9c385813b70f 100644
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
index 454f2fabc116..707e5879d943 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -181,7 +181,7 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
 	} else {
 		u8 *tmpbuf;
 
-		tmpbuf = rtw_malloc(8);
+		tmpbuf = kmalloc(8, GFP_ATOMIC);
 		if (!tmpbuf)
 			return SDIO_ERR_VAL32;
 
@@ -228,9 +228,9 @@ static s32 sdio_readN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = rtw_malloc(n);
+		tmpbuf = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
-			return -1;
+			return -ENOMEM;
 
 		err = sd_read(intfhdl, ftaddr, n, tmpbuf);
 		if (!err)
@@ -331,9 +331,9 @@ static s32 sdio_writeN(struct intf_hdl *intfhdl, u32 addr, u32 cnt, u8 *buf)
 
 		ftaddr &= ~(u16)0x3;
 		n = cnt + shift;
-		tmpbuf = rtw_malloc(n);
+		tmpbuf = kmalloc(n, GFP_ATOMIC);
 		if (!tmpbuf)
-			return -1;
+			return -ENOMEM;
 		err = sd_read(intfhdl, ftaddr, 4, tmpbuf);
 		if (err) {
 			kfree(tmpbuf);
@@ -503,9 +503,9 @@ static s32 _sdio_local_read(
 		return _sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = rtw_malloc(n);
+	tmpbuf = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
-		return -1;
+		return -ENOMEM;
 
 	err = _sd_read(intfhdl, addr, n, tmpbuf);
 	if (!err)
@@ -544,9 +544,9 @@ s32 sdio_local_read(
 		return sd_cmd52_read(intfhdl, addr, cnt, buf);
 
 	n = round_up(cnt, 4);
-	tmpbuf = rtw_malloc(n);
+	tmpbuf = kmalloc(n, GFP_ATOMIC);
 	if (!tmpbuf)
-		return -1;
+		return -ENOMEM;
 
 	err = sd_read(intfhdl, addr, n, tmpbuf);
 	if (!err)
@@ -583,9 +583,9 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = rtw_malloc(cnt);
+	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
 	if (!tmpbuf)
-		return -1;
+		return -ENOMEM;
 
 	memcpy(tmpbuf, buf, cnt);
 
@@ -883,7 +883,7 @@ void sd_int_dpc(struct adapter *adapter)
 		u8 *status;
 		u32 addr;
 
-		status = rtw_malloc(4);
+		status = kmalloc(4, GFP_ATOMIC);
 		if (status) {
 			addr = REG_TXDMA_STATUS;
 			hal_sdio_get_cmd_addr_8723b(adapter, WLAN_IOREG_DEVICE_ID, addr, &addr);
-- 
2.43.0

