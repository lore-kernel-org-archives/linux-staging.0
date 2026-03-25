Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58336390209
	for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 21:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474115; cv=none; b=Jwgs0GojMRZwIu1uCUiXK7bCmfckX8zXaTxWMgA1fpwu17Gbtk6y/ITtcf/GaceYYbNt6Kwld96tCxtWZsXCsrerUFZkLTM/i6MfKNn99S+UkFfX2RiHKZyqCtSGlq1Zt8XeY1vUtwaGLAklBoxB3WJMOm52/SidkVA2N0N8q5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474115; c=relaxed/simple;
	bh=dZn3sIYKjksM96meVTQNN5g1BY1Ruf7AkckoMYg0fGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkEF3fRgz2UzaS6Yrt5gyUr6guODCj6Rolg3voL6miQjMI/6gG2B305iRZjFIc0lWnNgAbUV37+c8Zs1IVBgEJ/SR3+wCj7dnTJtP1069UJCsXXmQXUAwLvGvpkygp6lblvoWo8eVCGkYTaKJlkYfJY/TYsrI7uUHHpKkkCyK6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nfiD2CIq; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nfiD2CIq"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94ac3958788so148971241.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Mar 2026 14:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774474113; x=1775078913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NhH6u8MbNJGpGxJ5nMUQP9i3yhSfD2LDetMrAwhe3b4=;
        b=nfiD2CIqkg5gHDudQSbRubwDOmaYKtmCJmS435n2mMUFjJs9roIP37GXokjv0BfXtR
         Tr53KHyuHPC5FWEmAc2tQDkKh7hWS+AdKinhGveS2Jl5NVydCJLnUvMa550nbmexNVFV
         UclSdhK6a/4++6acor0pYwNkzve26SUqsigb6L0Wb0ZQl6jI+52VT4rsWTIz9adCkeTL
         /OXCC/McMuiHNq80eE5g8ddcPeMk9UJUelhjangZQR7kpLzVolAU9O4gyAK/G3sDot+r
         lw/VGXqY5/d9Q8UY2l4HuMI/uByXNvSbK+bgiiGybNhjZjy5h/a/cTxOnIqw67cOq8TU
         AO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774474113; x=1775078913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NhH6u8MbNJGpGxJ5nMUQP9i3yhSfD2LDetMrAwhe3b4=;
        b=rnjjJGZit9HBFfz9JFdcM7r0yozUD8ZOSGEl/3hTfBFR06oadiDHeHBNnyP6liM5rH
         OC5k6KMGk+B/KXlcZIGflxfU7qyWzlu21q6KKyk0+/Nvae8m2WUhXosZ1GUtnzfjASl4
         P8yKYK+YxWhuygVaJenP9fL3M05OT7D2odtd/wAHOJlxJI1v7qC7GRWN67dZm+1BAk15
         hpr+tSrpqGHjWDltyU0Rq9+9tUmWpXpIvz9GSlVfWX3wNw+a6GOwXRwhh2YLBg+TTYHi
         ZlzirY+ieBPXYPHPHIS49AoXXk4Gws4JN6kmIGei6hyv4i/N45D7ZWrsYfyK4ymJ8XTv
         F7rg==
X-Forwarded-Encrypted: i=1; AJvYcCVip/Hj92MgU1bTaOygflZWxyKxX/8HKyFw2x/t/FdqfmJ3VPyqv+ajtYq2MfVdZQx7h+THcWeoN8yeyZTV@lists.linux.dev
X-Gm-Message-State: AOJu0YyUU0r+0wZUAeSSlP5rz/+g/CDM7b0VjyPc9Rw3RGupkGFKpnv2
	SFFRN8PzK11wWLzAgDJ+r+w2R36QSOwG706Q4jwmsxNo6psUsECZ4jhE
