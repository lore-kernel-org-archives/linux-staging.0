Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4173C8C62
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494638; cv=none; b=ZKr2HhwGb8LZ6GSNwoV2Or/xtJv/K1eh4aXHupROZD86507loBLKxYWxpi8eTmA6Gb0lR7I8LCEM5Y4i+64fP+E89Lphmx6J3DpjfACnxNR/Pt73ufeSQoVF1oYZ+11u02z/dbidtfKlWnl8aXjeKnQL+sFE+5FBeE9wFJ7W+tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494638; c=relaxed/simple;
	bh=pW6vyIzERmBXqn1/A1MdW/DxaRNuYIsxm7FIZhJRgMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdC2yps7DlreT7vUbs4lmE3RsLUpW05PhGuZjzB+K/g2qxqwObpILWaekv/2QOuU1+BzBeQOHp/0L8cD7rAUVDwoe6GxPO4QUfhXhzF1+syrnkUtSu7hGcTBt9OAYd2shMNWS9KHtlkBwf5FXq6/iP2vSJgzIDEDaJJGSGUNzAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FG8FvmOO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FG8FvmOO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so374701f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494625; x=1786099425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbKaSw+MRwNj4WVeJIQ63LYq7o1fQU+CkE5QYBwX4fE=;
        b=FG8FvmOO4GH/YX+DOlZBSszcKwqHbygouyc8T/eY0qc6EpLYKM/hd/06QnLuIAp1PC
         R/djym9eWj4dgwriC1G4Sgq95j1B2dsVhtoY29IIMeP+6VEh3vwwv5s1xAo8fS8XAJPQ
         zKVFYfjOSgEGY16QOpyXpZwv5jv9IbqmTutjKqPe8DrmFtF7uSHc1u1b/VU7LIQTO4by
         o4VvZv0PC5RrfoQw1c5c0QYWwigyiJofkpgOSAIxr1wA1/wc3/se3eyJtEstVuXjBd/g
         4Pdh+JXjuaQw/JnXwHTyS+ymIRNY7NqD13jjusLUB5UeFke+RPpWCrnibhqKrO6/lYMj
         sH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494625; x=1786099425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbKaSw+MRwNj4WVeJIQ63LYq7o1fQU+CkE5QYBwX4fE=;
        b=kEOsvVQ8emxP6qZz+uOfJiZ8hRU1/eAT9IgVeZuk7930jKpR1jnTGp50UfcWphkG+q
         8KB7HRcFd3E+wwKmYkzd70rgYu73LkT12GvwVL45SOUmJITNIXu4WzvzxH0MF2idB9TG
         u7tbwfDZx3Qexr7DK4PFBqLgCc2Gqndd3ZMxcjx5gCLGvZvJoEzRyYBeGX5a+MZLWjfp
         vS/rSQSfcTXutEXaN0r92fTs0mqu+N1wiQF2yYCruulVy+q8KZ3UI/iTNt/VCDYR5QN/
         yo+d3WOe03aVIbSG+8gxRS98k5vdIGSUxqXXECwiuGwo3ohcbuCsu6SZkpTT0W1D5KZe
         OWiA==
X-Forwarded-Encrypted: i=1; AHgh+Roc+W7pxhdyrZuvEf65PuUSgRQYeD9Y1k7UO24RFTnXaFsj5egla2ha8gAU24tB00PWsflNqEsdWBqFhc9t@lists.linux.dev
X-Gm-Message-State: AOJu0YwGxbi4Z/XLJjQ5rw2DP2k0WHQhVTLM7UCiOIoFTjjNte3w00Cq
	c3Lv9I0edJtlsUlJQ3yeWhSaqrHjqBFU8qk8ekJnwjo0JUdKYPfSfbgyPokKvH8A
X-Gm-Gg: AR+sD10DbWtofNzTLHlc3MWJ64nwIZDXjLDq9XUOhHFXjeeEvpO1bLxVCsawJYg0R1g
	PR4VSVfOLLkrglgAXy6SSRCtkc8m9fNbTDPPn79jOh9Gx8gvKM5DoQCSRw0LyzsN2BBW1Z5URcO
	rgteiuCfdEUbCE9ucBHSI5llbCXajbjR2cO4FVULkls94HGPLgZaPlJf/7jtIjnYDljJ0XpThTP
	7LXqnhpqgmR68s5kuQ7EpeE8N0MD5tFwCJZkDJh7m+AYKW5pyxwV5C4lcKJAAMBnPP+sUDZmt65
	v0aynuGeEP1Txc1Br18kQzjzQ6o8m48RNAyPSpZPYq7umeBHzwEy0hukwjJCxd93BTRPxBaq/c+
	dx1WrTKsV09wOS4wbnSW5Vr600jkGQKiueEw2XYMeCXkG/pqDWXdZ1k1TV+aKGpXchvi8ItXHDA
	ED2HDg67Kr49aJwV8xc0a13WgOIPqJWMKbMY5nJSPl9DlQKtNEv297ADkJZx+qQH5Dh0XBxblCG
	EZLaFx5j8yAZmxb1EB1qYVlhKpAXFbdm5pPkSRPiOCeqS/K7jyOykW91xBuCjw=
X-Received: by 2002:a05:6000:18a6:b0:47f:773f:2d68 with SMTP id ffacd0b85a97d-47fd2ac9f8dmr3724016f8f.16.1785494624402;
        Fri, 31 Jul 2026 03:43:44 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:44 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 08/11] staging: rtl8723bs: renaming variable bHwLDPCSupport in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:31 +0000
Message-ID: <20260731104134.12754-9-fliegbert2@gmail.com>
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

Renaming occurrences of bHwLDPCSupport to hw_ldpc_support since the
prefix b is an old naming convention to indicate a boolean variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 0da5515a6be5..6a7b86532d81 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2183,7 +2183,7 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	struct registry_priv *registry_priv = &adapter->registrypriv;
-	bool bHwLDPCSupport = false, bHwSTBCSupport = false;
+	bool hw_ldpc_support = false, bHwSTBCSupport = false;
 	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
 
 	if (registry_priv->wifi_spec)
@@ -2195,14 +2195,14 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	ht_priv->sgi_20m = TEST_FLAG(registry_priv->short_gi, BIT(0)) ? true : false;
 
 	/*  LDPC support */
-	rtw_hal_get_def_var(adapter, HAL_DEF_RX_LDPC, (u8 *)&bHwLDPCSupport);
+	rtw_hal_get_def_var(adapter, HAL_DEF_RX_LDPC, (u8 *)&hw_ldpc_support);
 	CLEAR_FLAGS(ht_priv->ldpc_cap);
-	if (bHwLDPCSupport) {
+	if (hw_ldpc_support) {
 		if (TEST_FLAG(registry_priv->ldpc_cap, BIT(4)))
 			SET_FLAG(ht_priv->ldpc_cap, LDPC_HT_ENABLE_RX);
 	}
-	rtw_hal_get_def_var(adapter, HAL_DEF_TX_LDPC, (u8 *)&bHwLDPCSupport);
-	if (bHwLDPCSupport) {
+	rtw_hal_get_def_var(adapter, HAL_DEF_TX_LDPC, (u8 *)&hw_ldpc_support);
+	if (hw_ldpc_support) {
 		if (TEST_FLAG(registry_priv->ldpc_cap, BIT(5)))
 			SET_FLAG(ht_priv->ldpc_cap, LDPC_HT_ENABLE_TX);
 	}
-- 
2.55.0

