Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA9E43DA50
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518701; cv=none; b=HG983W2ybIqOJluvlbS9uSzoDmW2x4bQs/3Y4P6h2vQagShNvdilDn6Eb/uW6g/R80jqoj2kkTRX+1Pvsy8r9X4a3atW3BHIi9NujmlqwTkTQ+bd9IQ7ojh3N1nNsAQITnLrjPhChttZYiqMrXQFRuuvBKFxurUFdZkm/8j/FZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518701; c=relaxed/simple;
	bh=3tSls8Cx41wcmloqp7VxXz2tkYeZitn2b5K53r33Nt0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=icVPb/NxF0B2eXo5zOwuUDtQrD6lbssPTK2vmH0u8VRX6r4zx/hqdNu0hKszFxQDgk2mTSpH1Txz5rE2z6DKgPSEVolkcGieSsc44WNRaQVJ9KsCLRsadd16gqqt/uTNLsUaWFTxHt7CC+EpEZ9gyhEjGJjBkJ9sRP/CaTZed3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXRv+SKt; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXRv+SKt"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-67c2b4809baso9066942a12.3
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 09:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518698; x=1779123498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=siPIRgKJr8laGYIu25dKGO52Hs80aRg2z3cm/KySn6w=;
        b=aXRv+SKtnszVe1RgRvOQrJ9oZreSnhuswSV7PzUAF6ke7CFJTOOV05AAqetDKQpwZn
         bzTlT9MNNpdzd5AE3vn25jnCFVnvjIeLy4mRSXCHeL5B/MMSI2Q3XFVKooUi6kPiukDg
         adulPL8S8nb2L0fMwFAalnVARrcRy2siPkjYP1vhGRwwF1HodRcsG7S/F0gYVyfY5Kh0
         kT7GQkLYMYdrb8alb33FdeWvOZuJzgGylOY4AO8lMfBOOdF8DLxqvKSHhJNMC1kYlLjz
         99ISV7m/O09IawJkMSLhg4WjKO39ya5RZFFwGx2KTQ2+vRwhNvtLeh8IF8ZNR6xYg/uW
         eHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518698; x=1779123498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=siPIRgKJr8laGYIu25dKGO52Hs80aRg2z3cm/KySn6w=;
        b=p4DLmy7ugQ5F9kHiVnr/zsZoY3bfX7/n9+KVuURVqrXyYIFM2R13v8VkHxHFiyfKAb
         j1pQQ1tSxDbNwinZPaf5yU2HW49Fa0rM/zO8skOyiJO3Sdgk68EpMpuiO9K7xf+fff8n
         dTVXfPF2fRrHq9IxD+YBe2E2froDTLaA+91+a69VYwz/a8WYfkcUHisFpVfnO0xpeT1q
         0OT3n3LTJ9uUehg+Jk7B372CJ/QRssDo1SFlb3HirUc1T4rHeXAojm4Hn/DzaU1MSzPw
         aremo/pkBIwCkxFnUcFm8DfiNyzEIyEB4KQAn5VlRlNmdiN8Q4o+srGOPdC6rDXPMCV9
         hDBQ==
X-Gm-Message-State: AOJu0YwYWSUAV2TqYSo6+Aa15vWIET0PAsA4LiHgmm82dDtnXSfK2/Q6
	Jz448H/+sgoUYmaDGfYQgkz1gDN4ROKdoKzqK5XTz7vU1+ymksH9zU7OWaiXeA==
