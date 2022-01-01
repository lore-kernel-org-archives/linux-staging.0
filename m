Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2DB2CA0
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:18:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id s1so59710563wrg.1
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eK7taryyQSQVDJH0tOpVoMb90mygew6Vz5QUqjyD+10=;
        b=A3vpCJPzTHTnzx3JxK4ba+oIxWkOqewjdxEFSjIvVIoCZMRq5vGyFfSBVwIHgS9RCc
         qmZKCnmB28KgQywNn74wrsp7822NlNQip2ry3YiOHmTSqoJusLN52LfcjoSPdNA9TLZH
         n3+TfUmda6iB/CNRwF+W+MDCgl1B1cBN8KWYPfkCEY1PWBHi+OEB5FtEEiPANZDCYX4G
         /gfNsgFa8cjdfDJZrfrdm47fKm0wRJ6spl7j9sSoN1+UG/EBWWTBi2hcPZHnxBqNp9G9
         ZK8KYYR7+8mQyDI1Qlwssxxr0Huu86dvQsIQktnenKCff9SyIvqyHTGcqNnrxMYGBkNw
         Vy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eK7taryyQSQVDJH0tOpVoMb90mygew6Vz5QUqjyD+10=;
        b=g+3tjyQZDkp2la2usy2dndmhYs1kA6CkJn3/kOsyYhSO+Zh7yGAiS8cK5Pi5CidfNw
         Nijm/8iRxlaldT9cjC0XDESideJXEqJTzQcfHljc5G/aBWY4cGcJVvWtfkhiyHA6I+wA
         VqZmVnvE1Gm/BbksOGsBGliDm9sE4hdshRBDLFJnttYyqr2Q1G/324bHoqisJ1ESLIaG
         8Oj/QRpyfPtuS/LFBU0hxBi4brXXDH1hJi77dHtlGKSWuNT6ONDzMOJQK+xH501dl+I5
         ub+w16OTHX/pgLObkAzmt0ihUAh1BukFQB3rZsqvxwMOvabB9kzLMYO2LS1x0uw592wt
         F1gA==
X-Gm-Message-State: AOAM533PW3xSg61AlY8ymKMmRwDfkLWSvsKi9b0PFvnXnbakt0WHo4EP
	o0BNG22j5Txt5IGReTcu0slz7gtonBQ=
X-Google-Smtp-Source: ABdhPJxBBUk1kWB1nOkNsVekcIfhxgoiz7bCp3zOW5hmK4GCz4GYNOcuRgsvVk8ay1q/qcuoSPql4A==
X-Received: by 2002:a05:6000:1112:: with SMTP id z18mr31091235wrw.129.1641025086424;
        Sat, 01 Jan 2022 00:18:06 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id u9sm30693651wmm.7.2022.01.01.00.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:18:06 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 3/7] staging: r8188eu: bTXPowerDataReadFromEEPORM is set but never used
Date: Sat,  1 Jan 2022 09:17:54 +0100
Message-Id: <20220101081758.9716-4-straube.linux@gmail.com>
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

The field bTXPowerDataReadFromEEPORM of struct hal_data_8188e is set
but never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

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

