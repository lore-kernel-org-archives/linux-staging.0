Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242A141C2EB
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378734; cv=none; b=qCsoJbBYDdL8T9wDAtp1W3WoCwTCqJtcFeIZ8CRvjakz/qzLTr8MHBLTS5SaMbZjj5TPjly6EruiJ43pnCklghOL1+67iqqqV9dPqEewMrjPoH8FCFCNPLs1B+LH0nhUidCrC1tcQI0uYhEU8RtA894g5TwRYV+/0Ym5vZHJ0ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378734; c=relaxed/simple;
	bh=G6aKC3HcCwP+O2rG+xjqgcAYArlrkty+9SfYpXkkUpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wjjylg+rS10MmfbSiElRqNu2fqmeMtpCMV+3Sa93Hxry8pDSOfDWr7Mt3/Sqq2KJLJZjk1gGWiFh+KBwPNzYuQ7nC9GKm1KdIg08EcxRAgw8g+S3eDL3dFhKLx46O6o2ZQHgXnrQoBmU/FWsEDr6ToqeAD99T14b6vaCllp9r9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=KvI9sVsY; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="KvI9sVsY"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA1ED84F92;
	Tue, 28 Apr 2026 15:18:39 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777378720; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFvDTsN2MhkZtwxwVEdUWnBNobaewOC55DBgan3fkro=;
	b=KvI9sVsYxJ1d2bjiHeRKGTzjYL+nmFTlCYPzWBlD+B3YrponzTmaI4jk7qI3nH3ZFOK7ct
	nvviffQioAAV9VxgUVCHPaCldOJhBK4rq9IlaH3hBpTOD841yVO93knmnC+FusZrdOXa0W
	MGgPmnLzGp4olGuwfq+cVpjsYVrFdsEgi3ePjU3xGlBMvwf0MoDOTj/N8It2svVIikrqur
	IfjI3+83561XmTBNLagJwAMOXI2u1V22B5U/HV7DifVLiH+UrmZcZjlkXb6S/FLepkYo+1
	1Brl/rit5F/+KdHrAekLvaGNMiGaIdt0C8ssJBkGbgzs/Av60jfBD9bJtxECHlWpftJO7L
	Xz+VedFZUI1fBjLdPW1EQjri+5cTYhsTjK0TdTXPYOG4UH4q86z+NAlm/M2fiVhJOCW0Rx
	8VMDKATSkZltL7DQmU6qzOap3s4z+sLLh9QVlZ+hhdpqQjBG8rD2noKo+DNViVJOnWlIYk
	T5RUt5RekbVAViSwLLiV4/f12omrNdbN6irY5hmo0OPDyM40YnHWO6fj2BNQPOeX0NXSGn
	2GQ406V8943P0PRfIb1KcYKr5J9K5kbCQZ/Cv7CVorlvhB3W/4GI9C2LIToMP9d3+4hg63
	lP2KUyOMmrFxG2VZsP6zuRamgwdaGrSiwEQjNZCDlLUzX5VBY+YoE=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/8] staging: rtl8723bs: rtw_mlme: remove dead commented-out code
Date: Tue, 28 Apr 2026 15:15:49 +0300
Message-ID: <20260428121737.435248-7-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428121737.435248-1-me@cipherat.com>
References: <20260428121737.435248-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Remove commented-out code and its associated orphaned comments.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c7609f1a90f6..df3b31a7b2b2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -750,9 +750,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					u8 *pibss = regs->dev_network.mac_address;
 					u8 ret = _SUCCESS;
 
-					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
-					 * because don't set assoc_timer
-					 */
 					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 
 					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
@@ -1707,14 +1704,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 		linked_status_chk(adapter);
 
 		should_enter_ps = traffic_status_watchdog(adapter, true);
-		if (should_enter_ps) {
-			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
+		if (should_enter_ps)
 			rtw_hal_dm_watchdog_in_lps(adapter);
-		} else {
-			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1)
-			 * in traffic_status_watchdog()
-			 */
-		}
 
 	} else {
 		rtw_dynamic_chk_wk_cmd(adapter);
@@ -2249,19 +2240,11 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	/*  1. Supported rates */
 	/*  2. IE */
 
-	/* rtw_set_supported_rate(pdev_network->supported_rates, pregistrypriv->wireless_mode);
-	 * will be called in rtw_generate_ie
-	 */
 	sz = rtw_generate_ie(pregistrypriv);
 
 	pdev_network->ie_length = sz;
 
 	pdev_network->length = get_wlan_bssid_ex_sz((struct wlan_bssid_ex  *)pdev_network);
-
-	/* notes: translate ie_length & length after assign the
-	 * length to cmdsz in createbss_cmd();
-	 */
-	/* pdev_network->ie_length = cpu_to_le32(sz); */
 }
 
 /* the function is at passive_level */
-- 
2.54.0

