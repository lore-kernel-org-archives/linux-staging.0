Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3310B31F99E
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 19:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781896243; cv=none; b=BV9KZTKnLP1y6UZIQPdQjFWHf7C41Sm2/c+kl1ji46fMrVkp4b8Wj62Q4EPX04cTx/cgDAY/FdMOoUIL6lmOiIXO3jHeqoYOluJioU6CswzBO609fE+IYYp0L10zZjIqgalaKep8S7J85qnJDfGyfzYgqVRP/QgxDdpBTuAVzgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781896243; c=relaxed/simple;
	bh=rT0ggn8m79w1eWlgwJ/1T1+coUXaub7kyxK2zJ3MK1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CQ2P0/QiKASHBkWhc4TKr2RC9mseHwU13V1SSVmmAwyaLPZHtCAce8jdiXyJT2LDDGtMspf3lS0M9KnTKKaYs2t8nbV5a3wKeEbiuLbEybU7eyrpUSfbb3Bu7m0GPyzbftv38U6zI+wry6wRquH+Bav6o2tx3wd0qwDrOpvw20o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=n33Vxt+L; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="n33Vxt+L"
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4ghnHP4wnKzDsVd;
	Fri, 19 Jun 2026 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1781896241; bh=wOdBU+YmIYMDHasG0KNpyhf7X67DIx8P4D/25t4mIDU=;
	h=From:To:Cc:Subject:Date:From;
	b=n33Vxt+LUh6Os1ovFbpGrSVky6SQXhp2Aa5dsrKOVUF8USFH1ieXk9bJuVppe0KJb
	 xoOASzuyUdxWoBh4lG+JGF2J85wA7F0F/JxLs/qKadVW0lAFXek+Tf2zbJY2c6v/NI
	 roYdHkmWmA3fMMu8rDy0VywabuB3CiBdEhzrsAVk=
X-Riseup-User-ID: 3CC90C8FCF5178F51D57A0E171BA39BD226FD0C9F220EE9E3137C36D79379BDB
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4ghnHP07Ylz1ylX;
	Fri, 19 Jun 2026 19:10:40 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in hal_intf.c
Date: Fri, 19 Jun 2026 20:10:21 +0100
Message-ID: <20260619191021.2205395-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Single statement blocks do not need braces
if and else blocks should have consistent bracing

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 9a3ebad35efc..f990df92b96e 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -170,9 +170,8 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 		add_ratid(padapter, psta, rssi_level);
-	else {
+	else
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
-	}
 }
 
 void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level)
@@ -216,9 +215,8 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
-	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
+	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode)
 		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
-	}
 }
 
 void beacon_timing_control(struct adapter *padapter)
-- 
2.54.0

