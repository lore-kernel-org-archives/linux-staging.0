Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C408240F758
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 10:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494636; cv=none; b=N83IgYQf0fW7Fpkqw+hgem47fDTJNqrdRLCmhiwv8N2G2rBtucRNuLWoKNWptr8IAhqVkTdcc4NBdt6gjAFnEMqaJPT/C3BBFiwUoCEA4QegzvbcoKU/nv2Pah0ojPwW23BMWRXpi6SyZNoj0ghzWygxVf7PlwY1ZFA+xNSPSFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494636; c=relaxed/simple;
	bh=ouIlssAAeAqaLcpdONgOP1ImahiDwteS4YgtJ8/8V2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGs4bWFrYJyFB42ktB/6rSICbdikHQlTlNpJpY61V1rnOfNbEdfH0cKJRHq1PLOOHjGnJblcnNbg9l1W88Dsq2Ujq6wcSC1tuV7Qp5vl60v68gf+XienVbUDh9ilxQBQbeTtO2glOK4LF3EvUfYRMev1TLNFERHb8B4GIcHXqPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9L0PdAi; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9L0PdAi"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47640541585so608224f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 03:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785494625; x=1786099425; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZdj+iwMOPrhBLbfruaWKbmMuhQ7LhmhxM/YV7ZMr2Y=;
        b=K9L0PdAirFH42AzV4sDExK0CARcR99/2zSrkQlXsIz9FVTbGdMHSWKuzYTl3NKvhLT
         iH+tcmiAwNVWVZX9rLhbXaAvNqhmjx+blKuCEtORRmiPqRR7mACUTRxR0ie8DD1ZkvGl
         vXmyWIDe7RbnnOl5jMYC5DbMcs20lRFEwxLZWpG/j4u2/xkZB1j6NDqKa78ezMKcKA/m
         HGg9TUOggPaopGTAOf9Jk7AcEXmpRilwXB8ST08H1lduYhAxrEU3HUt6uI0ikASifbS3
         nmkdBKyNBJH0amvKcMvR4qsb/REEKzotFP/6djXW5i/nWz+3+vanyP2T1XSP+irrtqKN
         2sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785494625; x=1786099425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZdj+iwMOPrhBLbfruaWKbmMuhQ7LhmhxM/YV7ZMr2Y=;
        b=s/phXFhuvv5W8kC95SjG5+94CGX6cZDRWk2Ot+zcDTWZuW0vB0nMvrnKIERWx1u7OP
         vDxQn9zfSBUMbscJD56cx01sPDifLWVseAaz2P67lYhLnyTJchwk2DyfK0eIkx7n0T9Q
         n862JcV3EhIG/WnSIJ4dU6mFlL9PnPObKJ2T0UgjJ5ix2kfHJ0saLdFD6kUBvUYaI2sf
         H8DGYC2DTkz52zuaTF4uW+DZq/b/rGk4zBx1avx0gC1kWMoUIlMC6e4mBLth/TvdS6VF
         SyXNfoJwX3Vu3YTET5FSEqEpM2PAaCGukykErz81K1hymoW1SLc64C/LlS2KsfLqN4eC
         7h9Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro7f+ue3eljQsXdnA1KOLc4F2Dxg/GsrZUuA1gxVsJ8eBfcYJBJuFg+5W9t58BvAa6Q/4ddGQ+/9gs3AKtx@lists.linux.dev
X-Gm-Message-State: AOJu0YwFelHvCdNS2khVV88CGqeXVigIBWU+VTNsJXKy0/Gtr29VPVcL
	eusoq5wXSuv9OqUKlGGPxFZ7PS1dQcenq8BXbRPAGNKzpCJxC5hKd6BK
