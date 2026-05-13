Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE5C384CCF
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 20:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778704587; cv=none; b=WeldYsgiM6rMuiFxvl/iM8A5rsOYpCpB+Gb/0dieRcu02akifeb6IvfKfy3UKqGG1EWXUrAEIPS4AHTrZ0QxuO2pUxlp3wU3CApaNPS2nfTvYEp/FBXLsukE22r4C5fJMGjzWLwAqbXwqaHFR7DnZd0dnTviDKh+wpXCZkSZMNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778704587; c=relaxed/simple;
	bh=aIV2EFGl8Rw3+pTqWtdl1K7zxN/9Zupq79LHIy59AHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XcwJ2zSCE41p6en7wMzsgFCo/vbSAWooT3BLU9efIv6fXafweXgXfYBoV2KuM/BeHy0J9NR9naS4X7D6LpXn9jqZnI1DjXUNn+/ARdgL/9AwIw6zUVxLd+fZ8idej8+gAONkCx6Buj0YeeED2BJ+zQZ39My8IrOdSq+jd1Yef7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=CCRzeldb; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="CCRzeldb"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 887B984FF0;
	Wed, 13 May 2026 23:36:23 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778704583; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5nwBJM09V8VDtqet+QMNYG2G81ccmqT9GY2u6fEOuaM=;
	b=CCRzeldbL0PXzMHaGcBPDOSR5bD+MG0jkzi6yZ6qnCbS5yktnnK/HC4Ab1dDZoNfw1bpdg
	SGusSgk6zGwW6Kgl+aW32JxrFmDiyrXvcNXJLiqMAPkhU/b2tNL6w5ExQPOAApFco7aBZd
	mMP5WVNXBD/pauIP9+kqBMlo/vTvdM0c6eI22HHGfG1tkCr6XyEspEtr/61rREZDpZhpix
	nFrUQZ8b1JiEthGd5IGarHE4KXJfaFzNsYa/9AqACgCg6d5Y1cE+2PZX4ZndrFn/RpJ/c0
	GKfzl88rm4sjeC4My7VR73UoFpGdXb9Jz+zq7H2pkoIuy8LQpa0iRKDgSFWmG/KrkvH+Su
	U5baGxo4j1wxWmgHleekZjc/EiZ3p9HM1qyzZ1WZGVoCVvKeo0ALZulfeTxdaLLTn4YM6c
	Y/ic45q6mXL++DHlWK6Qkb6RIccPVb+odzHBAql32OPOe98oThtPXAf7kL8tcatqWOVdjj
	DUPdIjCF4kf0McRAgOWUAqKa1qJtcm9yPPwjTJR4xpK9Ak8QC5rgB0MJa+G66q7TjDyLM/
	Yw2mDMGU0JD6fb1GUyP/+Y4uWs3jv5Pq7sAWQvxLUbVextTUOaUQci+A7ZUYvczU9Q9QEl
	F9mZ6hkUPfEv35PtnH/cplziDw7y97x/8IWNjW5ADowGdbm6DbGeo=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/6] staging: rtl8723bs: rtw_mlme: remove dead commented-out code
Date: Wed, 13 May 2026 23:35:02 +0300
Message-ID: <20260513203611.31872-5-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513203611.31872-1-me@cipherat.com>
References: <20260513203611.31872-1-me@cipherat.com>
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
index 9582d9704393..233675f3a045 100644
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

