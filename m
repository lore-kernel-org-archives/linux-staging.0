Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC35A449EC3
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 17:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778519172; cv=none; b=BCnSyYlQaZjQUVY3oKj4OinDaD95d7X9YmYgyPtNpk/BKSLq5DsdpTNtu4QqNEugkBEGe6sygtt0t5f7Tn1y1WaA7RlMgS+7q4q9PrVnq6qtTgEfBFm/UowSEiHjMttWuVg90lazErKO+14ypGOd/cl+aC5dJ+bVuXNfBm/6mPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778519172; c=relaxed/simple;
	bh=fvBHmQK/Aon06zpbGAi0GixFIKSfHZv5VmbC296WFB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PRAeGyPGB5taEDTipWDTcIlptVgLba3saX7DjxpuUrlLwEEsJMxMrAb88Ho8pZkaWy/cD3bcZLsNrfdh7nkGUiSjkHmppkd5XRsMM3lMVsRGJ59yThZodReKlOxVyLsT7m6FCgQC7kpG9csiLA22T85DLOqQhyiGWi24AD+ajAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgQyiend; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgQyiend"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bd2087858c4so67965466b.0
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778519169; x=1779123969; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekBwyg4HrSCpTTMTvNYpg3hZClkHuRIw3pfp/Je02wk=;
        b=qgQyiendyKGEoOj7IkraAO/rW0w4Q1l36QPFz6bBWF6Z7TRw7mdQ+FmVvVew1i8DD5
         XvKCpQbKBFTpC+b1xSruVQdt8YHCQ8gGqyEtHgwwgJjBvMBIRH4eHAwEz6ti3LQQAMH0
         YRweVmQrZNtND/M+xV95W0XfyrkH149hIzAvV9JqmVIz2UlKHdLEuaR3NFMvk2OUJ4ln
         pfaHL0HWUYV0xxhbXaYA5VU6wSD91ALJdJ2NpuVYwhpkBcQBIg9ZMM1LGdxfiZMlwHZ1
         qZ76KyH8hlujrvl/ovs1BhDl+NmjNn3ITB7TZyabGahCysz63mW1Mcw2QvVtxjoW+9Lk
         wR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778519169; x=1779123969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ekBwyg4HrSCpTTMTvNYpg3hZClkHuRIw3pfp/Je02wk=;
        b=T+43vdDWL+6MPzl+NfbsfnGPUwFi2sjh3ykGopxprlmrwKMT6IE4BQ2EJrG+myiVjv
         L5MNQcB90+lf5bcVBqe6j1w0KDJQxM+DYy3myZibBptfl5ZAoSz1AbET/aMd4nHBs3TJ
         epn4Hg+kYzw/vl6VGBjyUa7crY1Qg9L4QZ+FgQN9XBfzSGQM/TyEqcqMewx0DMhB94E2
         hssABwlKSAFfAx7ma0kuwOew1m6pR8NvBAwzEjyZKcFaokDYUxdlDN5OwITAcybEotUs
         RB0duS33x21t2yafL6SnXGWcY4153FdLaETK9+k9/si/WGTEqRTNO1SAHV1961naUwap
         Zr0g==
X-Gm-Message-State: AOJu0Ywsgh7aoR4JsgMba2fQllXIUekIVoxnrPufeeOLn084TvWbUzGs
	IqmbfWe9A6WXju3YHBjfltueuG69Hp7MrnQaZp2/iMiW/KZAx+fc64UC
