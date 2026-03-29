Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFB12DCF58
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 08:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774771655; cv=none; b=jwgbfnMTxIFgZEB/4KImyiC3Wg/ZlaSHblquWXjpRgOf+swayRow3FidwUGyZQSuLTAxT3XQDBZPWUUzvX6xD/whnCxu1J3iPLUlY+HNRM+8sjSFx3/I5ck3Y3lob2C8IEtz8tX841F310zW+T11X2gcaIxIKAMSWJLziVp554k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774771655; c=relaxed/simple;
	bh=41MxnGx/gKk5k+CXjfVjoNLDIitgh6RVsJaoFQdJetY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WRoHcS2nBPcmwNSY4iik3OROi9NltEMwsmUcNLGE8w2UKE2qkbQA8DMa1H7kQ7Gjh3JSaXU48a47LGXyJJDTrSJKRv269Nvx6OqjAon+jr80umqK+4C2M7J7yix6QsvfGEaZ3Bx9t+ynczMt8ZTVI1thjhm3dzsl+YYRs6V17XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYcweBp6; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYcweBp6"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-829afe24fb5so2473020b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 01:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774771654; x=1775376454; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/0dTY2zxmA8OZPYnXYTgEM+JQDaZKRJPZ5LKTJIte8=;
        b=ZYcweBp6T0B6hKJJXzW9RdBS3UXQfWzF7FRZBo2+Xj8Yor0oi/jl8+2NA6pjkD3Akl
         Ihd3TObMOl88oV7tVTez4svMhkW+ufP8QScoifPycXWP3a4BBC4O55JT0Bz4DkRrMnjE
         Yrw+BKvG9FjQz1lDBhPrhpUXgXwvcGaK4D6UvVwhhncuzYByuRmuUZ5cRzd7SBfvExMg
         XTUsdd4h1G/Fl14LPn/A+AgrPazZrG7Jsr5MagSO4szXVqbDLaZc06xM/VhIuy2CCHcs
         xQyxK3JN7hvDL7mKdyev0qScuVwBMEfe0ME9GQdd8NcKZR5Bzko9Q4wJHc2y90MuBAxM
         LTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774771654; x=1775376454;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/0dTY2zxmA8OZPYnXYTgEM+JQDaZKRJPZ5LKTJIte8=;
        b=U0mmEX8/490LFtFjDhidSHZH50dBylkOXD4SC1XE0vEJosVOJlT+sHN6ImzDlzrpjJ
         65XXmiiXgfjOBWTCtfmK96RMWYJKJz4eTaO91HCZfgYdcmzCj+yJpOC+I2NX/XlZvJ2C
         LNy4Yt4PTRDzrcWwI/OhgeYBhN+jHTVFHyssJn7ZnOqeUwzOLnEVZH555zDwjLrcGdc/
         20kQ175HPjaTziP2blGba/fBEogh97Dp8EEDwHVD5VduhQGTq3ytSdBimikoHPAtFi78
         SyAZIV+k5k2Muh9Z4cd5waqHXD07gkXUbfoHieuzVPzyjoxzh7KZJg1BPlBFdDpW9CVB
         FaNQ==
X-Gm-Message-State: AOJu0YxXBPaD7zlbAWzzwq8tVMHwCD4v0mCjSM1XgJ2UqMc7HUQ54agC
	FXBfHEf8VGwBbSvdagULud/RyOMFlNankUx1OPml2BWv7bf81c6urcaL
X-Gm-Gg: ATEYQzxaW03AOQoCZal76dEZmyPEj4iBJ6g8jda2kbLCAhNoaXeLYw3eiscFqg0NJrq
	/6on9zpTp9eCOw9Mjy9hnKk7amEFzA06T4j1Zxw6/KiyuhFAYjR/fyi6C7DFBGecY5i2PBLUH5L
	Jd0TieJSI3ci9GhrHnD77y4zHzXHlFWmdiBc9kBfNlnam85Cctm1WKTvRqfPHr+t096r3Dx5hfK
	BXfmRAnB/s1BeXgQrBKS3CLiYQCLMO01ZKcKFATJzyU6L+DxaDcxRy6oDlLYvijUfeyR1Vq/C74
	wEKZktDmVd0EFUwzUYFFUqOvD8l0HZ079p/XjAtHDpGbj9BKVjSczvMgP/6v7Fbc939B2wnrAwH
	+QAnx1/Sy1Yu62/Rk4Vv8eH0uLBULFr4us3GMEM5SLCc9O6oq/PY29nBxoVljXD515adp6jjXmZ
	wyXXGLjM2J3ubA7AKh/DUKdzcBzUXSI2eZVkMKolKQ3rI4zRkpB9bikN0=
X-Received: by 2002:a05:6a00:b486:b0:82a:7aa3:a2db with SMTP id d2e1a72fcca58-82c95ee4bd1mr8209314b3a.35.1774771653810;
        Sun, 29 Mar 2026 01:07:33 -0700 (PDT)
Received: from gamin8ing ([117.99.84.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm3874919b3a.50.2026.03.29.01.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 01:07:33 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:37:29 +0530
From: Bhavya Gupta <anim8tor.ing@gmail.com>
To: gregkh@linuxfoundation.org, ethantidmore06@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rename camelCase variable
Message-ID: <acjdwatHpEkfBiXT@gamin8ing>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename the "pIE" variable to "ie" to comply with the linux kernel coding
style.

This fixes the following checkpatch.pl warnings:
	CHECK: Avoid CamelCase: <pIE>

Signed-off-by: Bhavya Gupta <anim8tor.ing@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4cdcdddf6b33..4b4012411011 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1364,20 +1364,20 @@ static void update_bcn_erpinfo_ie(struct adapter *padapter)
 		       &len,
 		       (pnetwork->ie_length - _BEACON_IE_OFFSET_));
 	if (p && len > 0) {
-		struct ndis_80211_var_ie *pIE = (struct ndis_80211_var_ie *)p;
+		struct ndis_80211_var_ie *ie = (struct ndis_80211_var_ie *)p;
 
 		if (pmlmepriv->num_sta_non_erp == 1)
-			pIE->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
+			ie->data[0] |= RTW_ERP_INFO_NON_ERP_PRESENT | RTW_ERP_INFO_USE_PROTECTION;
 		else
-			pIE->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
+			ie->data[0] &= ~(RTW_ERP_INFO_NON_ERP_PRESENT |
 					  RTW_ERP_INFO_USE_PROTECTION);
 
 		if (pmlmepriv->num_sta_no_short_preamble > 0)
-			pIE->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
+			ie->data[0] |= RTW_ERP_INFO_BARKER_PREAMBLE_MODE;
 		else
-			pIE->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
+			ie->data[0] &= ~(RTW_ERP_INFO_BARKER_PREAMBLE_MODE);
 
-		ERP_IE_handler(padapter, pIE);
+		ERP_IE_handler(padapter, ie);
 	}
 }
 
-- 
2.53.0

