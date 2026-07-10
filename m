Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD69F43B498
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702352; cv=none; b=eljoosSuXa8+SDvlc9PvlRCEjG+xKKjieXWABMLUmHET6fJazpsacfN5xsugSJ47IMazW0DUB9yifVFZM5rWSltIfcFb7eZH9KwzbRHK5ySU796RhZMMEFhvzZJI0f/vgi4DFphZtlCEnrkN5LVOsw+9wI774WYkAQOeSo+xKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702352; c=relaxed/simple;
	bh=AEESI2ci/GgzEU+ISLqvkMdFA9jLuD+J9/4ZnJT5gPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DdHTimuqicB8O0q+5UrgPEE/ej1o8IHVFwXzXykeVmumv0giNkS8ca3pn99RwBn67UfDZPist6hWIkdFNtfPVoKTfHsQ+5QQDaB1V3aekt5WwOXXyZEiz401BlFaRh98RVdFXkhJASjBmMnkBDPw3H6t8MreGCk5OjstqNkemh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGTqtIo3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGTqtIo3"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c15bf399d3bso144206866b.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702349; x=1784307149; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aSYaiBgqBeB2C0CbSwChMdQ/qMeElBjW/bR7A9b7gbQ=;
        b=ZGTqtIo3GU9yv5vIcEkGydx5Hk9KelwLVdGhXgpjjJNnPZ4LYZeFpQ8e0zAZjx2F9l
         zJqcGuWrgEkmJtCLOquKiqICu6Aej0jf0rVm/kwZWMhwuWdX1A33nrYHKAy6Rxo0Bqz5
         lw6dZT9v/K8UIcrQXT05+iDQ1QA6BCWhN4liCk07Z3t1uB3fl605QcY1KZ3MCpvD8osk
         0mc+0kj0WnfnozJswSl3/78AplWi/rmtC1NUM3/81kPi/AfMhNH3LxCBGSr6+Q7YtcQZ
         2rC2UowA/qF2Va13qsntxLlxJtJolBF+2dmbJP8AZ4MOmT5qJfqFz1Vyi87+oEX2BaV5
         E+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702349; x=1784307149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aSYaiBgqBeB2C0CbSwChMdQ/qMeElBjW/bR7A9b7gbQ=;
        b=qd/zasV42bf9S+N1KIquH/sNik4rxMGB0nodVsyQPOrMAq2s4MxKugrHeZkR7EUd+E
         UCCrgJ/o9Xe2zRzeXaRmSFidipR+qlAllmxVe7KpdC4UB0j7kUUsTBNkdIB2YztydmfL
         rlRHhcQHPc23iStlLrvstAX5NBbBLt4NOAvu7cF0z0pcilI1X8KWnmxMQbFs3qfcV+2i
         j7VoqaGz+Hf0NzvygRRQtmy7V/fNhaaScQQ/+IehKI4A5zrFVDkW/IiYWQSJkNGQBOWp
         9mRlE2RyH5PfqZTKpeJ8R58/i0SmEf1iO74r4Jid6jSv6e70Bt6GweeCulbThenXOO9s
         TIgg==
X-Gm-Message-State: AOJu0Yw3RuDXEWG3CIEbB1eafT1Y4QhFpA+/wW6kzDxHAHwe7hx9xcj0
	xqwym4y8Yhn9WJhzuT1SlZJkpQQ5EHktDq9PqW3jqoj1gN5B0R1ZYZp+
X-Gm-Gg: AfdE7cmtsUI4nD8jgL1a0DNfsq/XB+ZNZ3540Hod9AhIcI4dhSUAzv/4Pl93+HhuiXR
	lFtjZI0JPmuNlOYavnUHdj1bmPs0zMU7LVq2rMygZ06gwi5lDlD7nd47ls/WPJnAPErke3GvyR+
	/nyJA5to0sn2pPf6Ga0xHVYMnJUYeCLAVPP6m7L0YDVyM8NQtXxoY2wyuoC3yKgmcGQ3C39nkPM
	DQQp9awHeO/JpVI0Jc003gDhvMfE9s7Dm+/xcVodxQarmPNIVRqUuZG2qWyxPJp7LAqC4nkmL5U
	nfZ7V/ejiNMEJTSf40W76uCdvh/Oqq41mkYHHn+Q1++nyjK21F3yQmO9hAoZ1+8VTYH5dFC434o
	1Vbb0rhCJXKuyhWxJC3IMm5gqObuyPhME4CnNl05iayiiKgrQroGvHXKoHOvUUIqeFP9orLE/gI
	nC+0qC2k761Q==
