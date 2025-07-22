Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E0F2DCC02
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 07:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170092; cv=none; b=Wp9QN2vONPrxUnjZvpsMr3KEl4RDT+JJtIMJxpijl2aDGOqgRi2nPIDuE9oIjR7rM61oHAzWU7MnrBsohO6JzkuFQ1LiJnRdeHTSfvWF6gdjDsTQSKUv+jlGLIziD573SW5iXJzxD02ajhyDGtoZJ6T2PpCXgezPi1TzSZMci8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170092; c=relaxed/simple;
	bh=SyYOr2zV6XxG5xIVDOSbyAo9C7BbNCREXuZ/bamKzU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p78NW22eQitJ+jM1JyVfKhfvRDs02VnQr1HOpbIxaya4qCP5jcLC70nWreW8S1bCyRcphq5Az7rYaaxpQl/W4cuz6kyC8BGvO+2TVCzgHbCxkdb56xLwVA0feWc8EQ+jl68gFaZ1FEWh12YHZSy7VqCr0+LdWp02mzIl12+boLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+6A0VrV; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+6A0VrV"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae35f36da9dso1020604366b.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753170088; x=1753774888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGU8KfFDM4IZZr2GDAlyAqDQq8y18Wqb22CKVd1xvY8=;
        b=W+6A0VrV1g/d85rFTC19DjsmYDHbftpReW3iY5tN7fuNtGVBNLLRZ+48ipXzn+6myj
         J8k2IAP+Jkj+7Bbnc+bTxw12Wc8IXWnjfWxzY3yxwvI2MMvn33jDfGmGwLmv6yZ80ZU9
         dGpUkoGj2MPXJXsUKLGdR8fn55giV6lUPbV5UvUnSjDLcmfaHXK64wqxlbQdypch3mNT
         TTfcXiJ34oYcDTDQVLL6NxaNzLbqwCEt7OfbWtmaVX6fn3DRxdIXVh2KYfAnI+sJIAoD
         CRgpEj2CqCUlNqsX6u1hEC1m4mZOftfMToiGTvpSAFLjJlolIoTuoLwAt/Jx7G3OI/pp
         DOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170088; x=1753774888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lGU8KfFDM4IZZr2GDAlyAqDQq8y18Wqb22CKVd1xvY8=;
        b=TKz6HIJek5z33HQZa1QBM+BVnMLBZMlnNKNBbBkjdXu97y6H01vUVD6TECrId5mJIf
         RKAHHjMDGMGwgl7rC7CzoVHHtQmfzV7zKsK00XYfuAVNS/hmQ1JH5W5C7xbu1bR7usQz
         eGSe2En89NW6dflmIUARpLZqXeZHBG4bBulA353LKg7B/SPp6qwNwSO7ePTKClZuegGF
         pTcDlg6tfBBMHFlimuPr8kzE1c2kjkvLrC9EiuceO4Ru8uyp+JhcmYwkWQUAiEMtrYez
         AkQ0LJckpuSICGFqPhHEWsPT69bW5h9ty1iq2FwAru+wLgTOYj2caTjED+1CZ9xBbOJ0
         OG/A==
X-Forwarded-Encrypted: i=1; AJvYcCVhyLT5zUxDBkDv1MtEJQ7l56sw1YFBkLxTUeFfRTBNW0I3N44d5sBS1bH3feaq7sIKW7FnnTZ+IZKXa9c3@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo/1/Q8Ia2N0XLWGHL1DUJRCyIuW95bJYrBYNm+kCTdTxDxd6d
	fbAD43yB9MdAv8w1a//rlFwGp+fUjfxvUQmAgwsZoONrpwjTHcFtGZ/8
