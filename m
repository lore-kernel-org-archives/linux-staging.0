Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028E2515997
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972071; cv=none; b=VMu32EtAdntkt+1KHftg7uRa+4ulXQo1JJTb4YMFkY+vrpYvCznaCQj2YFm7zHI+gdZe71NWx6JBt+9upM43SVpIgjpDrBYVXJCIBLkQwjeMe3LeuftX3sNXIxN66lnULmkrjSNZZt2lDrRD4gOi6Mc2VFpz89GKfsOruybBlWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972071; c=relaxed/simple;
	bh=CN5nGBmrsvbOonrtdw1ScMbVb9sP4MzWc/1Z2ye22lk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q0ESIb6a/KkAxbzr0dIemGewKWZc8ZEqoZbat8tK1RlnuylvNMAMkEyVXU41pvzbDeYp6/7tZinJoPDiaG5wu/blXBzUnHf3YWp0gyczna0MUG0uaPjw6BvMNoraVtdvAaQcXvVmAZRtLOkcKyHLV+v8FViKbidRnuj6C18WPCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WU1ejWbl; arc=none smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WU1ejWbl"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49dd095da1aso235395fac.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 13:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790972065; x=1791576865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2aR2xZgN+s8FYRaQnu77ab8mjfDTzj3thxudFsAn2s=;
        b=WU1ejWblQ3vqXzUmnQC2Ktn1qEKS4O6TOat7RfGhQ2N23bnkhJBZHQER92cgXADWhU
         bQiiZ49Cq6xeD8kc107HKQZMdhAYyy0XZmt55lI1dSflag+giu/kOYq3h/CRjoBGzif4
         vyDNhYeFeu+wXEloDlqXOQ64LE/DH+7hZUQmgle4knMB+O7hvxO05ydFLSNUSYBWeK0x
         ouUpGYKV4gKE84GTRN45CmGqNUFA1aH7ALBhLQKfOoxyhKY0QDBWAJhrFPO1Z2AhF0CA
         0tQIB4KLwBjMmwyXELVMPnSLri7UqSMayld4dEyeVhdslpfSlAMIYcMIfMXnM8pDu99r
         oowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972065; x=1791576865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2aR2xZgN+s8FYRaQnu77ab8mjfDTzj3thxudFsAn2s=;
        b=t5HkD+cMgUY/FNHF3zH9SIAJJ40WY6/FLZP/RLWjO62wTEhDjdZu8BoNeTjb4YPqp7
         /4rHhGqeP/zZLUcypgIVQfoPIuVKAAD86eavmt3rkpqNzzMoxETuv0RqSHG/hMFe0jRe
         b0Ytn3c2Jp2XTBDFW2dr5kImssk+7fZUisIDqX5kAbVi/3KiDkIIsPpEJTM3Cez9fzIp
         nK8Ra7wn7BBw1KeSY/dicRM+nnNSKPlw8+ceef4Br7+K/KDK8kGvb+pXrNX5tpKxhcCf
         fL3sme4hCL1bT9G+sYZlxaW9waKPoN/uUsMNBQjVTecw/Y2kT3uy017qMw/fmYpg8nmS
         NW2g==
X-Forwarded-Encrypted: i=1; AKwUvByUq/Xq2BbyB05kxSA9uNKG4lnJRhamJ/xQcmRKQ0DX7FWGgEXu5B1iqZhTJyItKjybmRMtzooS1HTuhEJz@lists.linux.dev
X-Gm-Message-State: AFuF++mH/b4SOr7+BYdLsGYd9IfUQw/A/eTNznEYLWiSpjBrpIePVGc5
	Z6NSh1Wm//r9aUsZnMVC0dH8GeSLs4iMrHx/KX9AQOaUZeBdxOE5L+SE
