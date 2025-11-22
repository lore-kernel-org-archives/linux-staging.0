Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70661A2C25
	for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 17:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763833581; cv=none; b=iIcDS73b+myg1hwLcXvq1JaKxz8AEbBYcBghAsZHeQaAjnKfYDJOnn4VxcpUyidB+l9p6YTOb5VQfGDAYfS56WbXBTStj1bTteogi9Mtwc1llQORb79RlCRuh2qXm0IRMXFyOPa/ac+8MoinbQHrwOR/2XUnhTwLxiqmtfFTDp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763833581; c=relaxed/simple;
	bh=6U6zn8+LpcBNlZyzgRWtGMFyLk9wbZ1aFFGsqHh59Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNW13vDZxpe/6f7inqIOvOMGtO1RNPGR3SKEBJxI4k4Vli8vlezsI/ndcY0VqgnygBX2fcZQzVB/3QT+RpMzJvfJRivaJsP7dfG6PFTwIa7wKR/wgLH4RBGRpm1i0PlbWlMTEAM3ER70N5a8mVLik2KL5SSNGUPjBvx2JM8gTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwbluxEn; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwbluxEn"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29586626fbeso36982955ad.0
        for <linux-staging@lists.linux.dev>; Sat, 22 Nov 2025 09:46:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763833579; x=1764438379; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa0h2uHJeQY0DB1LF7p4Wl15nDJY+pGqzxFiQEBxkRc=;
        b=OwbluxEnnaQ2ZxyPy8nNo3TOWyvTc/aeOaySIXQXVpTEb0UghyE6n5HmogWhcpKtJf
         DEgZNtR0BIE597/1qxsWWWcymArqmkOzbdjPXDTPqX+rCT/XqzEzztE6O3sIsD9LEx2e
         dvlt4kAYG9n4tVlIW20E2WlMOE1I5Ns3kTbgIw+rCuxm47OxhehxuSWMWMIXkdIwiIDE
         7fej3jAepIoLuR8rvraYzin6o79syciR13PcSYrHa9BEl2qTkJuqRvAL6kwBOMTWdtny
         R+qunT9jgG8GbfPRns1NEHQbJ0+++ZGQi6hy2dJMwssq9kwru1WuZVTzbMASty6RtNJn
         CjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763833579; x=1764438379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qa0h2uHJeQY0DB1LF7p4Wl15nDJY+pGqzxFiQEBxkRc=;
        b=I+4+rJ//tQo69xO+t/y+8AeuE7SDU+WDOzlBM4zFx2xgZGe4Ijzkru0BvAcroMeX24
         LITuv7ZQhxDSIkCInKvyLnsSkYBZxELOwogI46BGTw7EieViMm65oOAc15+vpmCz+let
         xIxf2SS1Luomr+gcSqvVFP0qrNS/A7+Ssj3bbU8rgUUUf49CXy3jLPtZVkUVkCa43/Xe
         PDJ4/U8/t7rbY/JGauSoAG9L9GR10WRmyFY6oOtLok5d49nEUTaJO21wg0xtu+Ewvaho
         GhUlt+jrtlLtYjFVdXM57mmUJco6zhREDu0kUZ/AyZCI/K4eZH0FzfXzjytaj5vvYCNE
         TlSA==
X-Gm-Message-State: AOJu0YxeU6oPvez/1HLf4XnWgb+kiSPbtXOpHKjIZm/BuerTYgwGw7al
	nxvvUBI90wPXKxZmUWkmV1wbmbn2verZeFhBs7GhDwK1pkiFyzkA5Lpr0lWfLru5HDVJ2M23
X-Gm-Gg: ASbGnctoicB+bTAtTUr+hI5wKnjALEwnx7zlj6HkAkKLNq8yqGaLLaNOYEXiFItdrD2
	Hrb3axb/VRnXKy5qb8tN0tOImr5jM6lvO+xVPDn7ofvNHFpN9Ri14H762TItWhdB2EhxmegrISe
	F0d1KM6DqOZGBL+hTRarZWqSGqfH/oGz74dUfp5t4ZbxpGDVfO+A7I7kIod3VBecGz/v6zBDd4v
	yNQ3OEuIwG0MwWhMY06W+0K4yecpmDO+0aH4CnUeZSUfFUMnW6pgxajc0rt0m0VzC7b8ukcFtML
	7kOV7vRCM3JIcOyVStTJphemyETH6qAXUmJOhr1sFG9pZeeI0ehpfO94HzgDPYMNT9BgGzLVDAK
	3/aReveFvDMsdcpycxDSZoqXbSn40KxGFFclJYxITrCQnJnUyNiPZd9ug0C30Xy0HSggQUkG5KT
	29uTHkQNPyF4jpH4xJ+4M6MejWE41o1jDnavYC9xH2n42z7xqdsEA+TwyT8oFpgyUpJ5VzkEuQ1
	ds8fWgY7jEC0l0WjSI=
X-Google-Smtp-Source: AGHT+IFI6BHlSRJPb6djH9faRMpeNwxW2jzBbOSapl1YN8zD/cV2V7nYzL7LU/FZpRbLbC/OSm0kIA==
X-Received: by 2002:a17:903:298e:b0:295:7423:4bf5 with SMTP id d9443c01a7336-29b6be8c096mr58183185ad.9.1763833578783;
        Sat, 22 Nov 2025 09:46:18 -0800 (PST)
Received: from CyberKunju.localdomain ([103.92.100.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13a80csm90186085ad.35.2025.11.22.09.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 09:46:18 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH 4/5] staging: rtl8723bs: remove dead code from odm.c
Date: Sat, 22 Nov 2025 17:45:54 +0000
Message-ID: <20251122174555.215109-5-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251122174555.215109-1-knavaneeth786@gmail.com>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented-out code references to RTL8723A and RTL8188E which
are not supported by this driver. This cleans up the source file and
improves readability.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 4b36af47f680..08ed38b2a563 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -610,10 +610,6 @@ void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 	/* NeilChen--2012--08--24-- */
 	/* Fix Leave LPS issue */
 	if ((adapter_to_pwrctl(pDM_Odm->Adapter)->pwr_mode != PS_MODE_ACTIVE) /*  in LPS mode */
-		/*  */
-		/* (pDM_Odm->SupportICType & (ODM_RTL8723A))|| */
-		/* (pDM_Odm->SupportICType & (ODM_RTL8188E) &&(&&(((pDM_Odm->SupportInterface  == ODM_ITRF_SDIO))) */
-		/*  */
 	) {
 			odm_DIGbyRSSI_LPS(pDM_Odm);
 	} else
-- 
2.43.0