X-Gm-Gg: ASbGncvAybxa0QWHxb1hiuuUo7gCPTKBSGbLyAdGnvRQLf+CIitQtaier8nESMnR1SK
	i/I+2qXMrAU+l5hzki0VE32cPwN3uoPnvFWs3UNh0dExfBI2Fo0K8q3svEqx/+wl+UXNDGlVsT1
	w0GrRZkBvTJV2O3TDleKpBa5mJLplf7AcwFYJkYPHWtcIvcp/srOEGpfY3DWbJ6Gz718tyHcX5L
	ZC2EuOQIkvNGrOHzqHJDBZkjv2UpL19ffXBsO0NmXiM9gXexu7b+eboKytVLdgOEDuYrz5stMTP
	+i3X9HbyNEDDKXSxj2F4w0Fxe2zbT44tJ+gNLmNJQEuhIhaJIkqnExVX7oa5gncBBuFwHMmd4qg
	lf1Twgr7JirB/79Y7iXHByzg=
X-Google-Smtp-Source: AGHT+IGDSya8s9ywgwmIycnqxfqEdjtBFsT7b2LHbPorWjslOCCpbtsVDGoOXd2sca4tKDRZhAtDKA==
X-Received: by 2002:a17:907:cca3:b0:ae9:bf1c:50a4 with SMTP id a640c23a62f3a-ae9ce078f47mr1615975666b.36.1753170088409;
        Tue, 22 Jul 2025 00:41:28 -0700 (PDT)
Received: from tumbleweed ([95.90.185.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79d6c6sm821224666b.32.2025.07.22.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:41:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/7] staging: rtl8723bs: DoIQK_8723B is empty
Date: Tue, 22 Jul 2025 09:41:15 +0200
Message-ID: <20250722074115.35044-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722074115.35044-1-straube.linux@gmail.com>
References: <20250722074115.35044-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function DoIQK_8723B is empty, remove the function and code that
uses it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.h       |  2 --
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 10 ----------
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h |  7 -------
 3 files changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.h b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
index fdbdd68edf2a..1e79ab9cb773 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.h
@@ -15,7 +15,6 @@ enum pwrtrack_method {
 };
 
 typedef void (*FuncSetPwr)(struct dm_odm_t *, enum pwrtrack_method, u8, u8);
-typedef void (*FuncIQK)(struct dm_odm_t *, u8, u8, u8);
 typedef void (*FuncLCK)(struct dm_odm_t *);
 typedef void (*FuncSwing)(struct dm_odm_t *, u8 **, u8 **, u8 **, u8 **);
 
@@ -27,7 +26,6 @@ struct txpwrtrack_cfg {
 	u8 RfPathCount;
 	u32 ThermalRegAddr;
 	FuncSetPwr ODM_TxPwrTrackSetPwr;
-	FuncIQK DoIQK;
 	FuncLCK PHY_LCCalibrate;
 	FuncSwing GetDeltaSwingTable;
 };
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 81149ab81904..34692cca33f5 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -142,15 +142,6 @@ static void setCCKFilterCoefficient(struct dm_odm_t *pDM_Odm, u8 CCKSwingIndex)
 	}
 }
 
-void DoIQK_8723B(
-	struct dm_odm_t *pDM_Odm,
-	u8 DeltaThermalIndex,
-	u8 ThermalValue,
-	u8 Threshold
-)
-{
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	odm_TxPwrTrackSetPwr88E()
  *
@@ -353,7 +344,6 @@ void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg *pConfig)
 	pConfig->ThermalRegAddr = RF_T_METER_8723B;
 
 	pConfig->ODM_TxPwrTrackSetPwr = ODM_TxPwrTrackSetPwr_8723B;
-	pConfig->DoIQK = DoIQK_8723B;
 	pConfig->PHY_LCCalibrate = PHY_LCCalibrate_8723B;
 	pConfig->GetDeltaSwingTable = GetDeltaSwingTable_8723B;
 }
diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
index 775095ad0921..c83442917f9d 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.h
@@ -18,13 +18,6 @@
 
 void ConfigureTxpowerTrack_8723B(struct txpwrtrack_cfg *pConfig);
 
-void DoIQK_8723B(
-	struct dm_odm_t *pDM_Odm,
-	u8 DeltaThermalIndex,
-	u8 ThermalValue,
-	u8 Threshold
-);
-
 void ODM_TxPwrTrackSetPwr_8723B(
 	struct dm_odm_t *pDM_Odm,
 	enum pwrtrack_method Method,
-- 
2.50.1

