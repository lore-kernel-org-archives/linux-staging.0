Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4232358381
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 05:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779426316; cv=none; b=HL1Rlp7MCXo1cKq9aH8O5xktq9X2jjlNbCPh0nhGFZICDD+dUnxMnnIW8YlMcxIUNB6nZVO/sc5yW5VxWbGProIRx0cqtamC7++Tk4Iv8rhphyZ3FL2PRg6E1t2fmxxle+ciSqDVOVUeVrVBNRW0jyhAR3XfT0aSammtkN6VuwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779426316; c=relaxed/simple;
	bh=5s/k2GoyVy5iLjBDOgRJdVyoABGbJO92gMkvvSpzjYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=monCqZtsNyKznkCPX1K5eyOS8BOHUvpeUo2Bg2ntF/nEvwd3uq5QeNA/XrtYB5Y+ZR4mUprkQ7AQC313EwKoFKj+v/ed1tdnb9j3vVfS0eGoevIbrC8lV2Frmd2ZSr3uIxrf7p8d901O3azF0AVlq39Ocffkq1cFwuEL0tvHtBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m+mCiho7; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+mCiho7"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e5fd39cf11so590826a34.0
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 22:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779426314; x=1780031114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=prw6iBa9/2APcJ/AhSOqxD+3wXLKh0w5SrJpj84gM3Y=;
        b=m+mCiho75WSRffZv7XNeKL0Y6O7MN6abEHt+M8aQrrAQ5zHjCjgyqDeTSPBb0SBzWn
         C3wiYzeWCVXrfvTK4rDp9DaPUi1jOyUzYKA7k7xos0W12epW1oT2CVUfyzYzYuyYvwOc
         +xMpYS1th+PsgqNgoRkqNFR5uwxagwO1NukLxyPJo/bIDg0njONf3gsnVL72Vj3DaF5+
         wDvIIPMMNtdnU/QaNPUtCzhlQKO81vLcDO4pjZtapBqnIWxEnP+tFGVvn3u6nOIymV9d
         E9Johb1oEsvYSPhh9H3w+KbkxX8o9NUSHp+MNGk3Kbmk+3cqZwBHaKMtAYJ1IgIv1Cl0
         bCNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779426314; x=1780031114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prw6iBa9/2APcJ/AhSOqxD+3wXLKh0w5SrJpj84gM3Y=;
        b=Oy68C5uJHP/LtXBrtDCiT1WuGEOizY3AZIfUbMZim7EIkfbz1wGWZFDabe55+f5MKZ
         XgEs1gXVXw5AIdaNG16NppJHZ3oFOSmjkpp2+94CXbgECPyCZ2vGxaS1RmEbaU1n7bVq
         oo6PzqC8AT0Uw2pmusPEBGkB9EYUxEQOUfw+TbZPXXVzvQNtbJfM47hTsE833kfk2T1q
         He9l8FtVq2GLA9ik2FXmB6+XwaaK3gKEs1YSdi7x03XWi9QwkmDaTY7wAKXRBo0bGEGy
         kehcB1iqvV3x0WVNY/8r/4I4rX7CLMW02Ld8x4oRsCqKubLAJbeGANdfUTZc/s9sgcsB
         cYOA==
X-Forwarded-Encrypted: i=1; AFNElJ8hNe2TBdhKKI0zeGGTIHxaZkQ1jEN9VNV5Wuq3pliKBitCSJhM0Pr5yklF15f9JDaBeJ03bl8HXliYE2NF@lists.linux.dev
X-Gm-Message-State: AOJu0YxWIgcQCmLTUrtEPtGr1hyhJVCdKKu5EzYHucfErG5h8Y437dLA
	L5siKDK24Z9qNaCRJlA8ZalVXbQ79t3E9zdP1zBZXPSiTu8xiugFvIsn
X-Gm-Gg: Acq92OEgy10qCSVb2cUYaNkMlPUsLu+aX0dEdxJrQrq/hW7OQNTfJ01fws5slfZAfqi
	QG46s0HuvTj9kOcm6ACedahde7iHp+mb4/boE7Ggfd2Ls960TlerM4UWKAICRewNJH/SevFMGGz
	+Q4pmgcXzvAcVshZ27wgWJBpRHtT/s9gndKMAMmK8lxHY2WPmeMcoA+xIF3maLn47XyI+7ugAiz
	vtsaZ7UN7AjBmuUQ5sb2e+V4OKmuHoJsEa6ZaX2LCRGnxxmtha5e7Me7wAYVzp+uNExwkkn0hZw
	l+RKHVzyu/XRD1B1ETOK2ZpoJpX0LcmjbMJDbcPjBHF4WHD3MbVJ5FNsvi4OrLOfenUVXd6nEm8
	uu2CPZfg7xuMS0iD5qHhRJIeYcgNQA7WDshzIZMc62QlCfQHrElebBtkFwq/9yezqyriIHE+o8y
	lkIb7o+mTEkkfjGT/USCCtvfPp61NBeLA=
X-Received: by 2002:a05:6830:81ca:b0:7de:649d:f2ab with SMTP id 46e09a7af769-7e5fedd6094mr1424418a34.13.1779426313218;
        Thu, 21 May 2026 22:05:13 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:fb25:8a80:d99d:260b])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606641114sm299619a34.21.2026.05.21.22.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:05:12 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: m.steinmoetzger@gmail.com,
	guojy.bj@gmail.com,
	straube.linux@gmail.com,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: clean up if-else logic in odm_HWConfig.c
Date: Thu, 21 May 2026 23:04:29 -0600
Message-ID: <20260522050429.161273-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Refactored redundant if-else blocks to a cleaner else-if structure in
odm_HWConfig.c and fixed indentation to use tabs as required by the
kernel coding style.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index c88d669cb086..2e47734a0ae9 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -228,18 +228,11 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 		odm_parsing_cfo(dm_odm, pkt_info, phy_sta_rpt->path_cfotail);
 	}
 
-	/*
-	 * UI BSS List signal strength(in percentage), make it good
-	 * looking, from 0~100.
-	 * It is assigned to the BSS List in GetValueFromBeaconOrProbeRsp().
-	 */
-	if (is_cck_rate) {
+	if (is_cck_rate)
 		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
-	} else {
-		if (rf_rx_num != 0) {
-			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
-		}
-	}
+	else if (rf_rx_num != 0)
+		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
+
 }
 
 static void odm_Process_RSSIForDM(
@@ -437,4 +430,3 @@ enum hal_status ODM_ConfigBBWithHeaderFile(
 
 	return HAL_STATUS_SUCCESS;
 }
-
-- 
2.43.0

