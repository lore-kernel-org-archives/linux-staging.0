Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2B2E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759314; cv=none; b=D80epZukYg4hE10IfnaqdUyA69OP589dZL568PKjhnkCfgDeW5gascEJ3DYB0j4r/LJR1jQ/W7REyiXfIESbDrb49rnp8NrDyE4c9VasyNmmeZfzf168TD4A/ybMhOl7zWJMYonvpsDusSkdNVIfb365X2Kczy3gfr115OC0U9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759314; c=relaxed/simple;
	bh=6Lje1Oe5tiFD/uBR8rcOKMPKARBmbur5RpeHpGVRx0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XaUrDjXrJyK73+o1DJ3YGORuTihmYgaPNaB8GpEMR7+uct7USs+1qvkpd93uP6lcoh6SKkBJ/GE5TDP5uSeWZN0/Z+/PW8YuolCLtX7pUNudNLO/RFsdmRZsu2S0/fU/oMGPH+zNFII2kPXcj1ZDYULcWjpqcXDiNEhasXiw1pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xu5hmOZe; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xu5hmOZe"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a41099fa86so3244312e87.2
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759311; x=1778364111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L91F+HtNgEh8lhMPnWj52Yx1VsgGSGP2IcJ+Buh7W0g=;
        b=Xu5hmOZeLvBgiU0DYD54x738Et8Dywpj77xz2yB4xNBK6JE6xrZnFg8plcf+076nW5
         LIBt8dp1Nr/cDFCnZUqTB0Lu1il7IY9+3JQAXnjTxbR/fqLpIqvX5Nm7zhfFUIUkWKnH
         GnYDvYsbr3ZdSj+GkiBJfzH20oVHYNFkbPMWmI/cnkgpzAWqJUtB78M9HENkrLOHsqSx
         qtX+Ixj/emX5Pe+2vys+GT+g4wnKs6sMXgn7182XXgvs6FcLBLmcaxjwGphb++KvGoyD
         Kkw1Bqm+FqJQ1DnR91NzmW+1DxQO+LeZaUleN6Bmo0SneP4whwa+f/95Uiva8JHsYxb6
         QUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759311; x=1778364111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L91F+HtNgEh8lhMPnWj52Yx1VsgGSGP2IcJ+Buh7W0g=;
        b=QDcouGUzYLgrRaxq5EhM5iPfDsJ66IIcwyw6H6hCyenY1madwapli09bzm6NoYVonA
         FLAPe3boKqfgKj2PnSgKU86hsKjmHwoWCXYVF+Gp/GERw4lH3aLnepKYtlOCuz970aB1
         G60or/uQOYQGHl95tuEbFXFL8Irv+yFvfDcqacZfGU7qZbrNgk6xXW29+RgtRZ40XtNX
         +GRYXeOmwwCPpePTnpcnvb2JVicaeLjoOYBdmQKLAthD1xuc6913JNc4JcMiLBAWkj6r
         9QPNz53U3iR4Z8YR4BSXHbRD0MSef2/rujDKnLPQMnv94NMbVP1fS9U28lQzivw43OA/
         FjxA==
X-Gm-Message-State: AOJu0YxPxFyyK2yow1SboONPfoOdWsCPPkqM0HIqQvtDAchc01moSn7F
	8okcOGWAb9IA6u4bSPn/+8slSB6AfwBcUPpG28Cf2TXIxXRPcQ0VaiRr
X-Gm-Gg: AeBDieuDhVqLO1faQoh6DLvcKBSZy1i7cpkmgvSVqofhvNgI464N9xiiUQ2VHIt7BQK
	/k7VABxNvWFKeYLAOu1LlIHSH/1jOKV3Dvwa8qERW8JuBk1imxbJDdDPUtIMdAfbeHf51iyk0HN
	ueEUyyhNZyCs6hiO0RqHdrnViwMgrUlCUgD8/6myfBmsjh2lbGJWj21s6zk8wpH3qQFUscpDyJn
	OdvXuh9tMrY0zJ+tSUmYCOYraOpxfVRFJBN13I6XickLVpDIwuHKMoat2opuMTyWnqeVA0JjVzl
	djFqU1tzEwilcFTY7HC9aYiHyJPwkYdcmqrO8r/E2DJ79BkW/LyBFQY/M/RcUdiR0GpjLC7X0ua
	75To1Fm8IX280ng7fujVCPGeO5Q7fjxB6pJtkpdY9uZ/pqHh3nDhT7FRIwdAkfl09XKBHvAbf+R
	AD4yP2UJupbK0SpIyPLuj/NnkN/6n5gdMoM/s=
X-Received: by 2002:a05:6512:31cb:b0:5a4:9ce:e117 with SMTP id 2adb3069b0e04-5a862eb7ebamr1065031e87.5.1777759311248;
        Sat, 02 May 2026 15:01:51 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:50 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 09/10] staging: rtl8723bs: remove struct hal_version from include/HalVerDef.h
Date: Sun,  3 May 2026 00:55:48 +0300
Message-ID: <20260502220056.59815-10-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502220056.59815-1-nikolayof23@gmail.com>
References: <20260502220056.59815-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the empty 'struct hal_version' as all its fields were removed
earlier and it is no longer needed.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 +------
 drivers/staging/rtl8723bs/include/HalVerDef.h     | 5 -----
 drivers/staging/rtl8723bs/include/hal_data.h      | 1 -
 3 files changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0c422deed545..1512b6b43722 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -825,10 +825,9 @@ void Hal_ReadEFuse(
 		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf);
 }
 
-static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
+static void ReadChipVersion8723B(struct adapter *padapter)
 {
 	u32 value32;
-	struct hal_version ChipVersion;
 	struct hal_com_data *pHalData;
 
 /* YJ, TODO, move read chip type here */
@@ -847,10 +846,6 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 	pHalData->MultiFunc |= ((value32 & BT_FUNC_EN) ? RT_MULTI_FUNC_BT : 0);
 	pHalData->MultiFunc |= ((value32 & GPS_FUNC_EN) ? RT_MULTI_FUNC_GPS : 0);
 	pHalData->PolarityCtl = ((value32 & WL_HWPDN_SL) ? RT_POLARITY_HIGH_ACT : RT_POLARITY_LOW_ACT);
-
-	pHalData->VersionID = ChipVersion;
-
-	return ChipVersion;
 }
 
 void rtl8723b_read_chip_version(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index ed6925872d56..9b607543133f 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -41,10 +41,5 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 	CHIP_VENDOR_SMIC	=	2,
 };
 
-struct hal_version { /* tag_HAL_VERSION */
-};
-
-/* hal_version			VersionID; */
-
 
 #endif
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 20b14e665d99..876b3666aa1c 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -162,7 +162,6 @@ struct dm_priv {
 
 
 struct hal_com_data {
-	struct hal_version VersionID;
 	enum rt_multi_func MultiFunc; /*  For multi-function consideration. */
 	enum rt_polarity_ctl PolarityCtl; /*  For Wifi PDn Polarity control. */
 	enum rt_regulator_mode	RegulatorMode; /*  switching regulator or LDO */
-- 
2.54.0

