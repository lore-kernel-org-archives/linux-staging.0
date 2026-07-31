Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF813DC4DE
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494638; cv=none; b=V7c6IdmV5dYQsMec45wqMET78KAsqvRSeGb4VuFJUHQvt9G/4BdvIfWGye+gg/ucNceHTCmJGGSx5CLQ+6ndnjnRzHyZi+KKwzo4ZTkjSunnHz1VAkycfRQ381IMZYRa+aKmtGFixb/qytrrRZkq0LPL1csbprqWbbvQH5SHhqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494638; c=relaxed/simple;
	bh=s/yVx3Bk37E/nahtSUsrtVl5eSvqKTX2TkHdsfmUFlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ksTyynGrzfoC9sKA6Bvi2C3+SYP+6x/drnkM5bfDglOHU7sUygMBAP6HQ3PUMN6LfFEdaYz55T4k1lkxxZtmbR0oSfceOfEOM4JveaaHLQj2q3mcG5pqoP7n5j1BKDcAxp6EZS8acoG8a1TtqbfyDpXWXuzjtk+HRGNPn6wnLMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CSCvg/Jj; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSCvg/Jj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47f7854678cso88806f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494626; x=1786099426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=odtmlCilIn2KnYYEHaGoFCa82TzTOfkbBRrqOu7Bui0=;
        b=CSCvg/Jj3x7yS7WeSmXajgJDLlshVHLgXm+37qGP1rBR+hWblIk86IGDqUwvEGgGoa
         Ps98QWYWO0ChFEyqjeVmpSgcXDQN2NQdljGRx5VsESUZLRcwCuE5Hndd39Tk8fFBArNA
         2o5JxvwEL2YXnlL/uohfD4+RC1kb43MHl2FTlWwJzEDCrW5nF+J3cZjXa2EtGHQLVbC+
         LkL8p9pgkf+0e5sPINwY/gfPpCg8tVDwlLVRPQcWaiFJ4dWyj27j+odp1CLeJ/+EanRR
         D1mPA9iCqwE0rfBDCyePpSRVaY024fv9kd14acw0TqMtN2b6juYBPaNbaDuyNG7hby0M
         /hFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494626; x=1786099426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=odtmlCilIn2KnYYEHaGoFCa82TzTOfkbBRrqOu7Bui0=;
        b=WeOb4iye/A1+tt7MtznPv6qulcp6ojCDNlmTvPQ4QhKOAJoUk9NDaH7S5WpKvT0iVi
         r3Oke00db9ZMj05jbhcTF5n6ftTCw1+WgQDxttukQFaIGMf/4iP1m6dZ6Jwb3Og9HLGk
         ENkm68c/3LzOoBs42q4La3rtAQY2Ul9lcn9+BAw+8l4znPUI1FhZNl2igKTb17f1hhjT
         8x6OszhMzT22RSpV1kcC4cd5XtThTJe4abjSHQF64x1SCBR2K1eANvfZlXpnv/6O6rJx
         fOB2E9PD1dYrcyp1Sz9KgVZPVPu+8lQ6WwwZbcyo8kXU4vrjAR4YnGwXuBot2Qthp4ti
         YjSg==
X-Forwarded-Encrypted: i=1; AHgh+Rqwpm9UxSD583qmfFLtPxHQj7CBvcJfjM5prZCxobqIfcxNwOM94HnWGjd/4eibLJ1h3Cr50rZaIRDrZdur@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2QEcFBiSFKhqGuJ3G/dRMq4TKT8okSLRsL/CrYwuBMNgQwrC5
	W/dL/1AG4+Wz7pK0hOZH8zRTDq/FQHO4itF5p5FyQmIdCSbqVBifAp3n
X-Gm-Gg: AR+sD10AFSYCHmvue5cWyCgudxf2ojgQTO1wrLsT9tOACVkDFmlakewd6hML6NZFQ3U
	P2SIsSZnN+GSI0QEgEi6TXkaX9hsSTVNFf2DoAlcNHweYy/jbZt9diUkdz5VAbq1CtRU53q79gc
	/lXQ1vj6FlBlyMeQUbwUkUu3ZBYH51KX2mkCBNZeszWmgz6IzOvj+glaJn1Uw3lelECEooJrnRK
	k5irdavAGnvPltVuMCLMxbk9uPFTWKgz93koA6jBysuYoTeLOsXQqUlMla8JOhGH62S4oOhyk4I
	og+3wKU1kqQQhl5yneft497UZrJ4ux+iUup13o1M1nGs+puWcsJS0m4pd+IK4gR1tqolK7DaOHW
	wmGixcAh62b6bLHDYHhpjRAmZyhSW0QLlr1npbmOil9vxo9/OxJsdXEjlFAIoDJRLqxuj2dy2DF
	lgMR+BNod9nRo+2xtvjdiMeJUqT3jPGUxmLBukx3/fnkxoG3bVfYPSvJCyhr9NWtyNd2FjAyHjl
	Gq3q1tg6CzOvuw1uerzmWjc4AfW5jrsWAtzEVBSrvL1zIWLLiaBbH1J6cyck86E
X-Received: by 2002:a05:6000:4201:b0:47f:93e1:e7d0 with SMTP id ffacd0b85a97d-47fd2b3fa67mr3648406f8f.36.1785494626551;
        Fri, 31 Jul 2026 03:43:46 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:46 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 11/11] staging: rtl8723bs: renaming variable bHwSupportBeamformee in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:34 +0000
Message-ID: <20260731104134.12754-12-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731104134.12754-1-fliegbert2@gmail.com>
References: <20260731104134.12754-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renaming occurrences of bHwSupportBeamformee to hw_support_beamformee
since the prefix b is an old naming convention to indicate a boolean
variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index e0dbf420ac62..84e479886ffc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2184,7 +2184,7 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	struct registry_priv *registry_priv = &adapter->registrypriv;
 	bool hw_ldpc_support = false, hw_stbc_support = false;
-	bool hw_support_beamformer = false, bHwSupportBeamformee = false;
+	bool hw_support_beamformer = false, hw_support_beamformee = false;
 
 	if (registry_priv->wifi_spec)
 		ht_priv->bss_coexist = 1;
@@ -2222,12 +2222,12 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 
 	/*  Beamforming setting */
 	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMER, (u8 *)&hw_support_beamformer);
-	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&bHwSupportBeamformee);
+	rtw_hal_get_def_var(adapter, HAL_DEF_EXPLICIT_BEAMFORMEE, (u8 *)&hw_support_beamformee);
 	CLEAR_FLAGS(ht_priv->beamform_cap);
 	if (TEST_FLAG(registry_priv->beamform_cap, BIT(4)) && hw_support_beamformer)
 		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMER_ENABLE);
 
-	if (TEST_FLAG(registry_priv->beamform_cap, BIT(5)) && bHwSupportBeamformee)
+	if (TEST_FLAG(registry_priv->beamform_cap, BIT(5)) && hw_support_beamformee)
 		SET_FLAG(ht_priv->beamform_cap, BEAMFORMING_HT_BEAMFORMEE_ENABLE);
 }
 
-- 
2.55.0

