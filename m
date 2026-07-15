Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D731347F2CD
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119833; cv=none; b=N6SG34GAN3VF5scrohU7wMZBVKsHTnDBORq0f+W88nfQH5tQMPv6eIfJQsbz/40H7Hjj9JES4ylOAdRAYTmKehaFtw+XvuOD2i4yVIqV/c1hZcaV3+blhtRdLslAZ/SIdOpG3rkaRen9SFJQoa2AkzxG3RbC7XpwX9humoMmSyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119833; c=relaxed/simple;
	bh=LDjnU8wWcc8WVujOeS2iCrdBFq4t8S0oQujwBbiTOO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpCsM/Vc74NER1qnrQ3Je000MDv8nX16texmgdV2ryNH0/ERPnhklfmIcnuoNjv5QR2gejaV8GFkQpTsZArYlifdGg96Z1exjroidcjY8Z0Z1EdUETxBCncFw4slsAYa0mIbQEobtbkrOdTRJj79e5nn4ehnWF1D032yrL9WgdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAWB1tgX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAWB1tgX"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aebc8cb5bcso3767174e87.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119830; x=1784724630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml0TaZ73hFYK/wxsUsTYoqomxGiJC157MiXEoyPfmO8=;
        b=lAWB1tgXgOYG4+ly31TPyuTq77t2d1bH74Nwdb/RRwDDBVdhGd8ilal3H+zaEZqFAe
         wI8S8fqYe1CNSlLkT+Xw1PYo5kQ821mkN0lTNGbord+Ye8qEkRi0TMhAU/PYV2gjgFJ0
         llsGaSmG82Fsqrb5Pr1c20NDO1rgqEwv2w8TI4Aqa5ESGyhMbqGOwhYcbo0+Z2qGHlIc
         MCkc2c/rmfkTZ3Pm0uCVpT0aJAw+iDf55WG0yG/Mr9mHDOJKXjntt4n+q+iY/uvU1YCF
         h9cktmsuTPsCDQVUFSK5fMVJJAnhXtsAMF0ZCvL23hDgVE8Co15B/VmZOHwYdymn6uu1
         jDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119830; x=1784724630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ml0TaZ73hFYK/wxsUsTYoqomxGiJC157MiXEoyPfmO8=;
        b=HdRr4E/LzziYDq3+DvOVnOVD0GRQ1rSWvRzGc4U1Utj6KCN53omROYUKsqbqCE3Lke
         47+xgJK+A9lHPKWSy+AtWW86kB0o7fTlpKSA12G18BlpulChFwd05QZVxCEhR67X4+Ym
         BhCrwlOrAPH23aTVbMWhBgPCFN7EYV4trlUt3mqQ+qChRLt/OD+ubflGJ9ogMRKc6hfm
         9gO4tC1NFq18JM7xuq7JTvLwXJoUfINNGRkzyDc2I1KNysmQwqLs5qHE1pKgwwJkhcMN
         QixHazryBoz6hP1mqi4/9ruHiK/XdEeyXaWN/lyqE7KzyDgW4MvLx+uQGiVzz8JklEja
         0U4A==
X-Gm-Message-State: AOJu0YwzZXNxvbDOCYovGCBlNLWxzxBcbU9ON0UGCscs95Es3AzmhLvw
	6QAAEb5Chn4/IR/WOnr/2cLPMHyAOvrBBqZFNyfMxOhIQMrdtWbAfpju
X-Gm-Gg: AfdE7ckJIQeIHuTQoMaJXrAVwml9XjutFKA1HFxCFHEuQ0qVyspp4wlTmLB+US4EMKu
	iF1gNNnh7p39mM27JbN2D0T8Zqg8Th+OD3jjq0x1qZ3txsagOmBmv5xjX2iuTbOdTj/Ss+fZc6A
	lA6TxLJjWthHtTE+d8u3ed6bmIb5XDv4RRmF1Y/sC1SJheIoe1wjrq6Nph84Wp0xdnmZKaqIJT3
	6Y+wYmUnZCr059k2LA98dB2jn/wsatToAj4tD3JfEdtGi+XZQqiWqOD1dnWSl6Qx+6J3K3ln0cv
	j3CmDvuSzhCn98pNFi48gB2iCn3V5+rI0S88lnaQxEFYdt+tS3nolQ4LH3SVIfn72r9r9Aryere
	ZDBhPppeRWLIWmS6zoCNNhMqGTM2LR2KgWwZPWWdLUEA1iQgiPXU55uzZgM20Dm2dDKZKJwo3qA
	t1wq5x8OqovampT0g5VciLJEIjB304R78F3Je6eT1yd56jI+2ZqJ8iTDocpCC8+BUrgtBN92nZJ
	DffKEFzPXmzYQ==
X-Received: by 2002:a05:6512:8388:b0:5b0:1760:fabe with SMTP id 2adb3069b0e04-5b15d7766e5mr418334e87.15.1784119829423;
        Wed, 15 Jul 2026 05:50:29 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:29 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 18/61] staging: rtl8723bs: replace rtw_dm_in_lps_hdl with direct hal call
Date: Wed, 15 Jul 2026 19:47:46 +0700
Message-ID: <20260715124829.90290-19-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant rtw_dm_in_lps_hdl() wrapper function from
rtw_cmd.c and replace its call sites with direct calls to
rtw_hal_set_hwreg().

The wrapper provided no additional abstraction or logic, serving only
to pass fixed parameters (HW_VAR_DM_IN_LPS, NULL) to the underlying
HAL function. Removing it eliminates unnecessary overhead and cleans
up the driver interface.

Clean up the function definition, remove its prototype from the header
file, and update all invocations across the driver.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 02b7d24c3..88ac64a6b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1354,10 +1354,6 @@ u8 rtw_lps_ctrl_wk_cmd(struct adapter *padapter, u8 lps_ctrl_type, u8 enqueue)
 	return res;
 }
 
-static void rtw_dm_in_lps_hdl(struct adapter *padapter)
-{
-	rtw_hal_set_hwreg(padapter, HW_VAR_DM_IN_LPS, NULL);
-}
 
 u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 {
@@ -1753,7 +1749,7 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, unsigned char *pbuf)
 		lps_ctrl_wk_hdl(padapter, (u8)pdrvextra_cmd->type);
 		break;
 	case DM_IN_LPS_WK_CID:
-		rtw_dm_in_lps_hdl(padapter);
+		rtw_hal_set_hwreg(padapter, HW_VAR_DM_IN_LPS, NULL);
 		break;
 	case LPS_CHANGE_DTIM_CID:
 		rtw_lps_change_dtim_hdl(padapter, (u8)pdrvextra_cmd->type);
-- 
2.55.0

