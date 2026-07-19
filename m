Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8DC27057D
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 04:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784434526; cv=none; b=qnKOiariHBKO9fSHZAVo7dIOuoXWKomxIXsL+BZTseG+EZ3RITGet/nb15T97K/Y5tZ03HoaWsB16YA10OLqNJh1pGxnu6JUi9XAVioJw/Jw6ktUglF69fKy/eKzOqrAUSw+iT3df1jAyy8dQj/j5U8SQTMIxOP1CcI9+mHDScs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784434526; c=relaxed/simple;
	bh=rZ4Py+ivJMlFzHb67uuRBdEEPBg+t0H4JAPB4QTZC20=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+8z++Bo/nA7RkFRGOm1QdoG4pJOeXwI2VILEU52BKiAD8qq2z8L5dkHUoaHVw/W/UFcysQh8uI5a2nUxNkIkS7BniWYAbcHmpmx+dX4vT3Fk8Qk2u2rrXHPGvSD7wqweIK9h7JUUz5mzi66tT9Tw77utr23OcilVKsAfQks6pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJVWuUIe; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJVWuUIe"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698a9f11776so9528118a12.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 21:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784434522; x=1785039322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0iYqMAXukoKru3oUtjQbgbaZB6TaGAonUKvli9tEDbU=;
        b=TJVWuUIe4rC+VF0al0JddYgjZ90XZ2+1J7HBqhDwyvwr55d2Piczm6nbCccTXMj/DD
         hmLrDFlSI9P2uyAqE7UMcOpsGNmGhTviG6h3D8SeBi3OAGePFHfe1SZ1509TvhPAXGoJ
         s+CfMnp0a8DuEAFwnMGTthbtoNqnMMlMBqbT4xt5OHWuGvqcGEd+PDozgFAiiujJZfvu
         lQp/vhQx9uor4I6y3OpXx3mORQT3vhqonvxEB0hTjmLVgrV5aoZA8H1V7kuL5Ta3R1Zw
         sHZtBmam9RkMiA+bKdF0dQHns9tZg7SwAlD5P0IqahhG6Z88wwrmTrdX2C6xLaRRGhHj
         C2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784434522; x=1785039322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0iYqMAXukoKru3oUtjQbgbaZB6TaGAonUKvli9tEDbU=;
        b=FcEUwiDKnEFk9AjxJR+EeVpzhbpHt47OThc7BLcAonqK4s/XvvTXVypYcv0QN5zQjO
         VuLUXbkcsn2cZENtn5G7yWktt/oZrq27y2VzBvC7wOxNzi3I/LoeEsnnO+sKoSiYL8u/
         aR42YRunDwHTZCvWqs8OB7C/BZgirp+r06gV7IJe9RvWm5UXsiB5e/UPJ6AUZQ/s9yfb
         412cFYdZiR8yhTsGKI2IY6nSES7pPF9L4ahP8mmecyUzTIXocN9ToV6sec7IxIHuppYB
         ZRGD7IKj16s32bQ9AxyvX2MhW3HBoM7szfgI3Xj/12c77Ohvp5lw2Fj1rXtvyvAHqHsO
         QAnw==
X-Forwarded-Encrypted: i=1; AHgh+RpIc4dN3DPVn6LB2Vwe9bhbvV18Y+QICN2gjLEAT7yxBfyOkWppNIgx2UzNR9VdTbmraKeu3iBaUyOaTKdz@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx6LaCHVtVGJZYj07lYMbO888kjBnYYHR9C9+ymqv3GYCRj6Ds
	U4g2AVIl7Z06cPNa3hiY/oMZNYCmSGGlvGkWIFssidTHEFQvaOlWazCv
X-Gm-Gg: AfdE7clYqNAQcRr2ASaM/Hs4/f/EADkkbwtK7gWykjaKlEWA7LpJaPc3Y1Px92Af4Sg
	K/EBexoEu/z/piZcI2zWu26LAFfAzspriGiGVYhUHqagADIsK4Gztb7ZRjZNRTvEHt1XXTeowVY
	eIQzdi/9Yvi9oMuznNrclJ4Wa36hJXYvLgxIfdFXOG+jRIaQYbSrnpmFfGEFRsrqdovyQD+wlyX
	Jq6y5KBdpM11lymal52HIWJWNHxIVi8gEpSaWIvJq8dUIjNN9H5tliwgSP1bwbRvvAVatBIgg9u
	lUxWw7ExoT6QsmoQk7OUSW3aGCddUlIDraUZ+kncosvWpq63UVkTB85eI8r7dS3dmivlt32/End
	6mJtrhPlyd9OVb2sKAwUach+0Qm1sPHEYMAjR9+rQrPGgw9kR5ivHVaIv88CLtC8WyKWjmtIzQ3
	zd34q/3pjhVDIve64pO/9BvcZ8Z+nhfGtvtLkvb4RNQQpbPyVu6zu8Pxw=
X-Received: by 2002:a05:6402:52d6:b0:698:9be1:4a48 with SMTP id 4fb4d7f45d1cf-69e65327816mr2986159a12.33.1784434521961;
        Sat, 18 Jul 2026 21:15:21 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6fefcf2bsm2928064a12.9.2026.07.18.21.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 21:15:21 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix OOB read in WMM_param_handler()
Date: Sun, 19 Jul 2026 09:15:09 +0500
Message-ID: <20260719041509.97894-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WMM_param_handler() copies a fixed-size WMM parameter element out of a
received information element without checking that the element is long
enough, causing an out-of-bounds read for a short WMM IE.

The handler reads sizeof(struct WMM_para_element) (18) bytes at
pIE->data + 6, so it requires pIE->length to be at least 24
(WLAN_WMM_LEN), but it never validates the length. Two of its three
callers reach it after matching only the WMM OUI: OnAssocRsp() in
rtw_mlme_ext.c matches a 6-byte OUI, and join_cmd_hdl() matches a
4-byte OUI, before calling the handler. A vendor-specific IE carrying
the WMM OUI but a length between 6 and 23, placed in an association
response or in the IE blob handed to join_cmd_hdl(), passes the OUI
check and then makes the memcmp() and memcpy() at pIE->data + 6 read
past the end of the element. OnAssocRsp() parses a frame received from
the AP, so this is reachable from a remote peer.

The remaining caller in rtw_wlan_util.c already guards the handler with
"pIE->length == WLAN_WMM_LEN". Move the equivalent check into the
handler itself so every caller is covered; the sibling IE handlers in
the same parsing loop (HT_caps_handler(), HT_info_handler(),
ERP_IE_handler()) likewise bound their accesses by pIE->length.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index a4de538722b5..c614c0b4c792 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -666,6 +666,9 @@ int WMM_param_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 		return false;
 	}
 
+	if (pIE->length != WLAN_WMM_LEN)
+		return false;
+
 	if (!memcmp(&(pmlmeinfo->WMM_param), (pIE->data + 6), sizeof(struct WMM_para_element)))
 		return false;
 
-- 
2.55.0

