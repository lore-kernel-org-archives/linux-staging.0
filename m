Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E893264617
	for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782058588; cv=none; b=Mo0RAmC0nfk2OOIFJqOSFiorwc8Yy2fbrV0lqdn+IfND3tgn6DDByP1FhPpC6e4tRxSrZdPX8iH9b2DIoBqLqRx2vswQu+g5LEs4luLYiyOMRxCDz02Lbcdj9hjWXyLHfSfdPWsTnRXPn55tScUZwNf2/+slf6mG9+uqCPi2HMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782058588; c=relaxed/simple;
	bh=/4SSpP73HPz2Sc+Adb/AN0uZYmI8ikerAA+16nD7ZlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kn6+X9+2fmkTVALe2jhUeSeILdSXEf6lsxlixHl3gDkVUtR+ij9zh9hGYmAPuKEg7RHRXHI8IJbCWzJ5MnqBfpdLlMxlFvZGeTnkvR8+wiaSC1Qe0yGJoSWiQodPnePFOd8xUAc3NxnQz6IuwXAOy02ker0Hu9CNNValdJkCJrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c4TAqCih; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c4TAqCih"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c08922c23ebso382436266b.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Jun 2026 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782058586; x=1782663386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxetDXm71yI4E+IBjAnFo+Cxmw346KS6bcA4FMjZpJU=;
        b=c4TAqCih2/ojHkLPfPcOqJjkhmIbJd2vJejc5rjEko6uBMJ7/BgSC5yY2VlU+//sxv
         FinVRoKpqMf2DNggbEaRZdpVn0+vHHWKJREnL7e21k3+VwkRUNHHd8cCflxSvhNmSM2B
         4Db74PiIgP0o3Oml54FYVctzb4XMuygoVm257sT3ihPFcdT4CxRXTDMDXiQHPuubgDFo
         3JjNMKuDeQj/5hp44TIPijoN73Y6KjFRT5A5ysM+II0ij/hyCCZ7EbWNFWXZGjG/NiJL
         j+d3h+qczM7p8/8Qc1RKN5ltQ7Y0taWP8TSeSV/L557A8rXRWEiW8QPvri7Nd+RwY+j3
         s6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782058586; x=1782663386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pxetDXm71yI4E+IBjAnFo+Cxmw346KS6bcA4FMjZpJU=;
        b=LTUKk6OcqQboOr/Ojl6BxxN1XEXhe1IY7DK9VTvZ12ZlVJa/XCzrGjZXbwCao1U/2S
         vF6ArGogVhCvVMBTNJPHuI/6RhASesQwDDrqlDL3K91OKD6I/6exhJU+vhtGm9fN/n+w
         8UKhhMLjjqURoRAlJKsW5EZVxr/KxSJZ3ukCLaEHSYLX7Ig5P2u1n1gWdrIqMHr6af2D
         8PmdGWSj0d5eCBe0i3NsQAZ3OzRnPQHh34mEKSGz2HEqo56YKk7yq0kBHgt2kJ0g1ARi
         SLIHZ7ulKC52VxzoxyopkOmzao0xMhB3opisFfilDB1Omsp4S7zKSUipDWd/ymrPQ/m5
         IorA==
X-Gm-Message-State: AOJu0YwrvgistSwZC0dX7smGLc4FtCt0Cec1Ue9t8K5gN8TF12uhz5sv
	1xZu2ZdYfpIesZXNkhLWpqf9ddqSkdHr9ev2EDUcowqYWjIr8apVmbRF+2NsvQ==