X-Gm-Gg: ATEYQzzfWguspZcrf3nleZloaDP5p89nmNfib3ClwLnudjQxxUjrajPbzNzdewkMt8r
	lNAEdygwl4XTT4xl4GttPA+UAhpXtocJDlreMLeisc6lawMCX/ntQvtIhHdd1ry+nymSt9cnafL
	OtrXA8z8VZXiVXPSMVYCTyi0KxqdqUNxBN2+KdrWMiB11XPY2/V2iLuG3SsrschkWW7BwNAs5ML
	jBf0MWs4uXOeuUoaqpaqQr7aFgfhvIPzoVrAd5/FBHov9O3bfBGaZlb5kWa9tK3ai5jJYP4uzdI
	BFlDAPQv7hKZ3fN4x9Fs8nCPaX50NoD78jd0B6zNahjQ7fgR3acVw9G+WYIVdq1wlCFqRM12NZu
	m1v7Rnh53oaR9K9DeSiCJiczXYOyYXVi0PMCau2v56LmOpX3HheY2fVIa+qdnT2uwLxLuXTGHsj
	WMfZDc/u4mrklOsPln62fdgODpRqm9Wwy1Cy0CW6Ksyq6LQODnUsvtrKEUxGXfZANqA+ve7buow
	y7j/GMr88Ri55rs
X-Received: by 2002:a05:6102:290d:b0:600:3b3e:681a with SMTP id ada2fe7eead31-603161b7da7mr4084461137.14.1774474113222;
        Wed, 25 Mar 2026 14:28:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:6788:b4b3:f9bb:acc1])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be56f28esm1469494241.10.2026.03.25.14.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 14:28:32 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused arg at odm_interface.h
Date: Wed, 25 Mar 2026 18:21:08 -0300
Message-ID: <20260325212826.20309-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header file uses some macros to create proper constants for
ODM_REG and ODM_SET but current macros were not using _ic_type,
leading to a checkpatch warn:

WARNING: Argument '_ic_type' is not used in function-like macro

Remove that arg, currently there is no support for per ic type

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi, all,

While exploring with checkpath found this warn:

drivers/staging/rtl8723bs/hal/odm_interface.h:32: WARNING: Argument '_ic_type' is not used in function-like macro

Looks like original plan was to support multi IC with hal for creating final reg macros, but apparently only 8723
ic is supported and "ic type" (_pDM_Odm) was not used leading to that warn: 

#define _cat(_name, _func) _func##_11N(_name)

#define ODM_REG(_name, _pDM_Odm)	_cat(_name, _pDM_Odm->SupportICType, _reg)
#define ODM_BIT(_name, _pDM_Odm)	_cat(_name, _pDM_Odm->SupportICType, _bit)

This patch is suggesting to remove that arg from macro and its usage.
Tks and regards.
---
 drivers/staging/rtl8723bs/hal/odm.c             |  4 ++--
 drivers/staging/rtl8723bs/hal/odm_CfoTracking.c |  8 ++++----
 drivers/staging/rtl8723bs/hal/odm_DIG.c         |  8 ++++----
 drivers/staging/rtl8723bs/hal/odm_interface.h   | 12 ++++++------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 639b6da2302b..3dffa7620768 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -131,8 +131,8 @@ u8 CCKSwingTable_Ch14_New[CCK_TABLE_SIZE][8] = {
 
 static void odm_CommonInfoSelfInit(struct dm_odm_t *pDM_Odm)
 {
-	pDM_Odm->bCckHighPower = (bool) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(CCK_RPT_FORMAT, pDM_Odm), ODM_BIT(CCK_RPT_FORMAT, pDM_Odm));
-	pDM_Odm->RFPathRxEnable = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(BB_RX_PATH, pDM_Odm), ODM_BIT(BB_RX_PATH, pDM_Odm));
+	pDM_Odm->bCckHighPower = (bool) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(CCK_RPT_FORMAT), ODM_BIT(CCK_RPT_FORMAT));
+	pDM_Odm->RFPathRxEnable = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(BB_RX_PATH), ODM_BIT(BB_RX_PATH));
 
 	pDM_Odm->TxRate = 0xFF;
 }
diff --git a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
index 166af5f6c9e0..0eaedd8f6469 100644
--- a/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
+++ b/drivers/staging/rtl8723bs/hal/odm_CfoTracking.c
@@ -47,8 +47,8 @@ static void odm_SetATCStatus(void *pDM_VOID, bool ATCStatus)
 
 	PHY_SetBBReg(
 		pDM_Odm->Adapter,
-		ODM_REG(BB_ATC, pDM_Odm),
-		ODM_BIT(BB_ATC, pDM_Odm),
+		ODM_REG(BB_ATC),
+		ODM_BIT(BB_ATC),
 		ATCStatus
 	);
 	pCfoTrack->bATCStatus = ATCStatus;
