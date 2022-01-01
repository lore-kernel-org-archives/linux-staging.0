Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7B02C80
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:18:08 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id f134-20020a1c1f8c000000b00345c05bc12dso15663814wmf.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V/ySfznrCVwP33nHINhDWA0To2qZRQwyQe3jvr0Q578=;
        b=V37BQwEVVnSS2lKE1SO4KaC7cKd5pd5SQVAuwhWCPRwvfKzcLfM78buuuYweTdm+6I
         RWtW/ga1F0/BHu359sg3H76w6+9jIgT1n0dSPf7fXJfEIe3gT/OXsEqOVVlaHcERLbqb
         0MjFG8E6BWS3Hi82bXHM2L4bFr+PMjWlwmBsmBsh3ixYObwDrCzTdMteKh0wKuG4vxC7
         v9iPW36XmIH5MmqFHmlsm0jAHsDqB1RZ+ewDUum1dAjR12fGEjeQI/DAXDF4FiwaHl/y
         i/tzkABEIGCVoxwCzhb4rLB/mhdr4iFT0NjBy0T6PEkFAoMngYlAMsm/kX9/KTUGU97K
         yvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V/ySfznrCVwP33nHINhDWA0To2qZRQwyQe3jvr0Q578=;
        b=DBMgpJ3DayJGe7lZVm6znyhrDBUWnTdJZFXoPXEkSxEJ6Dz4xcVRryTx4WuBsZm6tq
         OBvMrifwDOuRw6E7S8L8KBbiZySjkmT/voGHZj//Aqdk9XMo+qKj6KjLq5BbBys8MGxH
         5TmcXs1bldY3644iDYSfo+nlY+6MRwsWLIIlcFPApcHSeUL0eLwX4rqTl1i1vK9HxiwG
         cV9Zm0Mnd++zt8Ba3C+8Ytm3BtNhgsPHc86h/a7q8etyOUu5nzUR3WQHzkks/PZnN7DQ
         jYfEBhoZ4eoeeJCpiHESB0vRXB0Tuax12Px+YwaJ9InhOreXcF2goywHjIGWke72H/56
         /SOw==
X-Gm-Message-State: AOAM532CN8xrUl7J27CaOZb0TICyxXaqxv9KEheHeUN1/DxhgDFZkaTk
	tDCc2CJvLnOXGchTC7yPFMs=
X-Google-Smtp-Source: ABdhPJy1Ob1E9s+MfJ0wRuUANVYtAtgJGP6Jbjlh3QPDn83Qc6hu31IsZzKfpbX+vph7xnIVLkRang==
X-Received: by 2002:a1c:9d14:: with SMTP id g20mr32131418wme.134.1641025087270;
        Sat, 01 Jan 2022 00:18:07 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id u9sm30693651wmm.7.2022.01.01.00.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:18:06 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 4/7] staging: r8188eu: bAPKThermalMeterIgnore is set but never used
Date: Sat,  1 Jan 2022 09:17:55 +0100
Message-Id: <20220101081758.9716-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101081758.9716-1-straube.linux@gmail.com>
References: <20220101081758.9716-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field bAPKThermalMeterIgnore of struct hal_data_8188e is set but
never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 ++---
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 065c2701077d..cce291ca44b1 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1230,9 +1230,8 @@ void Hal_ReadThermalMeter_88E(struct adapter *Adapter, u8 *PROMContent, bool Aut
 	else
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
 
-	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail) {
-		pHalData->bAPKThermalMeterIgnore = true;
+	if (pHalData->EEPROMThermalMeter == 0xff || AutoloadFail)
 		pHalData->EEPROMThermalMeter = EEPROM_Default_ThermalMeter_88E;
-	}
+
 	DBG_88E("ThermalMeter = 0x%x\n", pHalData->EEPROMThermalMeter);
 }
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index de58c85b8bdc..40b3db34b8f2 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -181,7 +181,6 @@ struct hal_data_8188e {
 	u8	EEPROMRegulatory;
 
 	u8	EEPROMThermalMeter;
-	u8	bAPKThermalMeterIgnore;
 
 	bool	EepromOrEfuse;
 
-- 
2.34.1

