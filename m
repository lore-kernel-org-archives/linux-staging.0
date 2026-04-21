Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2734DCEB
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 22:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776808892; cv=none; b=V7+howESn8UDBbGaanK17UoIRhQ7kU3nIXNW4HVrVaAY8ME3GoaLsQ7Ao0xlMx4z0MIIbLClMwt/x//0h5OLkCDClmDJEtWI2OHwM2r2GFeloPjcob177uFmyUqO+oFUjqhVNVTz0hsOK6TS4qmg1GQaas5VzhvX0Z0bkj0EyRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776808892; c=relaxed/simple;
	bh=w1zfiseppmtGPC3zHDp9mxALhUvu6I9ZtO7mlyGF6Vo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gJ+Gr/UlYdTeTG6/aRAiMZL/EulNLmYhnwBMM+UMwv6l63FP1qmp0Pf7xzaVwWKP+ZFPX/iA5EoFJ6LQRnbZY0goRYQl3neLGgWT4fFLfdsKUBvW8/ch9wGX2mLk2aZjHBz3ZswT5fi8Y/XXC8dGjJOtojB0ttdKaZ6IKoRM/30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WUIH2rna; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WUIH2rna"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g0bsg4TDFz9tgV;
	Wed, 22 Apr 2026 00:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776808887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qqo5y0WtF2rT98rdl/2oZ4NQ5pBWf6zZaqhydWeoxAk=;
	b=WUIH2rnauYU0W/WxFj7wNITDL6rUaT+JJpSRcr657W4cBcvJatyCBv+U2jv21encDXf4Wk
	yRb1aMhyEqCncrE2WEpVKz7a3PZukgD9UVm/sgrcRWxLPr/vogqVAX6GF9aL5Aqn4EBMRn
	nlk3aRvQK8tm5+Jq5xpr4wEtBNUJ/2ahWnly2F72SG/jU/9WFswVu1NmzICGyIHo18WTLJ
	D+qViRuQyvlfdCTQJKs3fhI9gjrkEwAmVN81wyqMWJXiyGNjvcLONTm6nQ74sAu8U23M97
	4WfUrGrWlxT7X9krjKU4VwDERDAnd/GJHprM5wBE4Du7QMUauZlX7ZeVNiujEg==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 2/3] staging: rtl8723bs: add spaces around bitwise OR operators
Date: Wed, 22 Apr 2026 01:00:57 +0300
Message-ID: <20260421220058.29317-3-khomenkov@mailbox.org>
In-Reply-To: <20260421220058.29317-1-khomenkov@mailbox.org>
References: <20260421220058.29317-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gacqyhhfni1hxwrt8rwpetpzzjug8ssc
X-MBO-RS-ID: ad5a2b872c4d6772ea9

Add preferred spaces around the '|' operator to improve code
readability and conform to the Linux kernel coding style. This
also fixes checkpatch.pl "SPACING" checks.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c    | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 59689a9ebdb0..5e1269ee14cb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -151,7 +151,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE)) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
 			if (!check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 4821abfae98e..0e068ad91252 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -513,7 +513,7 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 		return _SUCCESS;
 
 	if (!check_fwstate(pmlmepriv, _FW_LINKED) &&
-		!check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
+		!check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		return _SUCCESS;
 	}
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 7755fed4be58..b9d2dabc9d9b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -998,7 +998,7 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE)) {
+	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE)) {
 		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
 		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
 	}
-- 
2.53.0

