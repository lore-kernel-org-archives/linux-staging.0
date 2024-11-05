Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E91FE10E
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786135; cv=none; b=CYY2BEDrPZaZ1XfDwPoYQ960ALnv3Q7GqZnwrYq0B2iUtymjBkCpK7f0ysAHDIHssZPN6Bqmk+ARqaZ0OAAs5qfRS2f3C/4idG5CpNCgvJhDvPGeFmzDLZB0rzluuhxPMaefff9571BogW7ITHIfy1ryYH703IcAo80KBf12O/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786135; c=relaxed/simple;
	bh=dUmRw66INNlKdlmTudq7RiF3F29a8TpZ7rdCqwq7m+s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IFmWenFYnvt4lVn37SBylLhvLlcwKm1v+kyjqQ+hR/iwGWr8pGYWht+doThrzAkE72URBeWkf8GaLynQwc9oj/PFrS4L+WzilIAkHXjIpw4Hgscnz2XEzPl5hKcORzVv8TXsOA/kYtLdFR5ypzX6wARjiMP3Z3TiQj2FyDUvcfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ov18giRu; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ov18giRu"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f2b95775so5664586e87.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786130; x=1731390930; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATcCt5wGapgsOIibXTkxr5INcEzs+wUBJpSP0wgkVe8=;
        b=Ov18giRu9BVFhUT8Ve/dyy+wu00KOlmIsZLiqsKOIVUh9Uo2q3tPUhuU6RPgc+vwYA
         /6Op9KB1uBkTulEYjJHuPrcUVgzVrj02I8qS0L+alk89nH7sorjBKK5MYTUjFeWzrSH5
         AYJlgWaRFaXUsZ5UWt3roBcpbaHQJ3odHoEePtjZEl4U52QI3bl6Q5UBURD4CWtOvMox
         9TFqoRq48qsBCLk3NZXnMEvOY/Cx+gsj//EQelfwCBjBRx+/kpHycnCaispRVC3W9VZW
         f7hwo4lxnewgCFFGMrXENalrsmGelt1Xvz+zmaLry3utD2/lpwzjYFfjb+ga36FYZ3vU
         IfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786130; x=1731390930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATcCt5wGapgsOIibXTkxr5INcEzs+wUBJpSP0wgkVe8=;
        b=wrB9mcX3o+njKOVbjP8b85c3H2UIkxTLtZxqToWuPc5yU/Q8KClljbIWCON/y4RooU
         FOTUPAVz16tro0o01OpQMgeDHqEjAU2USLEvFRMdbM5Vn3qxCvJYlFnpVyel9AQNpJ4m
         spu7ueyqhFNhk0F80sT3bP///B5D/ykMben9JG2L0ScQoDjRcEsIsJDjmccHg0VIGFb/
         NghhaLGp1USLp4m/eY4bCt/6HwlpRSO04wvcFA9GCPotjNLT0IaRDejxmE8q+hsUH2n8
         hBmgmMEYZPOFtbqruoX8epQ+xmeBivmnEgSL1vIZiOOg9nufcks17Y39MhgdRFkMfOHo
         RR4A==
X-Forwarded-Encrypted: i=1; AJvYcCVep+K1STv+cxiZsxAhyjKrEZb9EbmRFtRjOgm2aTpSTG/c/v9bKGwFncElIEHlPPHgj+CGrgzi+o2GvjZ8@lists.linux.dev
X-Gm-Message-State: AOJu0YwG8CQYUQqddh0ufZcICj2UTfpViVGRkCdhSWgvaphsNC3xs64Y
	StkKiVw2i460jbFY1w9qUMm0fo2pUYjnbnaSiUOoais8BEUTbJF2
X-Google-Smtp-Source: AGHT+IFf7/arJetSzLOR2v1y+NSDgZwOhl+cpQCCz/tzyY+aP5gGIynapqUT0FiOj0c1zKHOFHDl1g==
X-Received: by 2002:a05:6512:b12:b0:52c:e17c:cd7b with SMTP id 2adb3069b0e04-53d65de52aemr11843291e87.22.1730786130334;
        Mon, 04 Nov 2024 21:55:30 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:30 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 05/16] staging: rtl8723bs: Remove function pointer hal_dm_watchdog
Date: Tue,  5 Nov 2024 06:54:52 +0100
Message-ID: <6e1b09e7d7184285fc747be7d7bd636bd1690d60.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
References: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer hal_dm_watchdog and use rtl8723b_HalDmWatchDog
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 7aa9d84ee574..af72e0fe6fc0 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -285,8 +285,7 @@ void rtw_hal_set_chnl_bw(struct adapter *padapter, u8 channel,
 
 void rtw_hal_dm_watchdog(struct adapter *padapter)
 {
-	if (padapter->HalFunc.hal_dm_watchdog)
-		padapter->HalFunc.hal_dm_watchdog(padapter);
+	rtl8723b_HalDmWatchDog(padapter);
 }
 
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index f742a82d1e35..ff899a066b33 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,7 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->hal_dm_watchdog = &rtl8723b_HalDmWatchDog;
 	pHalFunc->hal_dm_watchdog_in_lps = &rtl8723b_HalDmWatchDog_in_LPS;
 
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index ddc4c41605d2..311a97c31518 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*hal_dm_watchdog)(struct adapter *padapter);
 	void (*hal_dm_watchdog_in_lps)(struct adapter *padapter);
 
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
-- 
2.43.0

