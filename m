Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2963D49251F
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 17:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778002709; cv=none; b=A33Hk3lVO8+YwERUTN6noZxduVFlIzMP/I0uQ1uEnh50tAopzf+4T4KwYPMJkyuoBLyIFtqlYxbdvRkcdYOQvIj1xKnIEqDqA/GNGNvwfWA7s31q7sNdZk1IGicuoxT0y6hVo35bcBscz24b5LuwQU/iDAqbyl74uH+GccNApSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778002709; c=relaxed/simple;
	bh=8CBrQmbEsdNgHXYKb6wsIXwlaQPjAq3SREKqrhhl4GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z5+1mW50gjpVSb1nnMpJWjTL1yQaVVXuD8aTbDVrymKM7yvQ/6+ovvjYfMU9gQQtuyIuNSwKU6FlEUOdfaf5NJdaZ45duz4kliEZZTrZqYkfB+k4a7qtOgcWZBlRDHDTnDl3xGEmL8nPNIoO/toXGoRei2i9qxlNJQMtXemv7d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNVKG5sa; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNVKG5sa"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso53370645e9.2
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 10:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778002707; x=1778607507; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+NEFajvV+WD5zm8pAD2atBhqQcX592r+fg8eqdbXZVU=;
        b=XNVKG5saH5WuQJP5QndHKIo05FZsMbKos3VJn49HdYM3bAWGOmI2RUqfdNhq0Hhv/A
         ePdkN0QVvv39pJHtieAmiG4RF0Es7UlQ3hFobrmTogARkxMTsmTMRLUROuh7m+KwUno4
         dFsW7US5N4+utRko292ofclyj/gLSkkqS9Cunh9XyOUz3SfiWMDnu2pK6JNv3o6718nb
         GJ7aOao50JgOt3/GVk+CihBz5I1lPymJRQJVQ/jdsTcheH7UHEWmXfAjCF8ttOcZ5Btd
         ecBoe0WV4X4RvTgE4y+ZjNJVn1lwqxgyP48MeSkdMaWJdmgrglKVjOiTurAhkg4wcZYa
         ocrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002707; x=1778607507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+NEFajvV+WD5zm8pAD2atBhqQcX592r+fg8eqdbXZVU=;
        b=h0jW1HrCJ8C7YuW5FLxI0E37fquSgLbqNbxXVBnIaE0nljk4RlrrZiI36hrtNry9wR
         C4Au/1mUD3rFiVGL6WN1YeCYquN+q4PWJKH4EdcQlXFFJqp5hL6W63A1VXv6G+HE3rW2
         Q8yTGFWTqNIkQCdhpTZwDCaASpjLt2SIrCscw4JcErA/TMDoemdKyjW9bsrB2pJtNQ/U
         75/a+oytgkRIwEm7zQ4EEciuFX2H6oz1DD4txtz0+E9I+DgUMc42hRuDS5KD/py1YyG4
         wk5FAgwSsFbQupvXHMtLe0cDZkbPyS/npJcyl0WONu+6+jKT8I4Wp6rZXpOV2Cjr18iC
         DScA==
X-Gm-Message-State: AOJu0YyXG4tuMXnHE+3PbvaFjFK0EO4yEDay2NwQbaM8i3hAX3/hlHgM
	XKEFSkJlvpBrhFWC3nbqzGDj5VM0u+//bM5KOs7HdJciB1w5LUlSr8tS
X-Gm-Gg: AeBDietkJA5vw1klLI49XseievfdoJtB4cYbmE7Bm4YimBzqjcCvQ06UZSjOc9UZe/R
	TdIRVlRXjRfmb9xVXc3mTZWHgIYnaPSIRhATxMoNGbNG/iZwYo39G+A5zts+MktxXjl99KgTvj6
	Goxn2wkLMZwQHJqzsgmOkuQMhzvFvsJqFJdzVhg1UnV3lKyceEWv+tTiJetZb3iP476VFJiKnhf
	0XgD9wytiCJ2ZsLmPxR6oLwm+dAEO0wNeoc1o8tuB3WadwjIg+ypvKCkSpYhjvWE6yxm9FtVTgn
	pL+9yt/k1oKJ9PvcuzBZK228csoqTf4dNc+q1/9QGUQrT5ZSjpa/QEAfjH2hBcKFpolsGa8iYPC
	HxnImVMaGo3gEzZOScT0zBWdgJiGFXqARc5d/8zwF/A53p9ISlRHATgF8+EioFT8ukljuk7IcMy
	rbvxhvmLDYNsJzgSzI8MWcllSd0/Rt30+4L9AhtsYxn0n4R+6H4tr6+9aWB8vbxYfKDrrCA6LYU
	zOCNHxM514arXypkTzPK6OlkQyy0ut3Cl2IBhZj4T0aZg9Ck4MNo32XcR9c06Ul69F8FlE=
