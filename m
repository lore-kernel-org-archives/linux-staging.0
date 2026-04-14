Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E00337266D
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 21:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202893; cv=none; b=Dh2/6XFbGnUZzZ8zy28mbBoeM2EOI6+b8MGQrp0GNT5NJZCAPXzNnOIUiJX3sYqk/+Uc2d7PVcrliqlRNy5pY4uzAFMPqReldr0ElJx6OTjqWg/MNWusOV1ihdSUNCsAuZKl6jgkfkor8w72AmyC7SJsVT5L3T7OzeXAbydcdOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202893; c=relaxed/simple;
	bh=PQj68ATGmmTdxtmG9+aHnMnIKYy/fIeSYUSwhMMyx/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HqDu7V201fPIsA1HRlRXf67peMddfWEx3Qk+ta6rakhWAtIqPwR5rn+vknNHiOb9WySke6QGJTTHR2MtBrGkPtOeJF2LUJLSY5j/s1a2Jr4KgGqvZ4Sovajq4pw0g9lO0kgeu5rlmlFFNV/4YONIRxRqdvOpvCKYzZu2zJCQlrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aw+3Womq; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aw+3Womq"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b982b0889d8so872100366b.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776202889; x=1776807689; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0YMw9Ei5H0E6MeFSvivUi1ZBwVNAjcMlXG9C4x//F7M=;
        b=aw+3Womq5bt07DqeT4l1u7ru/9DojFxLeNrPez4UpEj2hK/HJ9UUwYt2QjXK28WPVN
         lnlDbTwdmf1IWL5cbYUbFjjq7Htnvangcojmht3O+6oUE8rr5G8kDwGI57ALYV05f4O4
         JsPQ7aeM/OJL3Gm11XkeFUqXyKH+ByqwrbxmBIRhgfEJ1pyxcq/WYBf8n0GznnOoXHNd
         bmp7X2Qvpi5t4llCjwopufx+AYlUJTEQcARAVj4csYPHrcz8MWSNDroRIuc+kLHGZ/68
         FzzoBNy0f2JGtNm8inGawJ/hmPcvXE6Vwo33SYacS1Dbcq1ZWshPsVClPgmlZQn80NSG
         Ktgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202889; x=1776807689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0YMw9Ei5H0E6MeFSvivUi1ZBwVNAjcMlXG9C4x//F7M=;
        b=JjFdECmaySxmtWht5JpkHLhaz8UBLO6oG4JsrjA6XmkcH3F1fZL2hwPMoIp0JVdjZR
         i6H5zm/+ZjazNSAqPrUMFVr5CNfuGYwRA48QrK05vmMwgNgQ1jWtdNXwRm9vKVJLZ/Wr
         DeiyhQAeLzVwoT0UdlKTWkCfycKbQUOeGarcMASnoMLRqqVp1qsyZQlaTTvPdauEiaQx
         lM7M09t/t80l+5p08hO9pgIrmUjkj8VmW3f5rfkeSMQrCsDUe5yIyywQqP7fRjIM18cc
         ELnOEft8lbrdUTaRPzKVnQTTT/GWF6WGgwYnxEU7xeGlE13guRXOVJOtoGhro8YHD9XF
         m9dQ==
X-Gm-Message-State: AOJu0YyFHiJoYL+K2gkBecR5pCMnluvp9QybTY9Fsq7Fz8wzQ99+X2dn
	H1ro6RoHwzKdjHWZRVCMiKK+8CdOV5QFuR8o/ZJy9HyDYcizbcWzfzg4
X-Gm-Gg: AeBDieu/wbZjdmHGkEN3PRMIiwr1vFdUgNgk88IXY+FDk/STs9UGgODN0znTT5NWwEM
	KtzMKaf0Qje+reRnZQDRuVKZzrvvPSWA4rvTOIPE5qiyJYkRGqyh2fQiytkPcX+4z2o1gGpiZTy
	HT+6Xrxa6ee3gGSJ0JL9eZpvCK8QNfqz/2eQ1QTVXEL7m39QI0Bg+/aJdjoo+PfN0xsLFX2VEQ/
	wK/ulmAJK/4oDxhg4Tw+Nbfc5IHOcKQQiJkDD6MO7B9hNxE9DQRIXFtxSs6nKsb6qhqLASOXXN9
	DYl7ogWufxSoJCAKlXttcUzdz76dCX5kjJx/BelcfrfY01La+8BIOff/SxxdxOARWuBjfipeEb2
	enP7YsBwqhAKgLHaSexBDNPBOiQeDpa5Hj+uhjOtbCUBLvL8W7UBfgy5x+o90cAlfrkpXvYtG4A
	gIAdT32Bm0WAoiNKRu6QccUACapoTCQ9NpeCqvLEnyyCiwHLVwwNEKI0oGImlYxmcZukPceXMyP
	2X1slU3+QslJZSqh+lKsm8rnMfqVMLflmBllSPZ9Pr7G2xTjwJYYv9ggP7OE30ngaB+t8gjg5B+
	irBPuiuIHIH+HDYc
X-Received: by 2002:a17:907:8d8f:b0:b9c:b3b:841c with SMTP id a640c23a62f3a-b9d7279bb5fmr1162103466b.47.1776202889061;
        Tue, 14 Apr 2026 14:41:29 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6dfd77f6sm445243766b.21.2026.04.14.14.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:28 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	stable@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix missing frame length checks in OnAuthClient
Date: Tue, 14 Apr 2026 23:39:59 +0200
Message-ID: <20260414213959.1028301-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnAuthClient() accesses pframe without first verifying that pkt_len is
large enough to contain a valid 802.11 management frame header:

- get_da(pframe) reads bytes 4-9, requiring pkt_len >= 10
- GetPrivacy(pframe) reads the FC field at bytes 0-1

Additionally, when pkt_len < WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_ the
unsigned subtraction passed to rtw_get_ie() wraps around, causing it
to scan well past the end of the buffer.

Add an early check against WLAN_HDR_A3_LEN before any pframe access,
and a second check against WLAN_HDR_A3_LEN + offset + 6 after computing
offset to guard the seq/status reads and the rtw_get_ie() call.

Suggested-by: Dan Carpenter <error27@gmail.com>
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v2:
- Replace incorrect Reported-by tag with Suggested-by: Dan spotted the
  missing length check during code review of the heap overflow fix; he
  did not file a separate bug report
- Add missing version changelog (the initial submission was incorrectly
  labeled v2; no v1 was ever sent to the list)

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 90f27665667a..884cd39ec756 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -860,6 +860,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
+	if (pkt_len < WLAN_HDR_A3_LEN)
+		goto authclnt_fail;
+
 	/* check A1 matches or not */
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
 		return _SUCCESS;
@@ -869,6 +872,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
 
+	if (pkt_len < WLAN_HDR_A3_LEN + offset + 6)
+		goto authclnt_fail;
+
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
-- 
2.53.0