X-Gm-Gg: AR+sD12AV58c0XXygM1phEI4IjiNjxsFQMe/sK8I+0fmSW5qDENpbPv+GFRp3qEVm9C
	7tTwVpxj7aK5L2G09q3Cpt+QrcEgc+NxNfEBl1EE1An9gF1sjOoZIQSl4XU7CizDSkDAB6N0832
	IVUATe9RFefp7HPKIq1x693wEiFDT6YBynSQzJ3B2DxDSmplratg6gkn4Qaqfhec0Oxm9zLkM45
	DOResbbwF0fFvGPWJTckqOEAnl1DdYQ4JUhQJeYi5/91GRjVEUDTzEweTh0NoXAYMhjtui/DQcd
	xaKQUDsGMLhiX+cS8uoZrA9eAyySNrcBS7HzBv57LjeubZ84KfGybmKuWZnbeel8mAI5VZBOQzK
	OMAjEloi1RL4gPTnvDoW7lX1gsi8147jKDaI4uRdmU68aXAis+6S505BZ6k+Aomt5c893cQNw8Y
	AltlfyAJ0yTJKdiGU5J8nvsI1noUuSru5XIfIP8cjPmL/Mjh6iM2c1O0ODdYSsH+HLhn+U/7wVn
	HvNwxdG1g2d/eejPH9sqRCRnG0FZt7Pm2RoS6RXAzRWEPs+hfth
X-Received: by 2002:a05:6000:2505:b0:47f:48cb:ea5b with SMTP id ffacd0b85a97d-47fd2b4dd99mr3181344f8f.43.1785494625359;
        Fri, 31 Jul 2026 03:43:45 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-233-039.088.074.pools.vodafone-ip.de. [88.74.233.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm3423134f8f.19.2026.07.31.03.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 03:43:45 -0700 (PDT)
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 09/11] staging: rtl8723bs: renaming variable bHwSTBCSupport in rtw_mlme.c
Date: Fri, 31 Jul 2026 10:41:32 +0000
Message-ID: <20260731104134.12754-10-fliegbert2@gmail.com>
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

Renaming occurrences of bHwSTBCSupport to hw_stbc_support since the
prefix b is an old naming convention to indicate a boolean variable.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 6a7b86532d81..caf8c7623a73 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2183,7 +2183,7 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	struct mlme_priv *mlme_priv = &adapter->mlmepriv;
 	struct ht_priv *ht_priv = &mlme_priv->htpriv;
 	struct registry_priv *registry_priv = &adapter->registrypriv;
-	bool hw_ldpc_support = false, bHwSTBCSupport = false;
+	bool hw_ldpc_support = false, hw_stbc_support = false;
 	bool bHwSupportBeamformer = false, bHwSupportBeamformee = false;
 
 	if (registry_priv->wifi_spec)
@@ -2208,14 +2208,14 @@ void rtw_ht_use_default_setting(struct adapter *adapter)
 	}
 
 	/*  STBC */
-	rtw_hal_get_def_var(adapter, HAL_DEF_TX_STBC, (u8 *)&bHwSTBCSupport);
+	rtw_hal_get_def_var(adapter, HAL_DEF_TX_STBC, (u8 *)&hw_stbc_support);
 	CLEAR_FLAGS(ht_priv->stbc_cap);
-	if (bHwSTBCSupport) {
+	if (hw_stbc_support) {
 		if (TEST_FLAG(registry_priv->stbc_cap, BIT(5)))
 			SET_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_TX);
 	}
-	rtw_hal_get_def_var(adapter, HAL_DEF_RX_STBC, (u8 *)&bHwSTBCSupport);
-	if (bHwSTBCSupport) {
+	rtw_hal_get_def_var(adapter, HAL_DEF_RX_STBC, (u8 *)&hw_stbc_support);
+	if (hw_stbc_support) {
 		if (TEST_FLAG(registry_priv->stbc_cap, BIT(4)))
 			SET_FLAG(ht_priv->stbc_cap, STBC_HT_ENABLE_RX);
 	}
-- 
2.55.0

