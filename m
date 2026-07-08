Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF53B777D
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 15:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523382; cv=none; b=ms3GSbWov6wbtUcQ8Xq+UnPk+i8bAJZwH+35rGpIdv4EjaWWgU1EAxsjUE1QKw1tfJG9t2j2zGQklkE9bOiVsYKzEu6Ro/TVzMt6nFBt8UFbR1K6pOFk5GEb1ckVfghWLC1Yu0rADNnBg5Srr7nmaFPRmhhvdsmGvRB17OMeaSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523382; c=relaxed/simple;
	bh=Kd6QvdmQb+mhLCcFmbQKI3kkaNYcHsp43yh+gEtveU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JUYXHi8WpUAOGH253/2QuqEC6vIZ8ECT9zAMt1ftGDK0M30BTjStxh4Q12egMT11Ln0orDbUbKffymCVmHwJ4mZFMYpZCx5qeitoDjVhTid5KYDaB0akvrOqY9RbJpSJDuXsU+/HssPbhlltHobNDq4gchQWIyFHy8AXSWRKzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTM5yKMk; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTM5yKMk"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-698ab9aae16so1548326a12.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 08:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783523379; x=1784128179; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HcmlIYvI4Oba3ksgXgV4/iiQXmNcUQ5hY2wt5O2Q7Ok=;
        b=VTM5yKMkBmRzYEH9I+kzJ3HETCdjcquE8B8M0O8XQ8ZcDrb0pTC5bREidfM/XJk48x
         rWQ0FVvRvqO2+jF6QLH0GesO2wQfdQdCrJQcXFF+ClPLykV6Y7hJxx1nyNl/lWKGdI7W
         FIIGzvWCZqMT2a03GM7TohUT+A0wB73LQ1j0cKsLmgqmUmmFGp+S9XNZVt6kVGZuTtge
         c3t1eMtdxyw4nngLJfjZag8O8fJwDAxsrOmfNRJ84aLqvd1EyiRckIsQoqYcmBwfkIX8
         RHNssA0+eJ0RWm6BNq2EvFtQVjXhFHAv8wok1vz0Z4TG5nni/9+y1i+ZOSuuo2AwIDFQ
         YzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523379; x=1784128179;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HcmlIYvI4Oba3ksgXgV4/iiQXmNcUQ5hY2wt5O2Q7Ok=;
        b=ZpqEsh9wlhtvlO3dwoSODQM0fMKUPayo3ciCk0au2mDneRf/yFUfCMPKV4fM43mv5h
         P0mqwpbFbiq5ZwGvKit9zcGsu8cAwb0sZ77FYON/g/kKBuZBXzhWFhKsqqh8ihOK9WFw
         JhNpSFEUzbSgWqjTSnq9YT4cQsPQVUmjDUAUO2pKrKE3o/mF7qZonpzYZOZx+arsPewR
         0M6WkfSeH/vpxl0N8iV6cgspdOx3KX+yIXrCuVt6o981jwqUuZXq47zdpxaUKvChBVoC
         JKJnvp02K3/fMofwZhmDYC5KMdWmsFUv1TTkSki0pegZrf2UyE6QxCobCetajqFNiCCD
         2mUg==
X-Forwarded-Encrypted: i=1; AFNElJ9MbxkMC/uyZfviuETEv2Q5jsbmhoEce5pKr7YeW3ybOvPcpWfrhvMvnkAKay0g7LZIKZm0VoSa9jPIzUeh@lists.linux.dev
X-Gm-Message-State: AOJu0YzR6Ar6Vz4a4iV520svKNr0aQ1zH0N3LrEAjPOcgD7DCYxGaT12
	3KQ3ZrwPQH1XPOaeXmykDyAGZfWfBouDMOR0bUwrJiYYuLaSuOUO0eoOICGPxA==
