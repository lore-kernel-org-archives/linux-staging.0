Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DE63AC0ED
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 13:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782134257; cv=none; b=UL7bDyvNbMRgxCO3z2OayDElDyWyTVcFIh5/87JoYlyuywZJB5YiBTY6Nt5LcA6Q9+yqxTENV8bheL3mSb69L9CUIOUPs7izo4uxrJoC5p7w8vs54zP/5r5Q9yEf+irNzWJWGPo0mX/ysuyj9Z9vLJigX/jLY9xxrvDU/FyAE2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782134257; c=relaxed/simple;
	bh=BIOqotPRuxZpAtDWHSSeb2i401vozLV4VrC0aiK25RY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s2XqCv6Eb1e3lp8Rvo2GZcBn7eE/DmwhFeC5FSylC6EpN3GeaxSw3iawL/Md0pAyBYUxLgf/353Bm/7NA8qiFEB3+hVFNdJXd399TS5y045sfOWmpoHtCiLOBFrzEA5RpKXgiLGw8quBwB24JXLlgbhUYA1ASaGBCVbQT/B1RhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DlKjpgpR; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DlKjpgpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bA
	njCPFhugjkeghalAhhuSCvLliKLc+MxPmLMoVoQ8I=; b=DlKjpgpRY42INW8GYV
	RSdbntO/a+D+aLvvP3EXLFof90tQsblm4CptqWHv6sMrndlVHXMuEc1JAK9Ie463
	dqowyTFDCA/GzK9wTA+YpqIRk9SoVboHVvvZ1rPKQbIrCXr+3KewnU1doKOH6Fhj
	qdz5NNzobqA9hlheaTsp6iSkM=
Received: from Ubuntu.. (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnxCPcNTlqX_0bDg--.60787S2;
	Mon, 22 Jun 2026 21:17:18 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xiaofeng Yuan <xiaofengmian@163.com>
Subject: [PATCH] staging: rtl8723bs: hal: remove unnecessary braces
Date: Mon, 22 Jun 2026 13:17:19 +0000
Message-ID: <20260622131719.4241-1-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgDnxCPcNTlqX_0bDg--.60787S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw15Zw4kKry3Xry7JFW3trb_yoW8Ww47pr
	WkK34jkr1YqF1qvr4jyrn7CFyfGa95GryDKFyjy3yYgFWDZayrXrZYyF10yrnIvrs3Wwn0
	yrn8X348Ww4DC37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUeCJkUUUUU=
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAR5tcGo5Nd4pRgAA3V

checkpatch reports two warnings about unnecessary braces in hal_intf.c:

 - WARNING: braces {} are not necessary for any arm of this
   statement (rtw_hal_update_ra_mask)
 - WARNING: braces {} are not necessary for single statement
   blocks (rtw_hal_dm_watchdog_in_lps)

Both blocks contain only single statements, so the braces are
redundant. Remove them to align with kernel coding style.

Compile tested with CONFIG_RTL8723BS=m.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 27c0c0198..45634b5e5 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -208,9 +208,8 @@ void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE) == true)
 		add_ratid(padapter, psta, rssi_level);
-	else {
+	else
 		UpdateHalRAMask8723B(padapter, psta->mac_id, rssi_level);
-	}
 }
 
 void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_level)
@@ -254,9 +253,8 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
-	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
+	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode)
 		rtl8723b_HalDmWatchDog_in_LPS(padapter); /* this function caller is in interrupt context */
-	}
 }
 
 void beacon_timing_control(struct adapter *padapter)
-- 
2.43.0

