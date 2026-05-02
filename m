Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895482E413
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 22:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777759303; cv=none; b=Yl9BZjOMQBHS1ZEKaclBJLx4EKRuGEKrHUGQPFq/F5wR3+D7Rwc+pt/78rhWcV65Ux9wHropkpiRSr/jhlcgZ4V+kQvOq9sO/kUnx91hYZ7NWrFLd/oRH38IWPHPXXb3P24JUtixV4OV3cdsDUnYAndzwhY96raNxd3jzojsJXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777759303; c=relaxed/simple;
	bh=toj1NDXNl6GlrtVcBbk8TxRjqzshgmqdEg61GmzTx5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ucpGqUxrD12cx7gpbhQYWP2BewWCf705cxdCyByNbbkACRXkF51+7qBRzOg4aqRLvC1kWjQgbn+Dz0ugL8mUcrFvpdg/+YROEHMBhg6Z4wA5YH/3Nrc6WoiOonjF28CaoRTWATQIHUKVB99nwVUi0LgLcbABBZ/rIg4886tpfy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUHNZzua; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUHNZzua"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a41099fa86so3244078e87.2
        for <linux-staging@lists.linux.dev>; Sat, 02 May 2026 15:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777759301; x=1778364101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJhNoLy4KH5KknBMvH7p8x28XXFd8k8kBHDvJzr25Mw=;
        b=AUHNZzuajRGJfozAe1rqbfB9cud+TlFNgBWGnwCYE7nsYCF7U6trwZhRxkvNqrZ+ix
         ik0NVScRoa+Uhjd27PxwPlUWbCnfvtRw+zFS2moRyVTCvBx/RJJM9xbPRXc0naMgVgLM
         NROHgnl4u7X5IgUlmSt9wcQMXdkm0N4yQftr9uPPCeFbwVuZw5QKKW6cWOhGnbKE16zg
         qWK/HBNANnaRBR8oEQr2SzSDOiqSOw7HkwDHUbAHEp2WtOxhFDUBFWyrRXQSbKKrsCjV
         zjjfM2iTkp4NbdG9cAkyqDuEiXl7Dtns8TrAaR2MmlSnbGRI/KVyn70zKuMqunG460As
         c4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777759301; x=1778364101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJhNoLy4KH5KknBMvH7p8x28XXFd8k8kBHDvJzr25Mw=;
        b=GCZEqATMROTc5VVFWjZUKJuYe6vLA88+fGafAhdhOzBTUNZwrACGGUpP20G4LtiMER
         WSzK8psADWqT8Kqw1o6cSMd7AbUITLi7TXNNBIb08XZ+GrOSrUMH2Kr4oQRjN82HtoC+
         MnamxHx/WWUrDKazGgWMWfiH3wOpVmQRdnLdNtGG0Eb6XYcI+FXGjC41JdQUB5juxZC7
         1gNqnxbFp+vyR9w+/mbAPEBWRRGQDVkYScCkyvB4mzztFbB9Rv8UF3tONvslsqQwx4HP
         yNfX41gZGlUs32IbsupxPKv9dE412nxd5sEk5tx7+VJMaUUJZpD4teD+Hw9z0cQbwJFG
         1K1g==
X-Gm-Message-State: AOJu0Yy+Tk0SI7mqttfO9+b28IulawYHFMsn+qyoPxmgxbbmdl106XwT
	eMfme1k946tJra2BUWb5SQDnhsEeamJwOW0/pMDnZ3jWQ+kNEB9lJgqiTGqbug==
X-Gm-Gg: AeBDieuaOjOKV4co5bC8zebiKes1Eds/KQyVgCXcdTwA1RKv30J6lG9WV8ROI4c+hYX
	Cjk7NyC8LwfwF25UJejOzwkTLbV5MFtUqUayCTgofDdLjw/D+DUXP/5YfmUv2z7ryNuADWcohn7
	LqgQc30GTHCKJWiAA5NU/4rloYuv9ZjnlMkNhLXCi+1JZYBR1dqSzQAc9Y1nq0yEi9lk3qMJmPq
	W3X9K2fw6yNTjyrZfhir3hNukErK1JUlFGurxQtgy7S//jRXjJZth/Lg9UfUfXa64AUJ+P+2gqx
	ouDdzlsj47jzqjURzumJtZ7Yc8goqxe8bqMfltzoYkfocSN6Y1dVWA2Ua+Hu/hjoxVXDQCxuqa2
	WMztmTYp1j0r1s1mElQTWgHTpP9x5BbuhHlBhT8LqBz1gJEJHkVM2lyNwuu81cj3pcNPm901g9b
	C9QJuoeV2McMlkB2meopRCEAb6GVMzQc1hjP8=
X-Received: by 2002:a05:6512:3b12:b0:5a2:836a:ca47 with SMTP id 2adb3069b0e04-5a8631b78d8mr1137853e87.20.1777759300615;
        Sat, 02 May 2026 15:01:40 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230d6asm1539179e87.23.2026.05.02.15.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 15:01:40 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 06/10] staging: rtl8723bs: remove unused CUTVersion from struct hal_version
Date: Sun,  3 May 2026 00:55:45 +0300
Message-ID: <20260502220056.59815-7-nikolayof23@gmail.com>
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

Remove the 'CUTVersion' field from 'struct hal_version', which is read
during initialization but is never used anywhere in the driver.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/HalVerDef.h     | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6828db1e3eed..29b120e192fb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -836,7 +836,6 @@ static struct hal_version ReadChipVersion8723B(struct adapter *padapter)
 
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	ChipVersion.chip_normal = ((value32 & RTL_ID) ? false : true);
-	ChipVersion.CUTVersion = (value32 & CHIP_VER_RTL_MASK)>>CHIP_VER_RTL_SHIFT; /*  IC version (CUT) */
 
 	/*  For regulator mode. by tynli. 2011.01.14 */
 	pHalData->RegulatorMode = ((value32 & SPS_SEL) ? RT_LDO_REGULATOR : RT_SWITCHING_REGULATOR);
diff --git a/drivers/staging/rtl8723bs/include/HalVerDef.h b/drivers/staging/rtl8723bs/include/HalVerDef.h
index 9428f82c248c..249acd83c89f 100644
--- a/drivers/staging/rtl8723bs/include/HalVerDef.h
+++ b/drivers/staging/rtl8723bs/include/HalVerDef.h
@@ -43,7 +43,6 @@ enum hal_vendor_e { /* tag_HAL_Manufacturer_Version_Definition */
 
 struct hal_version { /* tag_HAL_VERSION */
 	bool chip_normal;	/* true - normal chip, false - test chip */
-	enum hal_cut_version_e	CUTVersion;
 	u8 			ROMVer;
 };
 
-- 
2.54.0