X-Gm-Gg: AYBFou31AZo33wFFwXCJ1fYcaTBdcvfoVJydD9/SrICEdJ6fmrGK/pZjHjUhc54AStX
	hkHTtxQscTkr3CG+qil1auacL+B7aZjNoVU9ipZfqr9GDfgE0XhSq8fWul+XtJMNml1pOjcu5BO
	kZYOrDLg0SiDut6YU6N5QLRYCBA5e2NsBIbI1RhjlDJ1CE1iWme6wVbvy5dNn5Dwg7wDxPR3OKM
	0tmzVvNlj7DX2/IOZUPBY/JaPWtvh2R0RhV7sjVr9vV45iV5vABfU9Llh2f0wC7qDj/1WVIPp1P
	GJpt5HzRBCgpv2upzHhOrb9Ma8kCX+dk1TgclnAY2QfnhoCNATOPBLlMuwkaCfvdft2vSCd0enG
	7+LDtOCh/Yeutwgh4R/2OmpZu73rkFxBwQLjdtQtHZHL6EHH0A3e+zHouJhmvzDFeXfErjYfRzl
	M7jwHk9v7XZI5kUh3QP2MJ9rnEa7Yhwj5RuW0rF6bcjGNMnKDquut7KZ7eirNG+X/QGY6Jiv7za
	So=
X-Received: by 2002:a05:6870:41c2:b0:48f:e25e:e204 with SMTP id 586e51a60fabf-49e15fbcf0emr3300276fac.61.1790972065491;
        Fri, 02 Oct 2026 13:14:25 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16f00b5asm3117969fac.14.2026.10.02.13.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:14:24 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rishik Yechuri <rishik.yechuri.code@gmail.com>,
	Jennifer Guo <guojy.bj@gmail.com>,
	Gabriel Windlin <gawindlin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove unused BoardType field and its parser
Date: Fri,  2 Oct 2026 15:13:53 -0500
Message-ID: <20261002201354.156065-1-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hal_EfuseParseBoardType_8723BS() reads the board option byte from the
efuse and stores bits 5 through 7 in pHalData->BoardType. Nothing in
the driver ever reads pHalData->BoardType, so the value isn't used.

The function also tries to fall back to a default when the efuse byte
is unprogrammed, but the check can never be true:

      BoardType = (hwinfo[...] & 0xE0) >> 5;  /* at most 7 */
      if (BoardType == 0xFF)                  /* never true */

Remove the function, the one place it's called, and the unused
BoardType member of struct hal_com_data. This doesn't change how the
driver behaves.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---

Notes:
    Compile-tested only. I don't have the rtl8723bs hardware.

 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 16 ----------------
 drivers/staging/rtl8723bs/include/hal_data.h |  1 -
 2 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 4a2f5c3bb..26e0ea465 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -933,21 +933,6 @@ static void Hal_EfuseParseMACAddr_8723BS(
 	}
 }
 
-static void Hal_EfuseParseBoardType_8723BS(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
-{
-	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-
-	if (!AutoLoadFail) {
-		pHalData->BoardType = (hwinfo[EEPROM_RF_BOARD_OPTION_8723B] & 0xE0) >> 5;
-		if (pHalData->BoardType == 0xFF)
-			pHalData->BoardType = (EEPROM_DEFAULT_BOARD_OPTION & 0xE0) >> 5;
-	} else {
-		pHalData->BoardType = 0;
-	}
-}
-
 static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
@@ -963,7 +948,6 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	Hal_EfuseParseMACAddr_8723BS(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
 	Hal_EfuseParseTxPowerInfo_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
-	Hal_EfuseParseBoardType_8723BS(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
 	/*  Read Bluetooth co-exist and initialize */
 	Hal_EfuseParsePackageType_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index c345b632b..588dada52 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -186,7 +186,6 @@ struct hal_com_data {
 	u8 TypeALNA;
 	u8 TypeAPA;
 	u8 RFEType;
-	u8 BoardType;
 	bool		bLCKInProgress;
 
 	bool		bSwChnl;
-- 
2.43.0