X-Gm-Gg: Acq92OF90rzWxQvciOVviv/LMEyZPtWeoxQsTlGKlj5MjEwJj9g4McR2eaBw9dKfr4p
	zpH+VpfD0DHE/ppUIy/1bMKUmrKaISldFVblQV7aW8LbJAMtmyy+qgNAyZ5JuIGcp/j4/NZGpNu
	qRBNGmlX5TpCRa/oi112qQrIt59MFNNh6R3kYDbLMMEldInito8dR562DjfqLs3d8nNGbMf8ElO
	JUOk8GAK6f0V1u6YuHhYSZuWwa1YXpOjBI0kMVo9172LcBZfl63Tbd/Zy0GXA/534nQDCVM5O1r
	2H2jYASQzMqudkWwBR9E90L7xRIjTCV/xlsG9sABXbXqCNz2vYaIW08jD0lKyQ/Q/iforEOtPIX
	AkN+b08gHpq5tOXh60Fh2FCder//j8pbOl8clrYcgpMtLvGCNyIdA30hkpvf4ooCcTCvyUOUF9q
	elOOzJvZCCCOohTKJUuacXp6j9F+DgQ1q1ghVuVOjAAlct11udhYzl8+S+EVAUrTyhff4cdUVB9
	gC5v/HNMCVt0x+gDhkvDKGbAN5t7EvEvG29Tv1hyyhnxEAH7G+m8acKLZEg2mnNQA==
X-Received: by 2002:a17:907:c18:b0:bb8:b536:55dd with SMTP id a640c23a62f3a-bc56d713f3bmr1549976866b.41.1778518697764;
        Mon, 11 May 2026 09:58:17 -0700 (PDT)
Received: from ahossu.localdomain ([2a02:a420:2368:9048:c0cb:8552:96ce:1210])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bccffbac588sm325319366b.6.2026.05.11.09.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:58:17 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: greg@kroah.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 1/3] staging: rtl8723bs: fix OOB reads in update_beacon_info() and bwmode_update_check()
Date: Mon, 11 May 2026 18:57:41 +0200
Message-ID: <20260511165743.1588637-2-hossu.alexandru@gmail.com>
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

Three out-of-bounds read paths in Beacon IE processing:

1. Unsigned underflow in len computation.

   update_beacon_info() computes:

     len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);

   where len is unsigned int.  If pkt_len is smaller than
   _BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN (36 bytes), the subtraction
   wraps to a very large value, causing the IE loop to iterate over
   memory far beyond the receive buffer.  Add an early return when
   pkt_len is too small.

2. WMM OUI comparison reads 6 bytes past a possibly short IE payload.

   For WLAN_EID_VENDOR_SPECIFIC, the code calls
   memcmp(pIE->data, WMM_PARA_OUI, 6) before checking
   pIE->length == WLAN_WMM_LEN.  An IE with pIE->length < 6 causes
   memcmp to read into adjacent frame data.  Swap the condition so the
   length check comes first.

3. bwmode_update_check() missing minimum IE length check.

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
Changes in v5:
  - No code changes from v4.

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

 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index dd34f229df12..6ea0d646b961 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -850,7 +850,7 @@ static void bwmode_update_check(struct adapter *padapter, struct ndis_80211_var_
 	if (phtpriv->ht_option == false)
 		return;
 
-	if (pIE->length > sizeof(struct HT_info_element))
+	if (pIE->length != sizeof(struct HT_info_element))
 		return;
 
 	pHT_info = (struct HT_info_element *)pIE->data;
@@ -1287,6 +1287,9 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 	unsigned int len;
 	struct ndis_80211_var_ie *pIE;
 
+	if (pkt_len < _BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN)
+		return;
+
 	len = pkt_len - (_BEACON_IE_OFFSET_ + WLAN_HDR_A3_LEN);
 
 	for (i = 0; i < len;) {
@@ -1299,7 +1302,8 @@ void update_beacon_info(struct adapter *padapter, u8 *pframe, uint pkt_len, stru
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
 			/* to update WMM parameter set while receiving beacon */
-			if (!memcmp(pIE->data, WMM_PARA_OUI, 6) && pIE->length == WLAN_WMM_LEN)	/* WMM */
+			if (pIE->length == WLAN_WMM_LEN &&
+			    !memcmp(pIE->data, WMM_PARA_OUI, 6))	/* WMM */
 				if (WMM_param_handler(padapter, pIE))
 					report_wmm_edca_update(padapter);
 
--
2.53.0

