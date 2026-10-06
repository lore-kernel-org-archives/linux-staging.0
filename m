Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522D36D4F1
	for <linux-staging@lists.linux.dev>; Tue,  6 Oct 2026 20:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317297; cv=none; b=LQGSX4AYrA2fi2+ycJdaVzv0kGOzG5cmsaEsAhKpzGkuSLcVBi0Vl6L6VBH5imK/KVSC9u77EWjfSADGeksdJAi060OTbJpkw1ym21FA/iCE3TboveMNkTvAB5bpHrmnCUQzYvInhVMqP2vrTPM+ixPsXUSr9IpDccUtzIeBOtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317297; c=relaxed/simple;
	bh=7i4MfBif1YBMwW4P4YcIx42H2opYlr9PUCuKE67zzF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oj5bu7JWeWh0oaYyDTyO5PTmegEfIhdOnfnfEFrjxDkPuYjXR2nZPwC993gs2nLn26fbn9f2HrqSx3dGR09g+m44a/JIv+BRY0yMOjvvV2rffXR7S/m20TDdDscVVnWYmm+xJxOV7Gisfckn//RQ/NIFdBl/2vFapJTGhpoKVzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPsIATHk; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPsIATHk"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-15dd124bbe7so1905079c88.1
        for <linux-staging@lists.linux.dev>; Tue, 06 Oct 2026 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317295; x=1791922095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRFnytrAolaXx0R4qG3nHnA0DMDOLQyqllwW7qfiF5s=;
        b=EPsIATHktNC4AhQpRTeXaMzTB2/gRCXxvECL9ClB/TJKIwFj2MHTxBp4S69IrPYiHC
         wsWMwRvvCE5dQLYI0EqA5dgJ+cJNp2Yw2p7pn5Fk04hHGc+TjbBBNKWYzYGr2y14SRrd
         LQ7gU1tmHsajZkCSkGsVAn1wMn4CTML9V9I2PF0UPJ3gQz72jlmGaA6tBF2vG4EiM5/O
         vM6nMgY63oTjfEVvekGls3hpjLLI2qDbyH29ZGIzEET/E0N0k7mWPhDf0gX0MQv21ikM
         Lp64bIztll1uxYjg6K2bsuxPMYQgH1O7FOJvZQN36nSEY2LJU5m+Hhbr9OvAW8ldzKX0
         UfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317295; x=1791922095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRFnytrAolaXx0R4qG3nHnA0DMDOLQyqllwW7qfiF5s=;
        b=fLGFphWg/iI8/+xLVQOMaIAKO1R/IxBPfvazg7eWIJJyHnOZ9dgZmnKSPR61kVbhxS
         ev50JPRg7eKvOHl1qmFuH1Zgy1otfnyTEWU5waLysdZo3CtYu5JtjG0uhrSGDvUnvF/0
         PkKgHVUL8F3FJu7KtHoYb6r7aTpwT0LjwffyZUVztXmP/XcHYwnfxONP4glJC2v7SgNM
         /ey498outDwlubc6LwwJvCcLeIIyGfc+eCQjd1PLBkxgikzyoiJwwmZKhxJ4p7qsvAG2
         I0C7EbXE6jrQX1ZEeEjdu7UFOVmskAwcFNyhid+LMYNQ16YLtVkBkH05XLT/upZTXvSD
         BMlg==
X-Gm-Message-State: AFuF++kth0ywdpmTSGKS3gt4D7+RlPNPEvzbVRCH3xo17O24HCBtbx+8
	ywj9DEC/Bhgnx+ECgJc2lVcPdZbsJGaRlOir2Uvu0AGOzwzv4PoDf+Sr
X-Gm-Gg: AYBFou2sgVVNSK+fBFrih2rFFtyzvObfx0YQ7pqI22V7INHVd7ACQzR2TKrqWbrVq8A
	bAsZ1uuNUwfyKTX+5r7GlLc8vdRR6WTEHvcdKTLPMkgCHOTCma4yQrg6h5mAj++TPr38wDUMBPX
	6CS28zYvke4Ubgr9WpOaxQR8GdmA9IUemj5RbfzOJJd7NzVY1X55dsHjiJswFzu25Y0SE71eAfk
	Qwm+nOQzY5Vc8Hof28vyNGpysSNYbHtpqAi14t6h/F0ITC/tAKUzH88y0xIyj/VJb5XkAt2YIOa
	YsBFOn+/zxQDjwCFhBpACCiAOdzNXCKooLYV/J889Tycfx3fLtXp5K2M1tJvuQCIoKWmNT+C49p
	6Ac6+qfO0+C0V/2GD+D3YVQPiih8vN46z/ogRHJV/kuyY6nxXe5mgc+EvKj1ao6PWj7oCcAxYiq
	ZFvG2RnlO+GpZkkxjr1C0SZBPcZUp+cC04pMHBLtvZtM2wrIMP9lx/0SC8xQCh3atK0Bhx1/bBX
	g==
X-Received: by 2002:a05:701b:4544:20b0:156:1d8:7026 with SMTP id a92af1059eb24-15ece6d34c6mr2813983c88.46.1791317294962;
        Tue, 06 Oct 2026 13:08:14 -0700 (PDT)
Received: from host ([103.103.208.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm804946c88.11.2026.10.06.13.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:08:14 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: replace uint with u32 in hal_intf.[ch]
Date: Wed,  7 Oct 2026 01:37:50 +0530
Message-ID: <20261006200751.819332-2-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
References: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The non-standard 'uint' type was used for the return values of
rtw_hal_init() and rtw_hal_deinit(), as well as their internal
'status' variables.

Since the underlying hardware-specific functions
(rtl8723bs_hal_init() and rtl8723bs_hal_deinit()) explicitly
return u32, replace these 'uint' occurrences with 'u32' to match
the underlying types and conform to the kernel coding style.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 8 ++++----
 drivers/staging/rtl8723bs/include/hal_intf.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1369..1290631a2158 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -27,9 +27,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	rtw_setopmode_cmd(padapter, networkType, false);
 }
 
-uint rtw_hal_init(struct adapter *padapter)
+u32 rtw_hal_init(struct adapter *padapter)
 {
-	uint status;
+	u32 status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_init(padapter);
@@ -54,9 +54,9 @@ uint rtw_hal_init(struct adapter *padapter)
 	return status;
 }
 
-uint rtw_hal_deinit(struct adapter *padapter)
+u32 rtw_hal_deinit(struct adapter *padapter)
 {
-	uint status = _SUCCESS;
+	u32 status = _SUCCESS;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_deinit(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b63116525ca..ff2a9982a102 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -175,8 +175,8 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-uint rtw_hal_init(struct adapter *padapter);
-uint rtw_hal_deinit(struct adapter *padapter);
+u32 rtw_hal_init(struct adapter *padapter);
+u32 rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
-- 
2.55.0