@@ -61,8 +61,8 @@ static bool odm_GetATCStatus(void *pDM_VOID)
 
 	ATCStatus = (bool)PHY_QueryBBReg(
 		pDM_Odm->Adapter,
-		ODM_REG(BB_ATC, pDM_Odm),
-		ODM_BIT(BB_ATC, pDM_Odm)
+		ODM_REG(BB_ATC),
+		ODM_BIT(BB_ATC)
 	);
 	return ATCStatus;
 }
diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 33661182d85a..a31c8368f9d9 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -297,9 +297,9 @@ void ODM_Write_DIG(void *pDM_VOID, u8 CurrentIGI)
 		}
 
 		/* 1 Set IGI value */
-		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
+		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG(IGI_A), ODM_BIT(IGI), CurrentIGI);
 
-		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG(IGI_B, pDM_Odm), ODM_BIT(IGI, pDM_Odm), CurrentIGI);
+		PHY_SetBBReg(pDM_Odm->Adapter, ODM_REG(IGI_B), ODM_BIT(IGI), CurrentIGI);
 
 		pDM_DigTable->CurIGValue = CurrentIGI;
 	}
@@ -336,7 +336,7 @@ void odm_DIGInit(void *pDM_VOID)
 
 	pDM_DigTable->bStopDIG = false;
 	pDM_DigTable->bPSDInProgress = false;
-	pDM_DigTable->CurIGValue = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(IGI_A, pDM_Odm), ODM_BIT(IGI, pDM_Odm));
+	pDM_DigTable->CurIGValue = (u8) PHY_QueryBBReg(pDM_Odm->Adapter, ODM_REG(IGI_A), ODM_BIT(IGI));
 	pDM_DigTable->RssiLowThresh	= DM_DIG_THRESH_LOW;
 	pDM_DigTable->RssiHighThresh	= DM_DIG_THRESH_HIGH;
 	pDM_DigTable->FALowThresh	= DMfalseALARM_THRESH_LOW;
@@ -806,7 +806,7 @@ void ODM_Write_CCK_CCA_Thres(void *pDM_VOID, u8 CurCCK_CCAThres)
 
 	/* modify by Guo.Mingzhi 2012-01-03 */
 	if (pDM_DigTable->CurCCK_CCAThres != CurCCK_CCAThres)
-		rtw_write8(pDM_Odm->Adapter, ODM_REG(CCK_CCA, pDM_Odm), CurCCK_CCAThres);
+		rtw_write8(pDM_Odm->Adapter, ODM_REG(CCK_CCA), CurCCK_CCAThres);
 
 	pDM_DigTable->PreCCK_CCAThres = pDM_DigTable->CurCCK_CCAThres;
 	pDM_DigTable->CurCCK_CCAThres = CurCCK_CCAThres;
diff --git a/drivers/staging/rtl8723bs/hal/odm_interface.h b/drivers/staging/rtl8723bs/hal/odm_interface.h
index d19347b02890..400473ca58ca 100644
--- a/drivers/staging/rtl8723bs/hal/odm_interface.h
+++ b/drivers/staging/rtl8723bs/hal/odm_interface.h
@@ -23,18 +23,18 @@
 #define ODM_REG_DIG_11N		0xC50
 #define ODM_REG_DIG_11AC	0xDDD
 
-ODM_REG(DIG, _pDM_Odm)
+ODM_REG(DIG)
 =====================================*/
 
 #define _reg_11N(_name)			ODM_REG_##_name##_11N
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
 
-#define _cat(_name, _ic_type, _func) _func##_11N(_name)
+#define _cat(_name, _func) _func##_11N(_name)
 
 /*  _name: name of register or bit. */
-/*  Example: "ODM_REG(R_A_AGC_CORE1, pDM_Odm)" */
-/*         gets "ODM_R_A_AGC_CORE1" or "ODM_R_A_AGC_CORE1_8192C", depends on SupportICType. */
-#define ODM_REG(_name, _pDM_Odm)	_cat(_name, _pDM_Odm->SupportICType, _reg)
-#define ODM_BIT(_name, _pDM_Odm)	_cat(_name, _pDM_Odm->SupportICType, _bit)
+/*  Example: "ODM_REG(R_A_AGC_CORE1)" */
+/*         gets "ODM_R_A_AGC_CORE1" or "ODM_R_A_AGC_CORE1_8192C". */
+#define ODM_REG(_name)	_cat(_name, _reg)
+#define ODM_BIT(_name)	_cat(_name, _bit)
 
 #endif	/*  __ODM_INTERFACE_H__ */
-- 
2.48.1

