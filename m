Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F27838F255
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 22:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778279263; cv=none; b=dV/1Fy9yiLj3Nnf5Bv5g6ZFh3ZGSSdILVF9EdHnyfh4JGLh+vVKPrdO9kgjRegqHHje7ulVRBhT8m1Jx98aRane+33sdBncPv29WRcAKvAaKoVcxFHqYDDxUsGEgeM306ijc11vLjxv1uVhAs7qhT6fq0yR624H2MKv6Ms04C/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778279263; c=relaxed/simple;
	bh=aIV2EFGl8Rw3+pTqWtdl1K7zxN/9Zupq79LHIy59AHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IhYkKBVNOWLAAn+9zLh7THJ1vjUfy3YbkColaTnGqHLoNQaq1h1ErghwhLboJ7b6AsgQp1FeDctWjhWVsXQyY/binX3Qxd+6V845p5mc1fAO4512bLLOb+Um9zJkDkEw+FKmkZyKk6K8LqjcRm5vgSVM0kfLg54fIoZ2WCmvURA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=Zj6ZQEat; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="Zj6ZQEat"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F8DC84FCC;
	Sat,  9 May 2026 01:27:40 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1778279260; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5nwBJM09V8VDtqet+QMNYG2G81ccmqT9GY2u6fEOuaM=;
	b=Zj6ZQEat302fsZ/ty9Pc+K5W8I2OTHiTlNod6ikxWPf7GjrLsBTa8MUP39u4zsH/8QJmRN
	4HaVdhsgRCCO6W4qfCf+xh4Rj91HpZ4wjlcBa82Tq6USuBpQgAeNjkic2iNw2wykbe3Sju
	2p0DoE2fvUKaKFUIRQSEwr6Pwv2j1SW1WemVJgf6Rl+nJt7zvV++GquTdl58ZYg1uFUcMa
	8SyIJHEwd6HUhSmPGe72+vhIq56SNavs/0lR0xLc1FS29qzjDFU9gmoyAHJ9lReOkR02+j
	4uUzn5QqJcGOP91H/ZONi/6Re0+cnLZJBV2dp5xgLJu5pywQKQzP+QgpiKurfpO4ePhurp
	J6HFWuVZ7WQ7TITyVwrlx3NVUzt/P1qkpwjo5m5ohmwEGUkbyoD5Ju34LWVTqxkS3xGnn/
	en3s/LMyECvG3lxbOsX5a5K5CwQp9qK+CTHV6xPf+tEbQlFNRI08vlfwj+/u6sQOokV2XZ
	5LE95OO2ILonI3JYc5d9oK3gXPYDfIaSuhqujFQReAdD79kV3uLyimI2qI1z95xVifV7yr
	hl+tO+KtfCJeFqRIa5Ip08co+iQqGIzwBfAkgr+a+YEXNNwkfRIwGP8Sitd6XdiwrVmxIC
	Cry7eDaPfNdt2KhUiqNf60utxtiqFkPNqqe4cyccpe77B6LI9pKPY=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	error27@gmail.com,
	luka.gejak@linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 5/7] staging: rtl8723bs: rtw_mlme: remove dead commented-out code
Date: Sat,  9 May 2026 01:27:01 +0300
Message-ID: <20260508222725.24075-6-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508222725.24075-1-me@cipherat.com>
References: <20260508222725.24075-1-me@cipherat.com>
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

