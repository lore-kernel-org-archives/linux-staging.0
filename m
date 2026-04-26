Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF342E62B4
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 22:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777244300; cv=none; b=J6eRX2tCEwVeMtQwiJAbn7wUWgAkeGKef/xW7bITZ0YkYNFZ73eOMKWF4YA5sjppVq4U6XgrcdG43x5KS7sIC4CozVVzA7TUNVCwMY2j6DU/wUTP/chFtD+Irs62ruqkrfeN/zF6obTkx8LTawBrtBEH3OTQCXcYiBwedg0BFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777244300; c=relaxed/simple;
	bh=5kGed51Sl+6E6P6tfqRS9OLndovASOUsFXbWMmD/h7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=foo11tOpink+n7/HYhdMrkfl8hqFSQesL89r8hFxf//efAnkJRaW1lXDnVbsmL76dKPRSlN0oB7YjLys3fdVJMnyqlXpZwxuQ4CAj8QFhSXJtwYH+hqSNGbntqP6nM0cJIcGX+oZxUKCfDpJvugxKf+nZT76dvLlOJhZPgaCyHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=bgBU4o77; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="bgBU4o77"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D62884F2F;
	Mon, 27 Apr 2026 01:58:17 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777244297; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=efRI0gXi2ucJKuhjMvMqbM/ByHTDuuhhB9yX60u/1kQ=;
	b=bgBU4o77fxaekbl+50QBCn6CWVmKMgbNWGD9Hokv7wWPQya2p6HZzpUzH2ZJBPH1/y7MIg
	KDZgr1dU4CJUMsEVU3JSCAVwBrvPwLbOshoIm4+VXd0pUwzBL4gbq1yXc+Ec/9a42SZCc+
	PJwoJOfispAzE3h+qc65uds1G6WJyLgrdDgLdBQ8fFKPxdhFwHeM1ZUdAECsVIpC/qMQqB
	PKE8tsGMj0f89IyI8zBO8i/U6QYnhJNQ8ONyhGb50h7funLTnILV6X4tg/7lpwodFNE2lv
	tzGQqIHusaheuZB/428EJU6CH/hD2UIcb6al1souOumGJoP+zuxG5o9A322SeyI2Wgn15a
	bV+XyHk8ySKChBQkZ9+j0cZj7pk4I9Q8gtpiF3gq5W+f71MOe50/LG4WsOh6gk7EI5niN6
	RUcGzAh4EJcmfXvnKkI/rYSYU8fNmLdyoEDZZUMYP0ahprdaQzRz5Pf6OLnRw9YyXsQ0Nz
	1H+HlRnVCpg8IbhleZHZ8RtHc1cY/i/NylHdN+58v1kd5GeQDTB/K7OLLQPSg2gQxH+ctb
	GedcMRKZhEr0Yv1eeR8Wr9X9K9lGs8FBBoKOHxXtUl+DSME622wMqkcbSr5H/RJX6B1zj/
	sFk/B/hzPsJNGyRD1g0RzAnQtn9LwtMS0cqlPFjkSkG2fCw68HbaE=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/5] staging: rtl8723bs: rtw_mlme: remove dead commented-out code
Date: Mon, 27 Apr 2026 01:55:00 +0300
Message-ID: <20260426225552.87114-4-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426225552.87114-1-me@cipherat.com>
References: <20260426225552.87114-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Remove commented-out code and its related comments/notes.

Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index cdc631464565..c8971c03704c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -758,9 +758,6 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 					struct wlan_bssid_ex *pdev_network = &regs->dev_network;
 					u8 *pibss = regs->dev_network.mac_address;
 
-					/* pmlmepriv->fw_state ^= _FW_UNDER_SURVEY;
-					 * because don't set assoc_timer
-					 */
 					_clr_fwstate_(pmlmepriv, _FW_UNDER_SURVEY);
 
 					memcpy(&pdev_network->ssid, &pmlmepriv->assoc_ssid,
@@ -1721,12 +1718,8 @@ void rtw_dynamic_check_timer_handler(struct adapter *adapter)
 
 		should_enter_ps = traffic_status_watchdog(adapter, true);
 		if (should_enter_ps) {
-			/* rtw_lps_ctrl_wk_cmd(adapter, LPS_CTRL_ENTER, 1); */
 			rtw_hal_dm_watchdog_in_lps(adapter);
 		} else {
-			/* call rtw_lps_ctrl_wk_cmd(padapter, LPS_CTRL_LEAVE, 1)
-			 * in traffic_status_watchdog()
-			 */
 		}
 
 	} else {
@@ -2265,19 +2258,11 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	/*  1. Supported rates */
 	/*  2. IE */
 
-	/* rtw_set_supported_rate(pdev_network->supported_rates,
-	 * pregistrypriv->wireless_mode);  will be called in rtw_generate_ie
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

