Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F12CA3
	for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 20:01:09 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id d198-20020a1c1dcf000000b0034569cdd2a2so13818623wmd.5
        for <linux-staging@lists.linux.dev>; Thu, 30 Dec 2021 12:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yuJQXdVZDt3Q260m2XKqRZ/xVabItJzV8eJCp2HOE80=;
        b=a/qQ/BOpGTjgv1UdHnPYFHbLQT9c1Otq7B7fCxAAOEhLGhGasfJqsG+CZbxbrBuQPN
         k/GgA31C2adT7kcVrNI2vp4E0StqPf8WmklzT/1vrnE+BCmK21s9AXOZJkn0w1YpWAuM
         suLXzvJ133+wRAexS0ruxDm+pvQpGDucHDEg6vQp8P/2n6qGrYRqIEzbdDrQ6g4rRIRr
         Vu2tkPxl6Be5L4Qpbu57bKxUdZZ5R8emSUN3ZpP9N9k4TI0lHIsMDM9N2fM4PWs9Zt7V
         kUBo1z63Hwisx8mRNr2J1wjx65B/Lzv+P3QI+/Vc9KqsNaOuIqJotpy7xPUYO8QhyaRQ
         dyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yuJQXdVZDt3Q260m2XKqRZ/xVabItJzV8eJCp2HOE80=;
        b=hQcVlN4x3It5d9gzpIqLSnh7YLr4Ditmd6BHfQV7hB4tmSyHFQDCapRgONj+0cVR5Z
         d27fr4uyrc4Z4RqvqutRWh/84UAl0bn8QrQxbJTvv9JVEwSmdpQxclcXqVfKrtZiBtY1
         OCXhvbEeXQSwCFtuQQOF2O6luFAiHZ1ntV/IcVE1A8Z1jIkr638/zu8rmJfbxxuQhCTM
         g0iug7SuSCcmRs+Uga0an6X92M/qqttzRiSkg8EA+drPZ+sKLRg5IXPtE/swFP3f+fDB
         lPLzsKe/86cjvrrRCFrhlPnCwqfMsKTvy4c/NAFj8v/LIJ5c5inavRWrguUTR+xPbOB2
         S2ww==
X-Gm-Message-State: AOAM531NOC/FOpljXe0lWFXO8LmV5DDrwsmiTQ35StTP5XySdr49Nhy0
	FNxvkJWY5CA24L4yXehASBA=
X-Google-Smtp-Source: ABdhPJzTzmAEOWGto84ZQhMkPWLnYMCokESqabDX/0iYn8CqT2OWwY6JBQewb6SoVB6ETrR8CplzJg==
X-Received: by 2002:a05:600c:3489:: with SMTP id a9mr26994643wmq.45.1640894467622;
        Thu, 30 Dec 2021 12:01:07 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id o8sm29042286wry.20.2021.12.30.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 12:01:07 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/7] staging: r8188eu: bTXPowerDataReadFromEEPORM is set but never used
Date: Thu, 30 Dec 2021 21:00:55 +0100
Message-Id: <20211230200059.13406-4-straube.linux@gmail.com>
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

The field bTXPowerDataReadFromEEPORM of struct hal_data_8188e is set
but never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 3 ---
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index d8d6547465a7..065c2701077d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1127,9 +1127,6 @@ void Hal_ReadTxPowerInfo88E(struct adapter *padapter, u8 *PROMContent, bool Auto
 
 	Hal_ReadPowerValueFromPROM_8188E(&pwrInfo24G, PROMContent, AutoLoadFail);
 
-	if (!AutoLoadFail)
-		pHalData->bTXPowerDataReadFromEEPORM = true;
-
 	for (ch = 0; ch < CHANNEL_MAX_NUMBER; ch++) {
 		hal_get_chnl_group_88e(ch, &group);
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 8b54f52f49e2..de58c85b8bdc 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -180,7 +180,6 @@ struct hal_data_8188e {
 	u16	EEPROMSDID;
 	u8	EEPROMRegulatory;
 
-	u8	bTXPowerDataReadFromEEPORM;
 	u8	EEPROMThermalMeter;
 	u8	bAPKThermalMeterIgnore;
 
-- 
2.34.1

