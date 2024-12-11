Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689351F37D3
	for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 23:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733960102; cv=none; b=WelBKP24ryIU2yJjFWbbs+IudkJ/bZJ4BNG00+lIPBFYeOYRhh/diLbV/cb1+4MgZvbrOB8zl+NXI+4j5mTRlNV/Ky9x4ApkVCcUetoxpcayDO98WvWkHgWiDazVzY2dZ+cc9nwSNyeHhK+QjB4U8jYkwgBaaNUkIsFon2eD75o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733960102; c=relaxed/simple;
	bh=rnQKE1RTYE2iSp7z3LJOQTY1avxrZxMWdJEvkL0s4RA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DQFLgOmqdJhV9YKNvOmb3lUJr9L6spZJIH2yYWGM2RffxCdyRPTdwtmz8zR1fwWGy3L+sfUCFiFr5L4A4kEPb17t2zqZuyNE8RYV1c3p/GjJvJA1/n5DSnKnfJWyZwh25FplTuiyRt7vlYFqbdIfyxNiHKn1WlPb+mYMMf+Ns1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNmzy5tu; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNmzy5tu"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cf3e36a76so170045ad.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Dec 2024 15:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733960101; x=1734564901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2J0kh/C+Q2Vqlr3kPJfElERrbZFRIeOwOwK3EB/PmQ=;
        b=lNmzy5tu5g6svbRasQQ8IEqu9Ba1EVp0sIZWceP1LBdYri7VgjrmlPlKR+JP2Yf64S
         PSHEsc2Vl32WHpgk/s2gXxex4n1B9IPeGW8IYNGvu2Dy+W60L9fd1z0LmPUfes4h67Sw
         lM7vHZT3oZg0/pOs+p0W9VImjXY2ebQFRlDRzPe627GRBhPWhW4xHPH0zIC3RYyE6ffE
         zUbZSrFmdmKLeNgLInMVocLjYGaDRGPkxSrOJqgcG+dMU4wKg68vUDFQGQmNxKeys5jC
         1CwfnHR0j7s0pScdgE4rMHFB4AMK0pjkSNgWJTqWoJPv9Dn6cxHnNNtqG7h8gj0lhcJn
         Kb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733960101; x=1734564901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2J0kh/C+Q2Vqlr3kPJfElERrbZFRIeOwOwK3EB/PmQ=;
        b=KwWaFbJHSokPEUWq9b0FG8UrT1lIJgIBW0CirGY9OFU0s+g2Gs/gZYNt6mL0oaPXAW
         w77OVahOdaO/QoGPXH12/OU112fUMjNMgEsVQsLrHwF0TsvmoDqKI6Vve5SyKMrtEijy
         5LFAm0gAsGbLCZ1WgQc/3dg0HAY5cISV+e5IWQiAKwa6c0muqijPHW9nWnKfjQIQZ8Ky
         v217MvtYrORWkHjKw/XBk/o2R8GRFcoPe1BSGNSRQvib8N/h7YmTrl3P53Rz0B9KhDwz
         EXhca/BDb2w+RhG+jahwGLmOEK1QMy4oG/iN3phXa0fpb7ux1K9c057sELNwGi8RqjMX
         UXNA==
X-Forwarded-Encrypted: i=1; AJvYcCX0n5D8raVmNbu27plF+zuzvWWUZ/KT0foKcZP3nhtgBiZ2YdoqRRIa6tC2xSWwaluyEVJ7BaFCz/OC0XpD@lists.linux.dev
X-Gm-Message-State: AOJu0YyPIk6i4oKQ5RFCz8PTFPop+qBEX4FPejyNQpC1DWDig0tdMll8
	TO5nRvzCgcnF0I8zFDhwGuQwzr13IW/3y9NZYsd3i2U1ou3ZkJUf
X-Gm-Gg: ASbGncs28tR/Wxhi2McXek+yrnumI5UdS2btrc1hHYsRuadzAtfZCS0cl/gc5H7i7q+
	LzuEkywZHbOGcENTNH2jMXBCjI5/8gmss9SAXCovANsBO8Vz/8X79C/0yXt0V0rYJY2IUbdG1fr
	yamAE5vQIgF97/RMLPL0f8gFycqLMEXR4r15BC3yyiRPtmFLvFr2WrGTXypL6VgVwIZAV3VigqI
	aLDMim++DYAvai3EWmm0MLdFwZFVpghB5oGjHAdY1koM8gguI+hQ2hkHRC6cO16GwzBOZ25zTfS
	UYOt
X-Google-Smtp-Source: AGHT+IFnc82dqozPBaLWZCaqdNgLRXLt2WJ+FjtNGOWGP+BFdNpaCkKzoL8v5JfEpNyLeMM9x2HLFA==
X-Received: by 2002:a17:90b:4c48:b0:2ee:d024:e4e2 with SMTP id 98e67ed59e1d1-2f127f565bbmr7814542a91.7.1733960100523;
        Wed, 11 Dec 2024 15:35:00 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef8a933fdbsm9229485a91.41.2024.12.11.15.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 15:35:00 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] staging: rtl8723bs: delete HAL_DEF_DBG_RX_INFO_DUMP enum and caller
Date: Wed, 11 Dec 2024 20:26:40 -0300
Message-ID: <20241211233415.37702-3-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241211233415.37702-1-rodrigo.gobbi.7@gmail.com>
References: <20241211233415.37702-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing code isolated by DBG_RX_SIGNAL_DISPLAY_RAW_DATA cflag,
HAL_DEF_DBG_RX_INFO_DUMP enum lost it's use. Removing the enum
and the caller.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 1 -
 drivers/staging/rtl8723bs/hal/hal_com.c       | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h  | 1 -
 3 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 317f3db19397..952ce6dd5af9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4959,7 +4959,6 @@ void _linked_info_dump(struct adapter *padapter)
 					rtw_hal_get_def_var(padapter, HW_DEF_RA_INFO_DUMP, &i);
 			}
 		}
-		rtw_hal_set_def_var(padapter, HAL_DEF_DBG_RX_INFO_DUMP, NULL);
 	}
 }
 
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 1803c0cd3a7e..b41ec89932af 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -682,8 +682,6 @@ u8 SetHalDefVar(
 	u8 bResult = _SUCCESS;
 
 	switch (variable) {
-	case HAL_DEF_DBG_RX_INFO_DUMP:
-		break;
 	case HW_DEF_ODM_DBG_FLAG:
 		ODM_CmnInfoUpdate(odm, ODM_CMNINFO_DBG_COMP, *((u64 *)value));
 		break;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 282e141616b0..85de862823c2 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -144,7 +144,6 @@ enum hal_def_variable {
 	HAL_DEF_PCI_AMD_L1_SUPPORT,
 	HAL_DEF_PCI_ASPM_OSC, /*  Support for ASPM OSC, added by Roger, 2013.03.27. */
 	HAL_DEF_MACID_SLEEP, /*  Support for MACID sleep */
-	HAL_DEF_DBG_RX_INFO_DUMP,
 };
 
 enum hal_odm_variable {
-- 
2.47.0