X-Gm-Gg: AfdE7cnmM1gy2vANWgf70uNP6rO683+q8pupf8t/RWgbI2Ls92wDyF7ij4ZYSFY4Dpo
	q4F/0UoFLvg6yxSXNNL15Eum2m2t8DoIvvfL+sCVY7FGnNKU3wQohjn138sqXDh9TskisGP+SaB
	1ksGQQVu8l0xL4TM+apMjTA9uDd4NwwlciJxWitz7Ba4UJCaBnOr3s0B7Ad9/d8jUnW/6umsFy5
	AhgGD4hX0qUtdbT5Lza/6L4pwgKngSqrUF8F5qRpzMMoRmTqv3EkUko653YBi1Ec4PT/Ul2Ls5f
	x4NqEfd4hzmX6aDBp8BrhA6Z+nkW6L+VEML7va336ZN0EeK4JsjqGvubiliv+wyO5nG+SgjpV8n
	NnNCg0UwQRf5V5WhAdB9xw0fjEj4nfPg0gcnf9HqGHZ/h73Yar/yMzi06ji500WH9TVcNtaZoSx
	j99JjVJuY43uMlQzt7mWhL5AxoJYIVDoJ03PXAIeFqj00Sikkc+50/D5bBg0I4e4rd
X-Received: by 2002:a17:907:26c8:b0:c12:6cdf:6071 with SMTP id a640c23a62f3a-c15cdecfa6amr205090166b.4.1783523379083;
        Wed, 08 Jul 2026 08:09:39 -0700 (PDT)
Received: from fedora ([102.78.12.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ae0bb618sm344422866b.20.2026.07.08.08.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:09:38 -0700 (PDT)
From: Jad Keskes <inasj268@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jad Keskes <inasj268@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers with named constants
Date: Wed,  8 Jul 2026 16:09:30 +0100
Message-ID: <20260708150930.1813224-1-inasj268@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Break down the 0x6404 and 0x660F in rtl8723b_InitBeaconParameters()
as requested by the TODO in the source.

REG_TBTT_PROHIBIT (0x0540): 0x6404 = hold (0x64) and setup (0x04),
both in 32us ticks.  Same layout as rtw88 (WLAN_TBTT_HOLD_TIME << 8 |
WLAN_TBTT_PROHIBIT in rtw88.h).

REG_BCNTCFG (0x0510): 0x660F is an EDCA-like register.  Lower byte is
AIFS (0x0F = no contention before beacon), next nibble is CWmin (0x06),
top nibble is CWmax (0x06).  Confirmed by rtl8192du/rtl8723ae in the
tree which write 0x66FF (test chips) and 0x660F (production) — only
AIFS varies, the CW byte stays 0x66.

The out-of-tree driver that Dan linked in the TODO discussion was the
reference for the bit assignments:
Link: https://lore.kernel.org/all/aiGMXBNQ0TbIGbpP@stanley.mountain/

Drop the TODO since this was the last thing it referenced.

Signed-off-by: Jad Keskes <inasj268@gmail.com>
Reviewed-by: Dan Carpenter <error27@gmail.com>
---
v2: Added Link: to Dan's TODO thread, expanded commit message per Greg's feedback
v3: Added in-tree references (rtw88, rtl8192du, rtl8723ae) and Dan's R-b tag

 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  5 ++---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  | 13 +++++++++++++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index e794fe3caf9d..4afba1252161 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -878,8 +878,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_TIME_8723B);
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
@@ -888,7 +887,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_8723B);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index ffd03927841c..81105c55afb2 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -72,6 +72,19 @@ struct rt_firmware_hdr {
 #define DRIVER_EARLY_INT_TIME_8723B  0x05
 #define BCN_DMA_ATIME_INT_TIME_8723B 0x02
 
+/* REG_TBTT_PROHIBIT (0x0540) - TBTT prohibit hold/setup in 32us units */
+#define TBTT_PROHIBIT_SETUP_8723B 0x04
+#define TBTT_PROHIBIT_HOLD_8723B  0x64
+#define TBTT_PROHIBIT_TIME_8723B \
+	((TBTT_PROHIBIT_HOLD_8723B << 8) | TBTT_PROHIBIT_SETUP_8723B)
+
+/* REG_BCNTCFG (0x0510) - beacon AIFS, CWmin, CWmax (EDCA-like layout) */
+#define BCN_AIFS_8723B   0x0F
+#define BCN_CW_MIN_8723B 0x06
+#define BCN_CW_MAX_8723B 0x06
+#define BCNTCFG_8723B \
+	((BCN_CW_MAX_8723B << 12) | (BCN_CW_MIN_8723B << 8) | BCN_AIFS_8723B)
+
 /* for 8723B */
 /* TX 32K, RX 16K, Page size 128B for TX, 8B for RX */
 #define PAGE_SIZE_TX_8723B 128
-- 
2.55.0

