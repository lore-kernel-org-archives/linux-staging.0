Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFD63ECBDD
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777312748; cv=none; b=WuacK3XF7Yn1u48blfa0W+QS/f/lHlXyjl8CzpPsHLRycHp+835P8re0p6ZRavzWo//4aA5Lpd5EbPR4TBy1fyWmvRgEuqD2dSk866YA8u4VVNqPprJeGvFivVJUAtvupLXtfGMk0kiemvB0wEB7T1NVgWQdJgdkiFourjaTK18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777312748; c=relaxed/simple;
	bh=DZ0hHJGs8U8wLyt8/3P5sC38gRCrJYJKGfOW7oh6qWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V3hsX9QdS+sBxjZEOBxknrk9DGVVtMAeYEdwsNZ5gzOWwKgNXYGNpGAtNe6jW5I4kl7TbCrA2ufcJ/JBSXZxTXhPEW4HpVqUov425vYZG1Ygv++UtSVraqzuXU5WABoFUU+dM68fZ24Ryrm7II1gGzNiWZ5WqHm5btuVuzpjjgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QYbQzrs8; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QYbQzrs8"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4g4BCD1B9yz9vQF;
	Mon, 27 Apr 2026 19:59:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777312744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cbbFF+/ogjtiGwJVQqhc5k6xxyI2w+4udbDLs0P6Xjg=;
	b=QYbQzrs85o3eACV1f5mYV5t5TF1oshYOV8xEQbbu9zZvZqQjAGm1kefbUU0dhlnX+6Gcgq
	tuobbgang35iHNLnnXTNprvu5PS+9WfAZ8N/3H5gRm2m4k2BrUJjlrisX3KaUNNFWDV6OB
	A2W/B0OLbAirGj7mIItkcPB7QeGrilNwnUJVLQNskkiPTcWLUF6EvqIhEbRnWoAz8tp3cG
	XWPnBWzyRMZS9imC+9GWH54U4G8I4oihfntKiwHCNJfB04hUGbPYoKBHOjP+a0lj+itA3H
	KkJI+nYfOcj47fBy4hMnnL4fiwcoW7lN0COkI7Zvn/Fc3xRpuDbjgPHwD70yaQ==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v6 4/8] staging: rtl8723bs: add spaces around bitwise OR operators
Date: Mon, 27 Apr 2026 20:58:42 +0300
Message-ID: <20260427175846.23470-5-khomenkov@mailbox.org>
In-Reply-To: <20260427175846.23470-1-khomenkov@mailbox.org>
References: <20260427175846.23470-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: d0aee263cd58c8595e4
X-MBO-RS-META: 5ftto4saea5bgdb5c5ckd67qx168c66t

Add spaces around bitwise OR operators to improve code readability
and conform to the Linux kernel coding style. This fixes the
SPACING issues identified by checkpatch.pl.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 2 +-
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 69b63098a6a2..f870e6c1f209 100644
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
index aa469fe57ba8..f8ba55e22638 100644
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

