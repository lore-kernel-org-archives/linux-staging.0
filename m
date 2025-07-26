Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C6B21D011
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504447; cv=none; b=MPfly3syccmhubvCKe0oumkXUNqU45YQPI8tnjq7XnEXOwg+OUDmLgOElHqNmhEjF790T78xuOha3zg49VQMw14wr/QtajGFc064nPlAiJ4legIKzMYHlknz+IjoTW4zSXuD38ZwPIJpPlPyNZB0PJayL2rnpfx5kTC2Yv0UhNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504447; c=relaxed/simple;
	bh=95tRCUajd2YWzthjvIMZXiLAW0pTk6LVGoVuxLw9wO0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DU7rqMHwqmiYYXOdz9Ih07lbm0BXjPzSRotoGehEyLyKl9rIWAanuyEVamaSMCd+dUIIH+83PjuDvkkKrU/x7c9Ms+yFxEF1HcvfwKUa0c1FzSdbadEn12n3Gtlh+O1YYF3j/x8QBfZOH2oVS/I092zEhZkssn7WvxWxIRTGv7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfjhKIwg; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfjhKIwg"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e278d8345aso265022885a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504445; x=1754109245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+oh4R8+Xz4P49bJ6RR1wQypz80s2da0SdRPMOzyOPc=;
        b=AfjhKIwgHurSJStNJGVe7gl/cho6PbQrVmOajqbAyG81kUt5Rw7j2PbKjX2ekPvUo9
         fWPOoRISbspGX9+eeqePngq/H4yG3J2xHQMCvo+mtb3OPPCp7wFL5+iXV9zhOT4pKm7k
         dqKJ/kJWE4rf1i4s8M1CG8Strph8rinRp/ECBuup3G0jtL7MUC/T3wS5sobA+W9XprQz
         jWlfccCqjQmc815zUg63EyHsESFiY6oSdzUh+/7gJLS9iI5AxZlE+fCXkNE6qoHA0wWJ
         QQLUJZevx1IStJxuqxUFYtEGCz8hoKjMQj2RgoUECShH31iKZKvqs1wmj4K5UtIhXw54
         F1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504445; x=1754109245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+oh4R8+Xz4P49bJ6RR1wQypz80s2da0SdRPMOzyOPc=;
        b=ow7l8FmPXlla6YzqTzyuZsgnzZNDETsEHvKCwADGJOkRPyxy8xiLLG8faJOfXZVevh
         aFZkqFRXmk7hKsdm0cRH63ktGP3s5jjhsCECLq4C2CdRPsTA24Iwk1CEouYGMuKU5Rcp
         6uLCQWnbNUa5nN9r0C04yMnsLsDUD3G1o/rUt9qJ6zpyf859dwOAXZRqGwWdUFnBUy8f
         PA9KqgfYEbUj5nb9dyewriRsKQOgOoJPQ2goBJX1IEk/aGWn9BX5SpPH5am3jJAEvZ8/
         FOJuA6pMXwEfBedQFZixajR0afBIAR6nDOmvZYuPiDBqIdaZEwXvzsq6i3+fyqOnxDdp
         ct9A==
X-Gm-Message-State: AOJu0YxORG5fsDYlXO+MJbTvnWX51lmT84n875bfW0bSXC2jVzV6RjA4
	fW6hoZtlAmuKYCzPp0HJwYfOm09OU2EsZejg5pgu8uJf67dp/Q4ZaGRr
X-Gm-Gg: ASbGncs3TdQYlCoGckeU+E6I6os2707DOttUSDyoSSso4HRraN/xPBx0/ZNU/ByQ/gA
	SIHNZSCHNlZd22OtbW6/Sr5zuQS8EiXck77ZmsU/iaJNBSp1IZc4lx3g1E+xOl7biybf4ZlNKG8
	eOIqiKB/QC0bX5b/GPBO62kMyn+ctcd9aI0nj955/d7DgrbETgBz6ZuQsPdXHtMQT6KAccXiq/L
	YCVL1dGzkkP3ed8QJKCGCq0gTaBDSh98UeUEc8QwPTcWzKFzmwmVAT7C1Jllp7Hw3YGRUBwBEWY
	TCfE+JYfcokZzvXIkr2ghnzslR/UCBRUAGG9BoCaGBYi5n/ZLsOMoo1z1e1B13AcfFaY2Ht2WHb
	08C/EP90myQjERgUEJvUuJ4IJvZKCvEgwLX6lsTF6xkJQv9VqnjY=
X-Google-Smtp-Source: AGHT+IENcPolz2NGbAdveExhQu7dx7/c6T6biciIaJRVqa3hpe/07ZSgoIvG0LIF/sal83OsbxKm5Q==
X-Received: by 2002:a05:620a:109a:b0:7e6:28e8:2dab with SMTP id af79cd13be357-7e63bf8c5b4mr442052285a.40.1753504445233;
        Fri, 25 Jul 2025 21:34:05 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:34:04 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 16/20] staging: rtl8723bs: add braces to all arms of conditional statement
Date: Sat, 26 Jul 2025 04:32:14 +0000
Message-Id: <20250726043218.386738-17-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added braces to all branches of conditional statements for consistency
and to prevent potential future errors when modifying or extending logic.

This aligns with kernel coding style recommendations for clarity
and maintainability.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index fb7ab7eceb54..7552f7e4d14a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1571,11 +1571,11 @@ void rtw_mlme_reset_auto_scan_int(struct adapter *adapter)
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 
-	if (pmlmeinfo->VHT_enable) /* disable auto scan when connect to 11AC AP */
+	if (pmlmeinfo->VHT_enable) { /* disable auto scan when connect to 11AC AP */
 		mlme->auto_scan_int_ms = 0;
-	else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true)
+	} else if (adapter->registrypriv.wifi_spec && is_client_associated_to_ap(adapter) == true) {
 		mlme->auto_scan_int_ms = 60 * 1000;
-	else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
+	} else if (rtw_chk_roam_flags(adapter, RTW_ROAM_ACTIVE)) {
 		if (check_fwstate(mlme, WIFI_STATION_STATE) && check_fwstate(mlme, _FW_LINKED))
 			mlme->auto_scan_int_ms = mlme->roam_scan_int_ms;
 	} else {
-- 
2.39.5

