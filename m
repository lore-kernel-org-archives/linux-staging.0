Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BE62CA1
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 20:01:09 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id e5so52342271wrc.5
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 12:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4eCdntbo1fpqOMRKpRxKk5VqCLi7+91tE3jKZQQIpLM=;
        b=Zb7JmPF/OFLUDObEsqtwc0tpUtXSoCwHBynii3bEHf/Ez/3jw3wzk4W55FZopLLSIM
         6YV4gbqqASDb60kZzgXdBNHKM42cZTq0qSccuh6k9nzi1STD3i8LuckbzTtAgrRM2EWX
         A6aJALyKYDQhehvm17xQAOp5G3JAsiRw8b76mXoiZ3Y3dp+PC+mauH9PSRusQYnf6bre
         OLfI2BRshMNZj2QpGOrQ6IpQ3Y7o3oI10IToAOJGcBl+z+V7v+cnUEt3om2niJzAluAi
         qDhV+u+bPDY+tDiJMnhjICHJ8bWEdJs6OcPs4qaCFHL5pqJtvseA6qb11KKA/qFwmID7
         +e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4eCdntbo1fpqOMRKpRxKk5VqCLi7+91tE3jKZQQIpLM=;
        b=fVXKsxnWO+p/h96oUsfxlxpmGU8kUu3Iz3QHF7WpToK+ImzB7pxMC/DOV1b8qcAscn
         X/SR+DAneDM4PLpiiBQrWR17XZ9UgTSYBPGStVkflEu6y6+1bFC5Fh2wvfPeMYYhRwL1
         EJST/ASQeqg1q5n8AgeIf5HvICkrtLEwusUNUeo4pLqeW5wPaDkzOl/cYtapAXy+QdCs
         8Z55Q/jK+hLkNiVIn18BDFzPxYiX9B01ZAuak+wqgycTGp/0e5lzjRvuxXhcQdd5qQR3
         uYMBVKMkJSUDST/78OBf3Xe9XjHuH/lJ8FqwepgS72sxDfv0mJPpF8oIUQI7HLxmCHWg
         VOnA==
X-Gm-Message-State: AOAM533/GEmIXuBFNOFePmFs2GjazsCqU9Kn/knQ8p3ZoZrPldXfAoUT
	VROyFDDf8g7S5Q5M2awEcA0=
X-Google-Smtp-Source: ABdhPJxP+zzzLjXOP2uYo44csOHEbeJ1PXAddp0HVDH7XBbtp0K1A7dKLG7EGNNhWT+v1shTDTR0Tg==
X-Received: by 2002:a5d:5547:: with SMTP id g7mr16614764wrw.551.1640894468326;
        Thu, 30 Dec 2021 12:01:08 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id o8sm29042286wry.20.2021.12.30.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 12:01:08 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/7] staging: r8188eu: bAPKThermalMeterIgnore is set but never used
Date: Thu, 30 Dec 2021 21:00:56 +0100
Message-Id: <20211230200059.13406-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211230200059.13406-1-straube.linux@gmail.com>
References: <20211230200059.13406-1-straube.linux@gmail.com>
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