X-Gm-Gg: Acq92OGp2i/PJHD7nXXFOqqSs+hH103r5NHe5soq/fVP3J4Mp53XBUa9Ke8IlJlV9mg
	SUcIXpRwacR0PgWPDYwKm/mihKFcQ/vs1tOSGuu9k8B3u5Rojt+LSdNfMpdA/d1eMcxShsXZMM5
	F13mO/Z7mUTJyKdyo6+aEijUc7G7XL52Z7SqQT3MrUvXRLmbwDTkAs2O9O2f9AMEis8Mz1KNgyO
	kQfkokxqk81le97Jwapal8sraX5H+WuPGJWu2BlDXGaLbK1PyXWR7kTI9lN8KtcU4Qd//kkYnHc
	gqtKrgaH1tNxeEknFBMaD+EUctZITxcVMkGhoNnFFITfeA62gr4RaEqgdQ9Ka7whH5kWuBYYuo1
	ELYG2SlsIIP4/2I1UlDO+iRaMB9LR4nDP25bQrfvtFJLFOEM7Yj3B2FMygmRt0pNGzrnPQQFaRn
	jrGcC3BcdeNynX3wT9YAnCub+EVbBnvNrCngokuIi/isGXbVUHAECrOybpUNCLxAwZp3IEgUxHC
	Kw9pZrh/eMfHX9emhq3N0Ba7lyJ9mHLTa0Tn3wFSZNmuzC7uPoGWpTnbLUW0xpiK4XhRfItZxEy
X-Received: by 2002:a17:907:988:b0:bbe:37ee:8a2b with SMTP id a640c23a62f3a-bcaac454c4dmr862165166b.33.1778519168856;
        Mon, 11 May 2026 10:06:08 -0700 (PDT)
Received: from ahossu.localdomain ([2a02:a420:2368:9048:c0cb:8552:96ce:1210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bccffbac588sm325319366b.6.2026.05.11.10.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:06:08 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: greg@kroah.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 3/3] staging: rtl8723bs: fix OOB reads in rtw_get_wps_ie()
Date: Mon, 11 May 2026 18:57:43 +0200
Message-ID: <20260511165743.1588637-4-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511165743.1588637-1-hossu.alexandru@gmail.com>
References: <20260511165743.1588637-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three out-of-bounds read paths in rtw_get_wps_ie():

1. rtw_get_wps_ie() reads the IE length byte without a header bounds
   check.

   The loop only guards on cnt < in_len, so when the buffer ends with
   a single element_id byte and no length byte, in_ie[cnt + 1] is read
   one byte past the end of the buffer.  Add a check that at least
   two header bytes remain (cnt + 2 <= in_len) before reading
   in_ie[cnt + 1].

2. rtw_get_wps_ie() does not verify the declared IE payload fits within
   in_len.

   After reading the length byte, the loop does not verify that
   in_ie[cnt + 1] + 2 bytes are available starting at cnt.  A crafted
   length value can cause the subsequent memcmp and memcpy to read past
   the end of the buffer.  Add a check that the full IE (header plus
   payload) fits within in_len.

3. rtw_get_wps_ie() reads 4 bytes from the IE payload via memcmp
   without checking that pIE->length >= 4.

   The code calls memcmp(&in_ie[cnt + 2], wps_oui, 4) without first
   verifying that the IE payload is at least 4 bytes long.  Add an
   in_ie[cnt + 1] >= 4 guard before the comparison.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v5:
  - No code changes from v4.

Changes in v4:
  - Add two IE bounds checks in rtw_get_wps_ie(): break if fewer than two
    header bytes remain, and break if the declared payload extends past
    in_len; add in_ie[cnt + 1] >= 4 guard before the 4-byte WPS OUI memcmp
    (sashiko review of v3).

Changes in v3:
  - No code changes from v2.

Changes in v2:
  - Add explicit size checks in rtw_cfg80211_set_wpa_ie() before memcpy
    to prevent the 256-byte supplicant_ie buffer overflow (now in tree
    as 92f3954ca9e9).

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731dd47..d6d5f3a8db4c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -661,7 +661,14 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 	while (cnt < in_len) {
 		eid = in_ie[cnt];
 
-		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
+		if (cnt + 2 > in_len)
+			break;
+
+		if (in_ie[cnt + 1] + 2 > in_len - cnt)
+			break;
+
+		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (in_ie[cnt + 1] >= 4) &&
+		    (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
 			if (wps_ie)
--
2.53.0