X-Received: by 2002:a17:906:1005:20b0:c12:6ad6:6398 with SMTP id a640c23a62f3a-c15ce0c0389mr362852066b.34.1783702348839;
        Fri, 10 Jul 2026 09:52:28 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm643050266b.0.2026.07.10.09.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:52:28 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 1/5] staging: rtl8723bs: remove unused 'EEPROMCustomerID' from hal_com_data
Date: Fri, 10 Jul 2026 19:51:08 +0300
Message-ID: <20260710165220.68599-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710165220.68599-1-nikolayof23@gmail.com>
References: <20260710165220.68599-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is set during initialization but never used, so remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c      |  1 -
 drivers/staging/rtl8723bs/include/hal_data.h      |  1 -
 drivers/staging/rtl8723bs/include/hal_pg.h        |  1 -
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h  |  2 --
 5 files changed, 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index ecd66f090a50..367f3facb255 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1459,18 +1459,6 @@ void Hal_EfuseParseChnlPlan_8723B(
 	Hal_ChannelPlanToRegulation(padapter, padapter->mlmepriv.ChannelPlan);
 }
 
-void Hal_EfuseParseCustomerID_8723B(
-	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
-)
-{
-	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
-
-	if (!AutoLoadFail)
-		pHalData->EEPROMCustomerID = hwinfo[EEPROM_CustomID_8723B];
-	else
-		pHalData->EEPROMCustomerID = 0;
-}
-
 void Hal_EfuseParseXtal_8723B(
 	struct adapter *padapter, u8 *hwinfo, bool AutoLoadFail
 )
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 6f2aea984b30..80119559664f 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1046,7 +1046,6 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 	Hal_EfuseParseChnlPlan_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseXtal_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 	Hal_EfuseParseThermalMeter_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
-	Hal_EfuseParseCustomerID_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
 	Hal_EfuseParseVoltage_8723B(padapter, hwinfo, pEEPROM->bautoload_fail_flag);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index c93b21822ea7..273080ae62d1 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -162,7 +162,6 @@ struct hal_com_data {
 	u8 PackageType;
 
 	/*  EEPROM setting. */
-	u8 EEPROMCustomerID;
 	u8 EEPROMVersion;
 	u8 EEPROMRegulatory;
 	u8 EEPROMThermalMeter;
diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 7cb9c441fc01..c0fca8fc7270 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -39,7 +39,6 @@
 #define	EEPROM_RF_BOARD_OPTION_8723B		0xC1
 #define	EEPROM_RF_BT_SETTING_8723B		0xC3
 #define	EEPROM_VERSION_8723B			0xC4
-#define	EEPROM_CustomID_8723B			0xC5
 #define EEPROM_DEFAULT_DIFF			0XFE
 
 /* RTL8723BS */
diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 259ba63ba4bc..f2979cde78e5 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -215,8 +215,6 @@ void Hal_EfuseParseEEPROMVer_8723B(struct adapter *padapter, u8 *hwinfo,
 				   bool AutoLoadFail);
 void Hal_EfuseParseChnlPlan_8723B(struct adapter *padapter, u8 *hwinfo,
 				  bool AutoLoadFail);
-void Hal_EfuseParseCustomerID_8723B(struct adapter *padapter, u8 *hwinfo,
-				    bool AutoLoadFail);
 void Hal_EfuseParseXtal_8723B(struct adapter *padapter, u8 *hwinfo,
 			      bool AutoLoadFail);
 void Hal_EfuseParseThermalMeter_8723B(struct adapter *padapter, u8 *hwinfo,
-- 
2.54.0