X-Gm-Gg: AfdE7clqueJRlLAe91ZnTzJdPfPfBykA9po/mV7FV9MqyXI4N61fHdCUJUXFp1oazR9
	qnfwcBsMYe6P64TWGs5Nd9QMuNpQKdFo1hc7LrmITmlRnpIUckbsFpPnckLXlbRerJoViiJtIvD
	QTkiEjxgVP594sEx1Og6x4+o/wwAvAGv14/eLSIEocjuvUfXZSTw4t1V0EAJtnzZibpeO0ub0uU
	50S3R2i1SRyPdj3v1ZkFaT+x8QkfYhBVb33PSbcgr6bc2P7RKen5cE8ihup7OkyT06BLXljphT5
	zV+2An8r+scSLkDwnUompSpIhjGYc6EmOsuLFYfQol2VmALgEH9YQ2OojyWWblC79/9OCp92lf2
	i8f2W+ZFz9n61ZjxRDFJWg80csMbqFP5U7j7vkJjYm13t9TvACpGNzrvZlE05+khj4RSOJjP2y7
	IPWW2jjc67
X-Received: by 2002:a17:907:e84a:b0:be2:208a:a8ae with SMTP id a640c23a62f3a-c0b60602f38mr500387866b.22.1782058585543;
        Sun, 21 Jun 2026 09:16:25 -0700 (PDT)
Received: from archlinux ([93.186.96.10])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60ac92d1sm212968666b.32.2026.06.21.09.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 09:16:25 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: remove local variable 'eRFPath'
Date: Sun, 21 Jun 2026 19:12:29 +0300
Message-ID: <20260621161611.111461-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621161611.111461-1-nikolayof23@gmail.com>
References: <20260621161611.111461-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After removing the loop from the phy_RF6052_Config_ParaFile() function,
the value of this variable can no longer be changed, allowing all
switch-case statements to be known in advance, since it stores the value
0 (which is 'RF_PATH_A', defined in enum rf_path).

Therefore, remove it and the associated dead code and access 'RF_PATH_A'
directly.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   | 29 +++----------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
index 86759516838b..fac1270853de 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_rf6052.c
@@ -81,7 +81,6 @@ void PHY_RF6052SetBandwidth8723B(
 static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 {
 	u32 u4RegValue = 0;
-	u8 eRFPath = 0;
 	struct bb_register_def *pPhyReg;
 	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
 
@@ -89,17 +88,10 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	/* 3 <2> Initialize RF */
 	/* 3----------------------------------------------------------------- */
 
-	pPhyReg = &pHalData->PHYRegDef[eRFPath];
+	pPhyReg = &pHalData->PHYRegDef[RF_PATH_A];
 
 	/*----Store original RFENV control type----*/
-	switch (eRFPath) {
-	case RF_PATH_A:
-		u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
-		break;
-	case RF_PATH_B:
-		u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV << 16);
-		break;
-	}
+	u4RegValue = PHY_QueryBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV);
 
 	/*----Set RF_ENV enable----*/
 	PHY_SetBBReg(Adapter, pPhyReg->rfintfe, bRFSI_RFENV << 16, 0x1);
@@ -117,23 +109,10 @@ static int phy_RF6052_Config_ParaFile(struct adapter *Adapter)
 	udelay(1);/* PlatformStallExecution(1); */
 
 	/*----Initialize RF fom connfiguration file----*/
-	switch (eRFPath) {
-	case RF_PATH_A:
-	case RF_PATH_B:
-		ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv,
-					   CONFIG_RF_RADIO, eRFPath);
-		break;
-	}
+	ODM_ConfigRFWithHeaderFile(&pHalData->odmpriv, CONFIG_RF_RADIO, RF_PATH_A);
 
 	/*----Restore RFENV control type----*/
-	switch (eRFPath) {
-	case RF_PATH_A:
-		PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
-		break;
-	case RF_PATH_B:
-		PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV << 16, u4RegValue);
-		break;
-	}
+	PHY_SetBBReg(Adapter, pPhyReg->rfintfs, bRFSI_RFENV, u4RegValue);
 
 	/* 3 ----------------------------------------------------------------- */
 	/* 3 Configuration of Tx Power Tracking */
-- 
2.54.0