X-Received: by 2002:a05:600c:34d3:b0:48a:58e1:6d17 with SMTP id 5b1f17b1804b1-48e51f3655emr3935525e9.20.1778002706507;
        Tue, 05 May 2026 10:38:26 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301ad1sm655473875e9.9.2026.05.05.10.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:38:26 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	stable@vger.kernel.org
Subject: [PATCH v4 1/3] staging: rtl8723bs: fix OOB reads in update_beacon_info() and bwmode_update_check()
Date: Tue,  5 May 2026 19:38:16 +0200
Message-ID: <20260505173818.3674164-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505173818.3674164-1-hossu.alexandru@gmail.com>
References: <2026050436-italics-clumsy-e83c@gregkh>
 <20260505173818.3674164-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Four out-of-bounds read paths in Beacon IE processing:

1. Unsigned underflow in len computation.

   update_beacon_info() computes:

     len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);

   where len is unsigned int.  If pkt_len is smaller than
   _BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN (36 bytes), the subtraction
   wraps to a very large value, causing the IE loop to iterate over
   memory far beyond the receive buffer.  Add an early return when
   pkt_len is too small.

2. IE header and payload may extend past the packet end.

   The IE loop advances by pIE->length + 2 per iteration but only
   guards on i < len.  When the last IE has only one byte left in
   the frame, the loop reads pIE->length from pframe[len], one byte
   past the receive buffer.  Even when the header bytes are in bounds,
   pIE->length can point the data window past len, silently passing a
   truncated IE to handler functions.  Add two guards: break if fewer
   than sizeof(*pIE) bytes remain, and break if the declared IE payload
   extends past len.

3. WMM OUI comparison reads 6 bytes past a possibly short IE payload.

   For WLAN_EID_VENDOR_SPECIFIC, the code calls
   memcmp(pIE->data, WMM_PARA_OUI, 6) before checking
   pIE->length == WLAN_WMM_LEN.  An IE with pIE->length < 6 causes
   memcmp to read into adjacent frame data.  Swap the condition so the
   length check comes first.

4. bwmode_update_check() missing minimum IE length check.

   bwmode_update_check() rejects IEs longer than
   sizeof(struct HT_info_element) but accepts any shorter length,
   including zero.  After the check it casts pIE->data to
   struct HT_info_element * and reads infos[0] (offset 1), which is
   out of bounds when pIE->length is 0 or 1.  Change the guard from
   > to != to require the IE to be exactly the expected size.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v4:
  - Add pkt_len < _BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN guard before the
    len subtraction to prevent unsigned underflow (sashiko review of v3).
  - Swap WLAN_EID_VENDOR_SPECIFIC condition: check pIE->length ==
    WLAN_WMM_LEN before memcmp to avoid reading 6 bytes from a short IE
    payload (sashiko review of v3).
  - Fix bwmode_update_check(): change > sizeof(struct HT_info_element) to
    != sizeof(struct HT_info_element) to also reject IEs shorter than the
    expected size, preventing the read of infos[0] on a zero-length IE
    (sashiko review of v3).

Changes in v3:
  - No code changes from v2.

Changes in v2:
  - Add IE loop header and payload bounds checks in update_beacon_info().
  - Use sizeof(*pIE) + pIE->length instead of pIE->length + 2 for
    consistency with the sizeof(*pIE) guards (Dan Carpenter).

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4cd9..7ccfaa538ebb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -850,7 +850,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 	if (phtpriv->ht_option == false)
 		return;
 
-	if (pIE->length > sizeof(struct HT_info_element))
+	if (pIE->length != sizeof(struct HT_info_element))
 		return;
 
 	pHT_info = (struct HT_info_element *)pIE->data;
@@ -1286,15 +1286,23 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 	unsigned int len;
 	struct ndis_80211_var_ie *pIE;
 
+	if (pkt_len < _BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN)
+		return;
+
 	len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);
 
 	for (i = 0; i < len;) {
+		if (i + sizeof(*pIE) > len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN) + i);
+		if (i + sizeof(*pIE) + pIE->length > len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
 			/* to update WMM parameter set while receiving beacon */
-			if (!memcmp(pIE->data, WMM_PARA_OUI, 6) && pIE->length == WLAN_WMM_LEN)	/* WMM */
+			if (pIE->length == WLAN_WMM_LEN &&
+			    !memcmp(pIE->data, WMM_PARA_OUI, 6))	/* WMM */
 				if (WMM_param_handler(padapter, pIE))
 					report_wmm_edca_update(padapter);
 
@@ -1314,7 +1322,7 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 			break;
 		}
 
-		i += (pIE->length + 2);
+		i += sizeof(*pIE) + pIE->length;
 	}
 }
 
-- 
2.53.0

